<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
    <form class="form-inline mr-auto">
        <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
        </ul>
    </form>
    <ul class="navbar-nav navbar-right justify-content-end rightsidetop">
        <li class="nav-link">
            <a href="{{ route('home') }}" target="_blank" class="btn btn-warning">Front End</a>
        </li>
        <li class="text-white pt_5">
            Logged in as: {{ Auth::guard('web')->user()->name }}
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                @if (Auth::user()->photo && filter_var(Auth::user()->photo, FILTER_VALIDATE_URL))
                    <!-- Display URL directly -->
                    <img src="{{ Auth::user()->photo }}" alt="Profile Picture" class="rounded-circle-custom">
                @elseif (Auth::user()->photo)
                    <!-- Display local file path -->
                    <img src="{{ asset('uploads/' . Auth::user()->photo) }}" alt="Profile Picture"
                        class="rounded-circle-custom">
                @else
                    <!-- Default profile picture if none is set -->
                    <img src="{{ asset('uploads/default-user-icon.jpg') }}" alt="Default Profile Picture"
                        class="rounded-circle-custom">
                @endif
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="{{ route('user_profile') }}"><i class="far fa-user"></i> Edit
                        Profile</a></li>
                <li>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <a class="dropdown-item" href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                           this.closest('form').submit();"><i
                                class="fas fa-sign-out-alt"></i> Logout</a>
                    </form>
                </li>
            </ul>
        </li>

    </ul>
</nav>
