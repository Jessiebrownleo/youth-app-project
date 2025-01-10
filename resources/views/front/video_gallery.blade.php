@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url({{ asset('uploads/' . $global_setting_data->banner) }})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Video Gallery</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Video Gallery</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-content pt_40 pb_45">
        <div class="container">
            <div class="row">

                @foreach ($video_categories as $video_category)
                    <div class="col-md-12 mb_15">
                        <h2 class="video-gallery-heading pt_30">{{ $video_category->name }}</h2>
                    </div>

                    @foreach ($video_category->rVideo as $video)
                        <div class="col-md-6 col-lg-3">
                            <div class="video-gallery-item mb_25 position-relative">
                                <div class="video-gallery-item-bg"></div>

                                <!-- Embedded YouTube video with iframe -->
                                <iframe class="i1" width="100%" height="250"
                                    src="https://www.youtube.com/embed/{{ $video->youtube_video_id }}" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>

                                <!-- Plus icon overlay -->
                                <div class="plus-icon position-absolute"
                                    style="top: 50%; left: 50%; transform: translate(-50%, -50%); color: white;">
                                    <i class="fas fa-search-plus"></i>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endforeach

            </div>
        </div>
    </div>
@endsection
