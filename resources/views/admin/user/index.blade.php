@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Users</h1>
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
                                                <th>Photo</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Block</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($users as $user)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <img src="{{ asset('uploads/' . $user->photo) }}" alt=""
                                                            class="w_100">
                                                    </td>
                                                    <td>{{ $user->name }}</td>
                                                    <td>{{ $user->email }}</td>
                                                    <td>
                                                        <div class="outerDivFull">
                                                            <form action="{{ route('admin_user_block', $user->id) }}"
                                                                method="GET" class="block-form">
                                                                @csrf
                                                                <input type="hidden" name="block" class="block-input"
                                                                    value="{{ $user->block ? 'block' : 'unblock' }}">
                                                                <div class="switchToggle">
                                                                    <!-- Checkbox should be checked if the user is blocked (Yes means blocked) -->
                                                                    <input type="checkbox" id="switch-{{ $user->id }}"
                                                                        class="block-checkbox"
                                                                        {{ $user->block ? 'checked' : '' }}>
                                                                    <label for="switch-{{ $user->id }}">Toggle</label>
                                                                </div>
                                                            </form>
                                                        </div>
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
        // Handle block toggle changes
        document.querySelectorAll('.block-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const form = this.closest('.block-form');
                const blockInput = form.querySelector('.block-input');

                // Reversed logic: If checked, block the user; if unchecked, unblock
                blockInput.value = this.checked ? 'block' : 'unblock';
                form.submit();
            });
        });
    </script>
@endsection
