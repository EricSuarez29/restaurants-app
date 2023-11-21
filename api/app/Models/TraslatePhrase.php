<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TraslatePhrase extends Model
{
    use HasFactory;
    protected $casts = [
        'synonyms' => 'array'
    ];
    public $fillable = ['phrase', 'translation', 'description', 'synonyms', 'example', 'past', 'status'];
}
