<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\View\View;
use Illuminate\Support\Facades\Log;


class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        // Check if 'remember' is present in the request
        $remember = $request->has('remember');

        // Attempt to authenticate the user with the remember option
        if ($request->authenticate($remember)) {
            // Regenerate session ID to prevent session fixation
            $request->session()->regenerate();

            // Redirect to intended route after successful login
            return redirect()->intended(RouteServiceProvider::HOME)
                            ->with('success', 'Login is successful.');
        }

        // If authentication fails, redirect back with an error
        return redirect()->back()->withErrors(['error' => 'Invalid credentials']);
    }


    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/login')->with('success', 'Logout is successful.');
    }
}
