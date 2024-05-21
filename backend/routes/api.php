<?php

use App\Http\Controllers\ClueController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\RiddleController;
use App\Http\Controllers\ThemeController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\AuthMiddleware;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// This route handles user login.
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// This endpoint retrieves all clues.
Route::get(
    '/clues',
    [ClueController::class, 'list']
);

// This endpoint retrieves clues by their id.
Route::get(
    '/clues/{id}',
    [ClueController::class, 'read']
);



// This endpoint retrieves the clues according to their "riddle_id".
Route::get(
    '/clues/riddle_id/{id}',
    [ClueController::class, 'getCluesByRiddleId']
);


// This endpoint retrieves all riddles.
Route::get(
    '/riddles',
    [RiddleController::class, 'list']
);

// This endpoint retrieves riddle by their id.
Route::get(
    '/riddles/{id}',
    [RiddleController::class, 'read']
);

// This endpoint retrieves riddle by their id associate to their theme.
Route::get(
    '/riddles/{id}/theme',
    [RiddleController::class, 'read']
);

// This endpoint retrieves all answer of the riddle by their id.
Route::get(
    '/riddles/answer/{id}',
    [RiddleController::class, 'getRiddleAnswer']
);

// This endpoint retrieves all themes.
Route::get(
    '/themes',
    [ThemeController::class, 'list']
);

// This endpoint retrieves all games.
Route::get(
    '/games',
    [GameController::class, 'list']
);

// This endpoint retrieves all users.
Route::get(
    '/users',
    [GameController::class, 'list']
);



// This endpoint is used to store/register new user.
Route::post('/users', [UserController::class, 'store']);

// This endpoint retrieves all users.
Route::get('/user', [UserController::class, 'UserDetails']);

// This endpoint handles the connexion of user.
Route::post('/login', [UserController::class, 'login']);

// This endpoint retrieves all users by their email.
Route::get('/get-username-by-email', [UserController::class, 'getUsernameByEmail']);

// This endpoint retrieves all riddles to a specific theme using its themeId.
Route::get('/riddles/theme/{themeId}', [RiddleController::class, 'getRiddlesByTheme']);

// This endpoint retrieves all score by their themes.
Route::get(
    '/scores/{themeId}',
    [GameController::class, 'getScoresByTheme']
);

// This endpoint is used to register a riddle.
Route::post('/add-riddle', [RiddleController::class, 'addingRiddle']);

// This endpoint handles the submission of game scores.
Route::post('/add-score', [GameController::class, 'submitScore']);

// This endpoint handles the submission of game scores
Route::post('/submit-score', [GameController::class, 'submitScore']);

// This endpoint is used to recover the CSRF token.
Route::middleware('web')->get('/csrf-token', [UserController::class, 'getCsrfToken']);
