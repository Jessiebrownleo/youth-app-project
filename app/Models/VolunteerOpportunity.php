<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VolunteerOpportunity extends Model
{
    use HasFactory;

    protected $fillable = [
        'role',
        'location',
        'type',  
        'description',
        'requirements', 
    ];

    // Define the relationship between VolunteerOpportunity and Volunteers
    public function volunteers()
    {
        return $this->hasMany(Volunteer::class);
    }
}
