<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Riddle extends Model
{
    public $timestamps = false;
    use HasFactory;

    protected $fillable = ['name', 'answer', 'theme_id'];

    /**
     * Get the clues for the riddle.
     */
    public function clues()
    {
        return $this->hasMany(Clue::class);
    }
}
