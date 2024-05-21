<?php

namespace App\Http\Controllers;

use App\Models\Theme;

class ThemeController extends Controller
{
    public function list()
    {
       $themes = Theme::all();

       //var_dump($clues);
       return response()->json($themes);
    }
}

