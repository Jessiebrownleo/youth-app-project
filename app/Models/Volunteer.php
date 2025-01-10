<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Volunteer extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'volunteer_opportunity_id',
        'address',
        'date_of_birth',
        'profession',
        'skills',
        'experience',
        'education',
        'facebook',
        'twitter',
        'linkedin',
        'instagram',
        'website',
        'github',
        'volunteer_interest',
        'availability',
        'previous_volunteering_experience',
        'detail',
        'cv_file',
        'languages_spoken',
        'emergency_contact',
        'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function volunteerOpportunity()
    {
        return $this->belongsTo(VolunteerOpportunity::class);
    }
}
