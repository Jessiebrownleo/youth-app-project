<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Cause;
use App\Models\CauseDonation;
use Illuminate\Http\Request;
use App\Models\Counter;
use App\Models\Event;
use App\Models\Special;
use App\Models\Feature;
use App\Models\HomePageItem;
use App\Models\Volunteer;

class AboutController extends Controller
{
    public function index()
{
    // Debugging: Fetching total counts for each section
    try {
        $causeCount = Cause::count();
        $causeDonationCount = CauseDonation::count();
        $volunteerCount = Volunteer::count();  // Assuming you have a Volunteer model
        $eventCount = Event::count();

        // Additional data as per your current logic
        $special = Special::where('id', 1)->first();
        $features = Feature::get();
        $home_page_item = HomePageItem::where('id', 1)->first();
        
        // // Check if the data is retrieved correctly
        // dd($causeCount, $causeDonationCount, $volunteerCount, $eventCount);

        // Pass the counts and other data to the view
        return view('front.about', compact('causeCount', 'causeDonationCount', 'volunteerCount', 'eventCount', 'special', 'features', 'home_page_item'));
    } catch (\Exception $e) {
        // Handle errors and output error message
        return back()->with('error', 'Error fetching counters: ' . $e->getMessage());
    }
}}
