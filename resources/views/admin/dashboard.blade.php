@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Dashboard</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-heart"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Projects</h4>
                            </div>
                            <div class="card-body">
                                {{ $total_causes }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-danger">
                            <i class="fas fa-calendar"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Events</h4>
                            </div>
                            <div class="card-body">
                                {{ $total_events }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-success">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Users</h4>
                            </div>
                            <div class="card-body">
                                {{ $total_users }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Subscribers Status Chart -->
                <div class="col-lg-6 col-md-6">
                    <div class="panel panel-default">
                        <div class="section-header">
                            <h1>Subscribers Status</h1>
                        </div>
                        <div class="panel-body">
                            <select id="subscribersFilter" class="form-control">
                                <option value="all">All</option>
                                <option value="quarter1">Q1</option>
                                <option value="quarter2">Q2</option>
                                <option value="quarter3">Q3</option>
                                <option value="quarter4">Q4</option>
                            </select>
                            <div id="subscribersChart" style="height: 270px;"></div>
                        </div>
                    </div>
                </div>

                <!-- Quarterly Causes Chart -->
                <div class="col-lg-6 col-md-6">
                    <div class="panel panel-default">
                        <div class="section-header">
                            <h1>Quarterly Projects</h1>
                        </div>
                        <div class="panel-body">
                            <select id="causesFilter" class="form-control">
                                <option value="year">Year</option>
                                <option value="quarter1">Q1</option>
                                <option value="quarter2">Q2</option>
                                <option value="quarter3">Q3</option>
                                <option value="quarter4">Q4</option>
                            </select>
                            <div id="causesChart" style="height: 270px;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <div class="row">
                <!-- Monthly Donations Chart -->
                <div class="col-lg-12 col-md-12">
                    <div class="panel panel-default">
                        <div class="section-header">
                            <h1>Project Donations</h1>
                        </div>
                        <div class="panel-body">
                            <select id="donationsFilter" class="form-control">
                                <option value="year">Year</option>
                                <option value="quarter1">Q1</option>
                                <option value="quarter2">Q2</option>
                                <option value="quarter3">Q3</option>
                                <option value="quarter4">Q4</option>
                            </select>
                            <div id="donationsChart" style="height: 270px;"></div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Include Shield UI CSS and JS -->
            <link rel="stylesheet" type="text/css"
                href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
            <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

            <script type="text/javascript">
                jQuery(function($) {
                    // Use dynamic data passed from Laravel backend
                    var subscribersData = {!! $subscribers !!};
                    var causesData = {!! $causes !!};
                    var donationsData = {!! $causeDonations !!};

                    // URLs generated dynamically using Laravel's route helper
                    var subscribersDataUrl = "{{ route('subscribers.data') }}";
                    var causesDataUrl = "{{ route('causes.data') }}";
                    var donationsDataUrl = "{{ route('donations.data') }}";

                    // Render initial charts
                    renderSubscribersChart(subscribersData);
                    renderCausesChart(causesData);
                    renderDonationsChart(donationsData);

                    $('#subscribersFilter').change(function() {
                        var filter = $(this).val();
                        console.log("Selected filter: " + filter); // Debugging

                        updateChart(subscribersDataUrl, filter, "#subscribersChart", "area", "Subscribers");
                    });



                    // Causes Filter Change Event
                    $('#causesFilter').change(function() {
                        var filter = $(this).val();
                        updateChart(causesDataUrl, filter, "#causesChart", "bar", "Causes Created");
                    });

                    // Donations Filter Change Event
                    $('#donationsFilter').change(function() {
                        var filter = $(this).val();
                        updateChart(donationsDataUrl, filter, "#donationsChart", "line", "Cause Donations");
                    });

                    // Function to render initial Subscribers Chart
                    function renderSubscribersChart(data) {
                        $("#subscribersChart").shieldChart({
                            primaryHeader: {
                                text: "Subscribers Status"
                            },
                            axisX: {
                                categoricalValues: ["Inactive", "Active"] // Labels for the chart
                            },
                            dataSeries: [{
                                seriesType: "area",
                                collectionAlias: "Subscribers",
                                data: data
                            }]
                        });
                    }


                    // Function to render initial Causes Chart
                    function renderCausesChart(data) {
                        $("#causesChart").shieldChart({
                            primaryHeader: {
                                text: "Causes Created"
                            },
                            dataSeries: [{
                                seriesType: "bar",
                                collectionAlias: "Causes",
                                data: data
                            }]
                        });
                    }

                    // Function to render initial Donations Chart
                    function renderDonationsChart(data) {
                        $("#donationsChart").shieldChart({
                            primaryHeader: {
                                text: "Cause Donations"
                            },
                            dataSeries: [{
                                seriesType: "line",
                                collectionAlias: "Donations",
                                data: data
                            }]
                        });
                    }

                    function updateChart(url, filter, chartId, seriesType, collectionAlias) {
                        $.ajax({
                            url: url,
                            type: 'GET',
                            data: {
                                filter: filter
                            },
                            success: function(response) {
                                console.log("Response from server:", response); // Debugging
                                if (!response.data) {
                                    console.error("No data found in the response");
                                    return; // Exit if no data found
                                }

                                // Log the data being used for the chart
                                console.log("Data for chart:", response.data);

                                // Destroy old chart instance if exists
                                if ($(chartId).data('shieldChart')) {
                                    $(chartId).shieldChart().destroy();
                                }

                                // Reinitialize the chart with new data
                                $(chartId).shieldChart({
                                    primaryHeader: {
                                        text: collectionAlias
                                    },
                                    dataSeries: [{
                                        seriesType: seriesType,
                                        collectionAlias: collectionAlias,
                                        data: response.data // This should be in correct format
                                    }]
                                });
                            },
                            error: function(error) {
                                console.error("Error fetching chart data: ", error);
                            }
                        });
                    }



                });
            </script>


            <!-- Volunteer Data Table -->
            <div class="row mt-5">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Volunteers</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered yajra-datatable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Profession</th>
                                        <th>Phone</th>
                                        <th>Approve</th>
                                        <th>Print</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>


    <script type="text/javascript">
        $(function() {
            // Initialize the DataTable
            var table = $('.yajra-datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('admin_dashboard') }}",
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'profession',
                        name: 'profession'
                    },
                    {
                        data: 'role',
                        name: 'role'
                    },
                    {
                        data: 'status',
                        name: 'status',
                        render: function(data, type, full, meta) {
                            // Set the initial checked state based on the current status
                            let checked = data === 'approve' ? 'checked' : '';
                            return `
                            <td>
                                <div class="outerDivFull">
                                    <form action="{{ route('admin_volunteer_update_status', '') }}/${full.id}" method="POST" class="status-form">
                                        @csrf
                                        @method('PATCH')
                                        <input type="hidden" name="status" class="status-input" value="${data}">
                                        <div class="switchToggle">
                                            <input type="checkbox" id="switch-${full.id}" class="status-checkbox" ${checked}>
                                            <label for="switch-${full.id}">Toggle</label>
                                        </div>
                                    </form>
                                </div>
                            </td>
                            `;
                        },
                        orderable: false,
                        searchable: false
                    },
                    {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false,
                    render: function(data, type, full, meta) {
                        return `
                            <a href="{{ route('volunteer_print', '') }}/${full.id}" class="btn btn-info">
                                <i class="fa-solid fa-eye"></i> View Detail
                            </a>
                        `;
                    }
                }
                ]
            });

            // Handle toggle switch changes
            $(document).on('change', '.status-checkbox', function() {
                const form = $(this).closest('.status-form');
                const statusInput = form.find('.status-input');

                // Toggle between approve and reject based on the checkbox state
                statusInput.val(this.checked ? 'approve' : 'reject');

                // Submit the form
                form.submit();
            });
        });
    </script>
@endsection
