<?php

namespace App\Http\Controllers;

use App\Models\Riddle;
use Illuminate\Http\Request;

class RiddleController extends Controller
{
    // Method that allows to recover all the riddles.
    public function list()
    {
        $riddles = Riddle::all();

        return response()->json($riddles);
    }

    // Méthod that allows to recover the riddles with their id.
    public function read($id)
    {
        $riddles = Riddle::find($id);

        return response()->json($riddles);
    }

    // Method that allows to recover the answer of the riddles with their id.
    public function getRiddleAnswer($id)
    {
        $riddle = Riddle::find($id);
        if ($riddle) {
            return response()->json($riddle->answer);
        } else {
            return response()->json('Énigme introuvable', 404);
        }
    }

    // Method that allows to recover the riddles according to their themeId.
    public function getRiddlesByTheme($themeId)
    {
        try {
            $riddles = Riddle::where('theme_id', $themeId)->get();
            return response()->json($riddles, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Une erreur s\'est produite lors de la récupération des énigmes.'], 500);
        }
    }

    // Method that allows a user to add a riddles.
    public function addingRiddle(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string',
            'answer' => 'required|string',
            'theme_id' => 'required|integer',
            'clues' => 'required|array',
        ]);

        // Creation of the new riddle.
        $riddle = Riddle::create([
            'name' => $validatedData['name'],
            'answer' => $validatedData['answer'],
            'theme_id' => $validatedData['theme_id'],
        ]);

        // Association of clues to the riddles by using de riddle_id.
        if (isset($validatedData['clues'])) {
            $clues = $validatedData['clues'];
            foreach ($clues as $clueData) {
                $riddle->clues()->create([
                    'name' => $clueData['name'],
                ]);
            }
        }

        // Return the JSON object of the riddle.
        return response()->json(['riddle' => $riddle], 201);
    }
}
