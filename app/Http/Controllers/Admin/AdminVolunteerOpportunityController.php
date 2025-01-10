<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Volunteer;
use App\Models\VolunteerOpportunity;

class AdminVolunteerOpportunityController extends Controller
{
    public function index()
    {
        $opportunities = VolunteerOpportunity::all();
        return view('admin.volunteer-opportunity.index', compact('opportunities'));
    }


    public function create()
    {
        return view('admin.volunteer-opportunity.create');
    }

    public function create_submit(Request $request)
    {
        $request->validate([
            'role' => 'required',
            'location' => 'required',
            'type' => 'required',
        ]);
    
        $volunteerOpportunity = new VolunteerOpportunity();
        $volunteerOpportunity->role = $request->role;
        $volunteerOpportunity->location = $request->location;
        $volunteerOpportunity->type = $request->type;
        $volunteerOpportunity->description = $request->description;
        $volunteerOpportunity->start_date = $request->start_date;
        $volunteerOpportunity->end_date = $request->end_date;
        $volunteerOpportunity->save();
    
        return redirect()->route('admin_volunteer_opportunity_index')->with('success','Volunteer opportunity created successfully');
    }
    
    public function edit($id)
    {
        $opportunity = VolunteerOpportunity::findOrFail($id);
        return view('admin.volunteer-opportunity.edit', compact('opportunity'));
    }

    public function edit_submit(Request $request, $id)
    {
        $request->validate([
            'role' => 'required',
            'location' => 'required',
            'type' => 'required|in:full-time,part-time',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $opportunity = VolunteerOpportunity::findOrFail($id);

        $opportunity->role = $request->role;
        $opportunity->location = $request->location;
        $opportunity->type = $request->type;
        $opportunity->start_date = $request->start_date;
        $opportunity->end_date = $request->end_date;
        $opportunity->description = $request->description;
        
        $opportunity->update();

        return redirect()->route('admin_volunteer_opportunity_index')->with('success', 'Volunteer opportunity updated successfully');
    }

    public function delete($id)
    {
        $opportunity = VolunteerOpportunity::findOrFail($id);
        $opportunity->delete();
    
        return redirect()->back()->with('success', 'Volunteer opportunity deleted successfully');
    }
    
}
