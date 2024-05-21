<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Game;

class GameController extends Controller
{

    // Method that allows to recover all the games.
    public function list()
    {
        $games = Game::all();

        //var_dump($clues);
        return response()->json($games);
    }

// Method that allows of the user to submit their score.
public function submitScore(Request $request)
{
    // Validate the data provided in the HTTP request using the specified rules.
    $request->validate([

        // The score must be required and be an integer.
        'score' => 'required|integer',
        // The name must be required and be a string.
        'name' => 'required|string',
        // The theme code must be required and be an integer.
        'theme_code' => 'required|integer',
    ]);
    // Create a new "Game" object with the submitted data.
    $game = new Game([

        // Assign the score from the request.
        'score'=>  $request->score,
        // Assign the name from the request.
        'name'=>  $request->name,
        // Assign the theme code from the request.
        'theme_code'=>  $request->theme_code
    ]);
    // Save the "Game" object to the database, creating a new record.
    $game->save();
}

    // Method which allows to recover scores according to their theme.
    public function getScoresByTheme($themeId)
    {
        $scores = Game::where('theme_code', $themeId)->orderBy('score', 'desc')->limit(10)->get();

        return response()->json($scores);
    }
}
