@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Project ({{ $cause_single->name }}) Photos</h1>
                <div>
                    <a href="{{ route('admin_cause_index') }}" class="btn btn-primary"><i class="fas fa-plus"></i> Back to
                        Projects</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_cause_photo_submit') }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="cause_id" value="{{ $cause_single->id }}">
                                    <div class="form-group mb-3">
                                        <label>Select Photo *</label>
                                        <div>
                                            <input type="file" name="photo" id="photoInput" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div>
                                            <img id="photoPreview" src="#" alt="Your Image Preview"
                                                style="display:none; width:100%; height:auto;" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="example1">
                                        <thead>
                                            <tr>
                                                <th>SL</th>
                                                <th>Photo</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($cause_photos as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <img src="{{ asset('uploads/' . $item->photo) }}" alt=""
                                                            class="w_150">
                                                    </td>
                                                    <td class="pt_10 pb_10">
                                                        <form action="{{ route('admin_cause_photo_delete', $item->id) }}"
                                                            method="POST" class="d-inline">
                                                            @csrf
                                                            @method('GET') <!-- Assuming you're using DELETE method -->
                                                            <button type="button"
                                                                class="btn btn-danger btn-sm delete-button"><i
                                                                    class="fas fa-trash"></i></button>
                                                        </form>
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

    <!-- SweetAlert Script -->
    <script>
        $(document).ready(function() {
            $('.delete-button').click(function(event) {
                event.preventDefault(); // Prevent the default action

                var form = $(this).closest('form'); // Get the closest form to the clicked button

                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        form.submit(); // Submit the form after confirmation
                    }
                });
            });
        });

        document.getElementById('photoInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('photoPreview');

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                preview.src = '#';
                preview.style.display = 'none';
            }
        });
    </script>
@endsection
