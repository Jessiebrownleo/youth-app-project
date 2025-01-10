@extends('admin.layouts.app')

@section('main_content')
<div class="main-content">
    <section class="section">
        <div class="section-header d-flex justify-content-between">
            <h1>Edit Volunteer Opportunity</h1>
            <div>
                <a href="{{ route('admin_volunteer_opportunity_index') }}" class="btn btn-primary"><i class="fas fa-eye"></i> View All</a>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('admin_volunteer_opportunity_edit_submit', $opportunity->id) }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Role *</label>
                                            <input type="text" class="form-control" name="role" value="{{ $opportunity->role }}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Location *</label>
                                            <input type="text" class="form-control" name="location" value="{{ $opportunity->location }}" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Type *</label>
                                            <select name="type" class="form-control" required>
                                                <option value="full-time" {{ $opportunity->type == 'full-time' ? 'selected' : '' }}>Full-time</option>
                                                <option value="part-time" {{ $opportunity->type == 'part-time' ? 'selected' : '' }}>Part-time</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Start Date *</label>
                                            <input type="date" class="form-control" name="start_date" value="{{ $opportunity->start_date }}" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>End Date *</label>
                                            <input type="date" class="form-control" name="end_date" value="{{ $opportunity->end_date }}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control" rows="4">{{ $opportunity->description }}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Update</button>
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
