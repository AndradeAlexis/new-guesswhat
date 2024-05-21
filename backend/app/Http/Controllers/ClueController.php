<?php

namespace App\Http\Controllers;

use App\Models\Clue;

class ClueController extends Controller
{
    public function list()
    {
        $clues = Clue::all();

        //var_dump($clues);
        return response()->json($clues);
    }


    public function read($id)
    {
        $clues = Clue::find($id);

        return response()->json($clues);
    }

    // Méthod to recover the clues by their "riddle_id" with the "where" méthod of Laravel.
    public function getCluesByRiddleId($riddle_id)
    {
        $clues = Clue::where('riddle_id', $riddle_id)->get();
        return response()->json($clues);
    }
}






