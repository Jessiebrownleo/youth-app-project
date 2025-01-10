@extends('admin.layouts.app')

@section('main_content')
<div class="main-content">
    <section class="section">
        <div class="section-header d-flex justify-content-between">
            <h1>Create Volunteer Opportunity</h1>
            <div>
                <a href="{{ route('admin_volunteer_opportunity_index') }}" class="btn btn-primary"><i class="fas fa-plus"></i> View All</a>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin_volunteer_opportunity_create_submit') }}" method="post">
                                @csrf
                                <div class="form-group mb-3">
                                    <label>Role *</label>
                                    <input type="text" class="form-control" name="role" value="{{ old('role') }}">
                                </div>

                                <div class="form-group mb-3">
                                    <label>Location *</label>
                                    <input type="text" class="form-control" name="location" value="{{ old('location') }}">
                                </div>

                                <div class="form-group mb-3">
                                    <label>Type *</label>
                                    <select class="form-control" name="type">
                                        <option value="full-time" {{ old('type') == 'full-time' ? 'selected' : '' }}>Full-Time</option>
                                        <option value="part-time" {{ old('type') == 'part-time' ? 'selected' : '' }}>Part-Time</option>
                                    </select>
                                </div>

                                <div class="form-group mb-3">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" cols="30" rows="5">{{ old('description') }}</textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Start Date</label>
                                            <input type="date" class="form-control" name="start_date" value="{{ old('start_date') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>End Date</label>
                                            <input type="date" class="form-control" name="end_date" value="{{ old('end_date') }}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
