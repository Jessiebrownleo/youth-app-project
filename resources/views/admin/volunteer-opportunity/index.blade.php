@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Volunteer Opportunities</h1>
                <div>
                    <a href="{{ route('admin_volunteer_opportunity_create') }}" class="btn btn-primary"><i class="fas fa-plus"></i> Add New</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="example1">
                                        <thead>
                                            <tr>
                                                <th>SL</th>
                                                <th>Role</th>
                                                <th>Location</th>
                                                <th>Type</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($opportunities as $opportunity)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $opportunity->role }}</td>
                                                    <td>{{ $opportunity->location }}</td>
                                                    <td>{{ ucfirst($opportunity->type) }}</td>
                                                    <td>{{ $opportunity->start_date }}</td>
                                                    <td>{{ $opportunity->end_date }}</td>

                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_volunteer_opportunity_edit', $opportunity->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>

                                                        <form id="delete-form-{{ $opportunity->id }}"
                                                            action="{{ route('admin_volunteer_opportunity_delete', $opportunity->id) }}"
                                                            method="POST" style="display: none;">
                                                            @csrf
                                                            @method('DELETE')
                                                        </form>

                                                        <a href="#" class="btn btn-danger btn-sm delete-button"
                                                            data-id="{{ $opportunity->id }}"><i class="fas fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        $(document).ready(function() {
            $('.delete-button').click(function(event) {
                event.preventDefault();

                var id = $(this).data('id');
                var form = $('#delete-form-' + id);

                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this volunteer opportunity!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
            });
        });
    </script>
@endsection
