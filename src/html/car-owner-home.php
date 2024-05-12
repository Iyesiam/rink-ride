<?php
session_start();
if (!isset($_SESSION["user_id"])) {
    header("Location: index.php"); // Redirect to the login page if not authenticated
    exit();
}
?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ridelink</title>
  <link rel="stylesheet" href="buttonstyle.css">
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">



</head>

<body>
  
      </div>
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end"><li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="profile.php" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="../assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                  <a href="profile.php" class="d-flex align-items-center gap-2 dropdown-item">
    <i class="ti ti-user fs-6"></i>
    <p class="mb-0 fs-3">My Profile</p>
</a>
                  
                    <a href="logout.php" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->
      <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row">
          <div class="col-lg-8 d-flex align-items-strech">
            <div class="card w-100">
            <div class="card-body" style="position: relative; overflow: visible;">
    <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
        <div class="mb-3 mb-sm-0">
            <h5 class="card-title fw-semibold">Map</h5>
        </div>
    </div>
    <!-- Map container with specific dimensions -->
    <div id="map" style="width: 100%; height: 300px; position: relative; z-index: 0;"></div>
</div>

              
<script>
                            // Initialize Leaflet map
                            var map = L.map('map').setView([0, 0], 13);

                            // Add OpenStreetMap tiles
                            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                attribution: '&copy; OpenStreetMap contributors'
                            }).addTo(map);

                            // Function to update user location on the map
                            function updateUserLocation(latitude, longitude) {
                                map.setView([latitude, longitude], 13);
                                L.marker([latitude, longitude]).addTo(map)
                                    .bindPopup('Your current location')
                                    .openPopup();
                            }

                            // Function to track user location
                            function trackUserLocation() {
                                if (navigator.geolocation) {
                                    navigator.geolocation.watchPosition(function (position) {
                                        var latitude = position.coords.latitude;
                                        var longitude = position.coords.longitude;
                                        updateUserLocation(latitude, longitude);
                                    });
                                } else {
                                    alert("Geolocation is not supported by this browser.");
                                }
                            }

                            // Call the function to track user location
                            trackUserLocation();
                        </script>
              
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12">
                <!-- Yearly Breakup -->
              </div>
              <div class="col-lg-12">
                <!-- Monthly Earnings -->
                <div class="card">
                <div class="card-body">
    <div class="row align-items-start">
        <div class="col-8">
            <h5 class="card-title mb-9 fw-semibold">Nearby Temporary Drivers</h5>
        </div>

        <?php
        // Database connection
        $servername = "localhost";
        $username = "root"; // your database username
        $password = ""; // your database password
        $dbname = "ridelink"; // your database name

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Fetch nearby temporary drivers with active sessions (assuming they have a certain role)
        $sql = "SELECT * FROM users u
        INNER JOIN user_sessions s ON u.user_id = s.user_id
        WHERE u.role = 'temporary_driver' AND s.status = 'active'";
        $result = $conn->query($sql);

        // Check if there are any nearby temporary drivers with active sessions
        if ($result->num_rows > 0) {
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                // Output the details of each nearby temporary driver
                echo "<div class='col-8'>";
                echo "<h5 class='card-title mb-9 fw-semibold'>" . $row["name"] . "</h5>";
                echo "</div>";
                echo "<div class='col-4'>";
                echo "<div class='d-flex justify-content-end'>";
                // Add data-driver-name attribute to store driver's name
                echo "<button class='book-ride-btn' data-driver-name='" . $row["name"] . "'><i class='fa fa-car'></i></button>";
                echo "</div>";
                echo "</div>";
            }
        } else {
            echo "No nearby temporary drivers found with active sessions";
        }

        // Close database connection
        $conn->close();
        ?>

    </div>
</div>

</div>

<!-- Separate division for booking form card -->
<div class="card mt-4" id="booking-card" style="display: none;">
    <div class="card-body">
        <form action="book_tempdrvr.php" method="POST">
            <div class="mb-3">
                <label for="pickup-location" class="form-label">Pickup Location:</label>
                <input type="text" class="form-control" id="pickup-location" name="pickup_location" required>
            </div>
            <div class="mb-3">
                <label for="destination-location" class="form-label">Destination Location:</label>
                <input type="text" class="form-control" id="destination-location" name="destination_location" required>
            </div>
            <!-- Hidden input field to store driver's name -->
            <input type="hidden" id="driver-name" name="driver_name">
            <button type="submit" class="btn btn-primary">Book Ride</button>
        </form>
    </div>
</div>

