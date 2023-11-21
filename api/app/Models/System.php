<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class System extends Model
{
    use HasFactory;

    public $fillable = ['name', 'description', 'release_date', 'latest_version', 'owner', 'price', 'status'];
}
