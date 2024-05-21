<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clue extends Model
{
    public $timestamps = false;
    use HasFactory;

    protected $fillable = ['name'];


    public function riddle()
    {
        return $this->belongsTo(Riddle::class);
    }
}
