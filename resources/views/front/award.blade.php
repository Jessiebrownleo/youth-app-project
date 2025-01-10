@extends('front.layouts.app')

@section('main_content')
    <!-- START AWARDS SECTION -->
    <section class="section-awards text-center">
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-12 col-md-10 col-lg-7">
                    <div class="header-section">
                        <div class="content">
                            <h2 class="title">Youth Achievement</h2>
                            <p class="description">We are proud to recognize three outstanding youths
                                who have submitted powerful projects that are making a positive impact on our community.
                                Most of their projects have been approved by the admin, and their contributions are driving
                                meaningful change.</p>
                        </div>
                        <span class="back-title">Awards</span>
                    </div>
                </div>
            </div>
            <div class="row no-gutters align-items-lg-center justify-content-around">
                <!-- start single award -->
                <div class="col-12 col-md-6 col-lg-4 mt-30">
                    @if ($topUsers->count() > 1)
                        <div class="single-award">
                            <img class="icon" src="{{ $topUsers[1]->photo ? asset('uploads/' . $topUsers[1]->photo) : asset('uploads/default-user-icon.jpg') }}" alt="">
                            <h3 class="title">{{ $topUsers[1]->name }}</h3>
                            <span class="date">Top 2</span>
                            <p class="description">{{ $topUsers[1]->quote ?? 'No description available.' }}</p>
                        </div>
                    @endif
                </div>

                <!-- Second (Top) User in the Center -->
                <div class="col-12 col-md-6 col-lg-4 mt-30">
                    @if ($topUsers->isNotEmpty())
                        <div class="single-award active">
                            <img class="icon" src="{{ $topUsers[0]->photo ? asset('uploads/' . $topUsers[0]->photo) : asset('uploads/default-user-icon.jpg') }}" alt="">
                            <h3 class="title">{{ $topUsers[0]->name }}</h3>
                            <span class="date">Top 1</span>
                            <p class="description">{{ $topUsers[0]->quote ?? 'No description available.' }}</p>
                            <a class="read-more" href="#">Read More</a>
                        </div>
                    @endif
                </div>

                <!-- Third User -->
                <div class="col-12 col-md-6 col-lg-4 mt-30">
                    @if ($topUsers->count() > 2)
                        <div class="single-award">
                            <img class="icon" src="{{ $topUsers[2]->photo ? asset('uploads/' . $topUsers[2]->photo) : asset('uploads/default-user-icon.jpg') }}" alt="">
                            <h3 class="title">{{ $topUsers[2]->name }}</h3>
                            <span class="date">Top 3</span>
                            <p class="description">{{ $topUsers[2]->quote ?? 'No description available.' }}</p>
                        </div>
                    @endif
                </div>
                <!-- / end single award -->
            </div>
        </div>
    </section>
    <!-- / END AWARDS SECTION -->
@endsection
