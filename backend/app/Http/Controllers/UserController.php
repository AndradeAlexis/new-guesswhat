<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Auth;
use Laravel\Sanctum\PersonalAccessTokenFactory;
use Illuminate\Auth\AuthenticationException;
class UserController extends Controller

{
    // Method wich allows to create a user.
    public function store(Request $request)

    {
        // Validation of data in relation to the rules applied.
        $request->validate([
            'password' => 'required|string|min:8',
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
        ]);
        $defaultRole = 'joueur';
        // If the submitted data passes validation, a new user object ($user) is created.
        // The password is hashed with the function "Hash::make()" of Laravel.
        $user = new User([
            'password' => Hash::make($request->password),
            'name' => $request->name,
            'email' => $request->email,
            'role' => $defaultRole
        ]);
        // The user object is save in database with the function "save()" of Laravel.
        $user->save();

        return response()->json(['message' => 'Utilisateur créé avec succès'], 201);
    }

    // Methode which allows a user to log in.
    public function login(Request $request)
    {
        // Recover the data submitted in the POST request.
        $credentials = $request->only('email', 'password');
        // Check if the information are valid with "Auth" of Laravel, if authentication succeeds this generates an access token with createToken méthod.
        if (Auth::attempt($credentials)) {
            $user = auth()->user();
            $token = $user->createToken('authToken')->accessToken;

            // Recovery the user role.
            $role = $user->role;
            // JSON response is returned with the access token ('access_token') and the user role ('role').
            return response()->json([
                'access_token' => $token,
                'role' => $role,
            ], 200);
        }
        // If authentication fails, a JSON response with HTTP status code 401 is returned to indicate that authentication failed.
        return response()->json(['error' => 'Unauthorized'], 401);
    }




    public function UserDetails()
    {
        // Retrieve user details from database.
        $users = User::all();

        // JSON response is returned with the information of the user.
        return response()->json($users);
    }

    //  Method wich allows recover a user by his email.
    // The request parameter is used to retrieve data from the incoming HTTP request.
    public function getUsernameByEmail(Request $request)
    {
        try {

            $email = $request->input('email');
            $user = User::where('email', $email)->first();

            if ($user) {
                // If a matching user is found, it is stored in the $user variable.
                return response()->json(['username' => $user->name], 200);
            } else {
                // If a user is not found, an alert message is displayed.
                return response()->json(['message' => 'User not found'], 404);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred'], 500);
        }
    }

    //  Method wich allows recover a role by the email of the user.
    public function getUserRoleFromEmail(Request $request)
    {
        // Recover the email.
        $email = $request->input('email');


        // Using the "where" method to found user by his email and store de value in "$email".
        $user = User::where('email', $email)->first();

        if ($user) {
            // If a matching user is found the method returns a JSON response containing the role of this user.
            return response()->json(['role' => $user->role]);
        } else {
            // If a matching user is not found the method returns a JSON response indicating that the user was not found.
            return response()->json(['error' => 'Utilisateur non trouvé'], 404);
        }
    }
    // Recover de CSRF token and return it as a JSON response.
    public function getCsrfToken(Request $request)
    {
        return response()->json(['csrf_token' => csrf_token()]);
    }
}