<!-- JavaScript to toggle visibility of booking form -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.book-ride-btn').forEach(function(btn) {
            btn.addEventListener('click', function() {
                // Get the driver's name from the data-driver-name attribute
                var driverName = btn.getAttribute('data-driver-name');
                // Set the driver's name in the hidden input field
                document.getElementById('driver-name').value = driverName;
                // Display the booking form
                document.getElementById('booking-card').style.display = 'block';
            });
        });
    });
</script>

<div class="card-body p-4">
    <h5 class="card-title mb-9 fw-semibold">Ride Requests</h5>
    <div class="row">
    <?php

    include 'config.php'; // Include your database connection file

    // Check if user is logged in
    if (isset($_SESSION["user_id"])) {
        $userId = $_SESSION["user_id"];

        // Fetch ride requests for the logged-in user
        $sql_requests = "SELECT * FROM booking_details WHERE user_id = '$userId'";
        $result_requests = $conn->query($sql_requests);

        // Display ride requests
        if ($result_requests->num_rows > 0) {
            // Output data of each row
            while ($row_request = $result_requests->fetch_assoc()) {
                echo "<div class='col-12 mb-3'>";
                echo "<div class='card'>";
                echo "<div class='card-body'>";
                echo "<h5 class='card-title'>Request ID: " . $row_request["booking_id"] . "</h5>";
                echo "<p class='card-text'>Pickup Location: " . $row_request["pickup_location"] . "</p>";
                echo "<p class='card-text'>Destination Location: " . $row_request["destination_location"] . "</p>";
                echo "<p class='card-text'>Booking Time: " . $row_request["booking_time"] . "</p>";
                
                // Apply different styles based on the status
                $status = $row_request["status"];
                $statusColor = "";
                switch ($status) {
                    case 'pending':
                        $statusColor = "yellow";
                        break;
                    case 'accepted':
                        $statusColor = "green";
                        break;
                    case 'declined':
                        $statusColor = "red";
                    case 'cancelled':
                          $statusColor = "red";
                        break;
                    default:
                        $statusColor = "black";
                        break;
                }
                
                echo "<p class='card-text' style='font-size: 1.2rem; color: $statusColor;'>Status: " . $status . "</p>";

                // Add cancel button
                echo "<form action='cancel_booking.php' method='POST'>";
                echo "<input type='hidden' name='booking_id' value='" . $row_request["booking_id"] . "'>";
                echo "<button type='submit' class='btn btn-danger' name='cancel'>Cancel</button>";
                echo "</form>";

                echo "</div>";
                echo "</div>";
                echo "</div>";
            }
        } else {
            echo "<p>No ride requests found.</p>";
        }
    } else {
        echo "<p>User not logged in.</p>";
    }
    ?>


    </div>
</div>



<script>
    function showBookingForm(driverName) {
        document.getElementById("driver-name").value = driverName;
        document.getElementById("booking-card").style.display = "block";
    }
</script>

              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
            <div class="card-body p-4">
    <div class="mb-4">
        <h5 class="card-title fw-semibold">Recent Rides</h5>
    </div>
    <ul class="timeline-widget mb-0 position-relative mb-n5">
        <?php
        // Database connection
        $servername = "localhost";
        $username = "root"; // your database username
        $password = ""; // your database password
        $dbname = "ridelink"; // your database name

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Retrieve recent rides from the database
        $sql = "SELECT pickup_location, destination_location, booking_time FROM booking_details ORDER BY booking_time DESC LIMIT 5";
        $result = $conn->query($sql);

        // Check if there are any results
        if ($result->num_rows > 0) {
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                $pickup_location = $row["pickup_location"];
                $destination_location = $row["destination_location"];
                $booking_time = $row["booking_time"];

                // Format the booking time
                $formatted_booking_time = date("h:i a", strtotime($booking_time));

                // Generate HTML for the timeline item
                echo '<li class="timeline-item d-flex position-relative overflow-hidden">
                        <div class="timeline-time text-dark flex-shrink-0 text-end">' . $formatted_booking_time . '</div>
                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                            <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                            <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="timeline-desc fs-3 text-dark mt-n1">' . $pickup_location . '-' . $destination_location . '</div>
                    </li>';
            }
        } else {
            echo '<li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-desc fs-3 text-dark mt-n1">No recent rides found.</div>
                  </li>';
        }

        // Close database connection
        $conn->close();
        ?>
    </ul>
            </div>

            </div>
          </div>

         
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by Ridelink corp</p>
        </div>
      </div>
    </div>
  </div>
  <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/js/sidebarmenu.js"></script>
  <script src="../assets/js/app.min.js"></script>
  <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
  <script src="../assets/js/dashboard.js"></script>
</body>

</html>