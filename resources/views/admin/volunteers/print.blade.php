@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <div class="section">
            <div class="section-header">
                <h1>Volunteer Data</h1>
            </div>
            <div class="table-responsive">
                <table class="table table-striped text-success table-border border-light">
                    <thead class="border-light">
                        <tr>
                            <th>Name</th>
                            <th>Volunteer Opportunity</th>
                            <th>Address</th>
                            <th>Skills</th>
                            <th>Experience</th>
                            <th>Education</th>
                            <th>Languages Spoken</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $data['name'] }}</td>
                            <td>{{ $data['role'] }}</td>
                            <td>{{ $data['address'] }}</td>
                            <td>{{ $data['skills'] }}</td>
                            <td>{{ $data['experience'] }}</td>
                            <td>{{ \Illuminate\Support\Str::limit($data['education'], 50, '...') }}</td>
                            <td>{{ $data['languages_spoken'] }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="mt-3">
                <a href="javascript:void(0);" id="printButton" class="btn btn-primary">
                    <i class="fa-solid fa-print"></i> Print
                </a>
            </div>
        </div>
    </div>

    <script>
        // Only trigger print when the "Print" button is clicked
        document.getElementById('printButton').addEventListener('click', function() {
            window.print();
        });
    </script>
@endsection
