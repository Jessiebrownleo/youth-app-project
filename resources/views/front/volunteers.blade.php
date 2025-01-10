@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url({{ asset('uploads/' . $global_setting_data->banner) }})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Volunteers</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Volunteers</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="team pt_70">
        <div class="container">
            <div class="row">
                @foreach ($volunteers as $volunteer)
                    <div class="col-lg-3 col-md-6">
                        <div class="item">
                            <div class="photo">
                                <img src="{{ asset('uploads/' . $volunteer->user->photo) }}" alt="" />
                            </div>
                            <div class="text">
                                <h2><a href="{{ route('volunteer', $volunteer->id) }}">{{ $volunteer->name }}</a></h2>
                                <div class="designation">{{ $volunteer->profession }}</div>
                                <div class="social">
                                    <ul>
                                        @if ($volunteer->facebook)
                                            <li><a href="{{ $volunteer->facebook }}"><i class="fab fa-facebook-f"></i></a>
                                            </li>
                                        @endif
                                        @if ($volunteer->twitter)
                                            <li><a href="{{ $volunteer->twitter }}"><i class="fab fa-twitter"></i></a></li>
                                        @endif
                                        @if ($volunteer->linkedin)
                                            <li><a href="{{ $volunteer->linkedin }}"><i class="fab fa-linkedin-in"></i></a>
                                            </li>
                                        @endif
                                        @if ($volunteer->instagram)
                                            <li><a href="{{ $volunteer->instagram }}"><i class="fab fa-instagram"></i></a>
                                            </li>
                                        @endif
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

                <div class="col-md-12">
                    {{ $volunteers->links() }}
                </div>
            </div>
        </div>
    </div>

    <div class="container pt-4">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-striped text-success table-border border-light">
                        <thead class="border-light">
                            <tr>
                                <th scope="col">Role</th>
                                <th scope="col">Location</th>
                                <th scope="col">Type</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($volunteer_opportunities as $opportunity)
                                <tr>
                                    <td class="align-middle">
                                        <a href="#"
                                            class="text-success font-weight-bold">{{ $opportunity->role }}</a>
                                    </td>
                                    <td class="align-middle">{{ $opportunity->location }}</td>
                                    <td class="align-middle">{{ $opportunity->type }}</td>
                                    <td class="align-middle">
                                        <!-- Become a volunteer button -->
                                        @auth
                                            @php
                                                // Fetch the authenticated user's volunteer data
                                                $volunteer = Auth::user()->volunteer;
                                            @endphp

                                            @if (!$volunteer || (!$volunteer->cv_file && $volunteer->status !== 'approve'))
                                                <a href="#" class="btn btn-outline-info btn-sm" data-toggle="modal"
                                                    data-target="#volunteerModal">Apply Now</a>
                                            @endif
                                        @endauth
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-12 text-center pt-4">
                <p>We are always on the lookout for talented folk to join our team. Apply to: <a
                        href="mailto:info@yrdp.org">info@yrdp.org</a></p>
            </div>
        </div>
    </div>


    <!-- Modal for CV Upload (moved outside of the loop) -->
    <div class="modal fade" id="volunteerModal" tabindex="-1" role="dialog" aria-labelledby="volunteerModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="volunteerModalLabel">Upload your CV to Become a Volunteer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- CV upload form -->
                    <form action="{{ route('volunteer.upload') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <label for="cv">Upload CV</label>
                            <input type="file" name="cv" class="form-control" required>
                            <input type="hidden" name="volunteer_opportunity_id"
                                value="{{ $volunteer_opportunities->first()->id }}">

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
@endsection
