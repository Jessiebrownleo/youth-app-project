<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin;
use App\Mail\Websitemail;
use App\Models\Cause;
use App\Models\CauseDonation;
use App\Models\Event;
use App\Models\User;
use App\Models\Subscriber;
use App\Models\Volunteer;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function dashboard()
    { 
        // Fetch data from the database for subscribers
        $subscribers = Subscriber::select(DB::raw("count(*) as count, status"))
            ->groupBy('status')
            ->pluck('count', 'status')
            ->toArray(); // Return as associative array
    
        // For causes created in the current year
        $causes = Cause::select(DB::raw("count(*) as count, MONTH(created_at) as month"))
            ->groupBy('month')
            ->pluck('count', 'month')
            ->toArray();
    
        // Ensure all 12 months are represented for causes
        $months = range(1, 12);
        $causes = array_replace(array_fill_keys($months, 0), $causes);
    
        // For donations
        $causeDonations = CauseDonation::select(DB::raw("sum(price) as total, MONTH(created_at) as month"))
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray();
    
        // Ensure all 12 months are represented for donations
        $causeDonations = array_replace(array_fill_keys($months, 0), $causeDonations);
    
        // Fetch volunteer data for the DataTables with a join to volunteer_opportunities and users
        if (request()->ajax()) {
            $volunteers = Volunteer::select('volunteers.*', 'volunteer_opportunities.role', 'users.name as user_name')
                ->join('volunteer_opportunities', 'volunteers.volunteer_opportunity_id', '=', 'volunteer_opportunities.id')
                ->join('users', 'volunteers.user_id', '=', 'users.id') // Join to get 'name' from users table
                ->latest()
                ->get();

            return DataTables::of($volunteers)
                ->addIndexColumn()
                ->addColumn('name', function($row) {
                    return $row->user_name; 
                })
                ->rawColumns(['name'])
                ->make(true);
        }


        // Return view with the data passed to it
        return view('admin.dashboard', [
            'subscribers' => json_encode(array_values($subscribers)), 
            'causes' => json_encode(array_values($causes)), 
            'causeDonations' => json_encode(array_values($causeDonations)), 
            'total_events' => Event::count(),
            'total_volunteers' => Volunteer::count(),
            'total_users' => User::count(),
            'total_causes' => Cause::count(),
            'total_donations' => CauseDonation::sum('price'),
            'total_subscribers' => Subscriber::count(),
        ]);
    }
    
    public function getSubscribersData(Request $request)
    {
        $filter = $request->filter;
    
        // Start the query
        $subscribersQuery = Subscriber::query();
    
        // Initialize the month range for each quarter
        $quarterMonths = [
            'quarter1' => [1, 2, 3],
            'quarter2' => [4, 5, 6],
            'quarter3' => [7, 8, 9],
            'quarter4' => [10, 11, 12], 
        ];
    
        // If "all" filter is selected
        if ($filter == 'all') {
            $subscribers = $subscribersQuery
                ->select(DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month, status, COUNT(*) as count"))
                ->groupBy('month', 'status')
                ->get();
        } elseif (array_key_exists($filter, $quarterMonths)) {
            // Filter by quarter months
            $months = $quarterMonths[$filter];
            $subscribers = $subscribersQuery
                ->select(DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month, status, COUNT(*) as count"))
                ->whereIn(DB::raw('MONTH(created_at)'), $months)
                ->groupBy('month', 'status')
                ->get();
        } else {
            // Handle invalid filter
            return response()->json(['data' => []]);
        }
    
        // Fill missing months with zero data
        $monthsInQuarter = $quarterMonths[$filter] ?? [];
        $formattedData = [];
        
        // Initialize an array for all months in the quarter with zero counts
        foreach ($monthsInQuarter as $month) {
            $formattedData[$month] = 0; // Set default to zero for all months
        }
    
        // Overwrite with actual data from the database query
        foreach ($subscribers as $subscriber) {
            $monthNumber = (int) date('n', strtotime($subscriber->month)); // Extract numeric month
            $formattedData[$monthNumber] = $subscriber->count;
        }
    
        // Convert associative array into format required by the chart
        $finalFormattedData = [];
        foreach ($formattedData as $month => $count) {
            $finalFormattedData[] = [
                'x' => $month, // The month (1-12)
                'y' => $count, // Subscriber count
            ];
        }
    
        return response()->json([
            'data' => $finalFormattedData
        ]);
    }
    

    
    public function getCausesData(Request $request)
    {
        $filter = $request->filter;
        $causesQuery = Cause::query();

        // Filter by quarter or year
        if ($filter != 'year') {
            $quarterMonths = $this->getQuarterMonths($filter);
            $causesQuery->whereIn(DB::raw('MONTH(created_at)'), $quarterMonths);
        }

        $causes = $causesQuery->select(DB::raw("count(*) as count, MONTH(created_at) as month"))
            ->groupBy('month')
            ->pluck('count', 'month')
            ->toArray();

        // Format the causes data
        $formattedCauses = [];
        foreach ($causes as $month => $count) {
            $formattedCauses[] = [
                'x' => $month, // Month (1 to 12)
                'y' => $count // Count of causes
            ];
        }

        return response()->json([
            'data' => $formattedCauses // Return formatted data
        ]);
    }

    
    public function getDonationsData(Request $request)
    {
        $filter = $request->filter;
        $donationsQuery = CauseDonation::query();

        if ($filter != 'year') {
            $quarterMonths = $this->getQuarterMonths($filter);
            $donationsQuery->whereIn(DB::raw('MONTH(created_at)'), $quarterMonths);
        }

        $donations = $donationsQuery->select(DB::raw("sum(price) as total, MONTH(created_at) as month"))
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray();

        // Format the donations data
        $formattedDonations = [];
        foreach ($donations as $month => $total) {
            $formattedDonations[] = [
                'x' => $month, // Month (1 to 12)
                'y' => $total // Total donations
            ];
        }

        return response()->json([
            'data' => $formattedDonations // Return formatted data
        ]);
    }

    
    protected function getQuarterMonths($quarter)
    {
        $quarters = [
            'quarter1' => [1, 2, 3],
            'quarter2' => [4, 5, 6],
            'quarter3' => [7, 8, 9],
            'quarter4' => [10, 11, 12],
        ];
    
        return $quarters[$quarter] ?? [];
    }

    // Volunteer Method is started
    public function updateStatus(Request $request, $id)
    {
        // Validate the status field
        $validated = $request->validate([
            'status' => 'required|in:approve,reject',
        ]);
    
        // Find the volunteer by ID and update the status
        $volunteer = Volunteer::findOrFail($id);
        $volunteer->status = $request->input('status');
        $volunteer->save();
    
        return redirect()->back()->with('success', 'Volunteer status updated successfully.');
    }

    public function printVolunteer($id)
    {
        // Fetch the specific volunteer by ID with related user and volunteerOpportunity
        $volunteer = Volunteer::with(['user', 'volunteerOpportunity'])->findOrFail($id);
    
        // Prepare the data to pass to the view
        $data = [
            'id' => $volunteer->id,
            'name' => $volunteer->user->name,
            'role' => $volunteer->volunteerOpportunity->role ?? 'N/A',
            'address' => $volunteer->address ?? 'N/A',
            'skills' => $volunteer->skills ?? 'N/A',
            'experience' => $volunteer->experience ?? 'N/A',
            'education' => $volunteer->education ?? 'N/A',
            'languages_spoken' => $volunteer->languages_spoken ?? 'N/A',
        ];
    
        // Return the view with the volunteer data
        return view('admin.volunteers.print', compact('data'));
    }

    public function edit_profile()
    {
        return view('admin.edit_profile');
    }


    public function edit_profile_submit(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
        ]);

        $admin_data = Admin::find(Auth::guard('admin')->user()->id);

        if($request->photo != null) {
            $request->validate([
                'photo' => 'image|mimes:jpg,jpeg,png',
            ]);
            //dd($request->photo->extension());
            
            if (Auth::guard('admin')->user()->photo != null) {
                $oldPhotoPath = public_path('uploads/' . Auth::guard('admin')->user()->photo);
                if (file_exists($oldPhotoPath)) {
                    unlink($oldPhotoPath);
                }
            }            

            $final_name = time().'.'.$request->photo->extension();
            $request->photo->move(public_path('uploads'), $final_name);
            $admin_data->photo = $final_name;
        }

        if($request->password != '' || $request->password_confirmation != '') {
            $request->validate([
                'password' => 'required',
                'password_confirmation' => 'required|same:password',
            ]);
            $admin_data->password = Hash::make($request->password);
        }

        $admin_data->name = $request->name;
        $admin_data->email = $request->email;
        $admin_data->update();

        return redirect()->back()->with('success','Profile updated successfully');
    }

    public function login()
    {
        return view('admin.login');
    }
    public function login_submit(Request $request)
    {
        //dd($request->all());
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $check = $request->all();
        $data = [
            'email' => $check['email'],
            'password' => $check['password'],
        ];
        
        if(Auth::guard('admin')->attempt($data)) {
            return redirect()->route('admin_dashboard')->with('success','Login Successfull');
        } else {
            return redirect()->route('admin_login')->with('error','Invalid Credentials');
        }
    }
    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin_login')->with('success','Logout Successfully');
    }

    public function forget_password()
    {
        return view('admin.forget-password');
    }

    public function forget_password_submit(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        $admin_data = Admin::where('email',$request->email)->first();
        if(!$admin_data) {
            return redirect()->back()->with('error','Email not found');
        }

        $token = hash('sha256',time());
        $admin_data->token = $token;
        $admin_data->update();

        $reset_link = url('admin/reset-password/'.$token.'/'.$request->email);
        $subject = "Reset Password";
        $message = "Please click on below link to reset your password<br><br>";
        $message .= "<a href='".$reset_link."'>Click Here</a>";

        Mail::to($request->email)->send(new Websitemail($subject,$message));

        return redirect()->back()->with('success','Reset password link sent on your email');
    }

    public function reset_password($token,$email)
    {
        $admin_data = Admin::where('email',$email)->where('token',$token)->first();
        if(!$admin_data) {
            return redirect()->route('admin_login')->with('error','Invalid token or email');
        }
        return view('admin.reset-password', compact('token','email'));
    }

    public function reset_password_submit(Request $request)
    {
        $request->validate([
            'password' => 'required',
            'password_confirmation' => 'required|same:password',
        ]);

        $admin_data = Admin::where('email',$request->email)->where('token',$request->token)->first();
        $admin_data->password = Hash::make($request->password);
        $admin_data->token = "";
        $admin_data->update();

        return redirect()->route('admin_login')->with('success','Password reset successfully');
    }
}
