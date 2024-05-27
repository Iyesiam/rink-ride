<?php
session_start();
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php"); // Redirect to the login page if not authenticated
    exit();
}
?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Ridelink</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<!-- Add this script inside the <head> tag -->
<script>
    // Function to send location data to the server
    function sendLocation(latitude, longitude) {
        // Create a FormData object
        var formData = new FormData();
        formData.append('latitude', latitude);
        formData.append('longitude', longitude);

        // Send a POST request to the store.php file
        fetch('store.php', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            console.log(data); // Log the response from the server
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
    }

    // Function to track driver location
    function trackDriverLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.watchPosition(function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                sendLocation(latitude, longitude); // Send location data to the server
            });
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    // Call the function to track driver location
    trackDriverLocation();
</script>

</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
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
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
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
        <!-- Map container with fixed height -->
        <div id="map" style="width: 100%; height: 200px; position: relative; z-index: 0;"></div>
    </div>
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
            navigator.geolocation.watchPosition(function(position) {
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

    // Adjust map dimensions based on the card's dimensions
    var cardBody = document.querySelector('.card-body');
    var mapContainer = document.getElementById('map');
    var cardHeight = cardBody.clientHeight;
    mapContainer.style.height = cardHeight + 'px';
    map.invalidateSize();
</script>

          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12">
                <!-- Yearly Breakup -->
                <div class="card overflow-hidden">
                <div class="card-body p-4">
    <h5 class="card-title mb-9 fw-semibold">Ride Requests</h5>
    <div class="row">
        <?php

        include 'config.php'; // Include your database connection file

        // Check if user is logged in
        if (isset($_SESSION["user_id"])) {
            $userId = $_SESSION["user_id"];

            // Fetch ride requests for the logged-in private driver
            $sql_requests = "SELECT * FROM booking_details WHERE driver_id = '$userId' AND status = 'pending'";
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
                    // Accept and decline buttons with margin between them
                    echo "<form action='handle_booking.php' method='POST'>";
echo "<input type='hidden' name='booking_id' value='" . $row_request["booking_id"] . "'>";
echo "<button type='submit' class='btn btn-success' name='accept'>Accept</button>";
echo "&nbsp;"; // Non-breaking space
echo "<button type='submit' class='btn btn-danger' name='decline'>Decline</button>";
echo "</form>";
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



              </div>
              <div class="col-lg-12">
                <!-- Monthly Earnings -->
                <div class="card">
                <div class="card-body">
    <div class="row align-items-start">
        <div class="col-8">
            <h5 class="card-title mb-9 fw-semibold">Accepted Requests</h5>
            <?php
            // Include the configuration file
            include 'config.php';

            // Get the role of the current user from the session
            $role = $_SESSION["role"];

            // Fetch accepted ride requests for the current driver based on their role
            $user_id = $_SESSION["user_id"]; // Assuming user_id is the unique identifier for drivers
            $sql = "SELECT * FROM booking_details WHERE ";

            // If the user is a temporary driver or private driver, select requests where their ID matches the driver_id
            if ($role == 'temporary_driver' || $role == 'private_driver') {
                $sql .= "driver_id = $user_id AND ";
            }

            // Continue the query to select accepted requests
            $sql .= "status = 'accepted'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $requestCount = 1;
                // Output data of each row
                while ($row = $result->fetch_assoc()) {
                    echo '<h5 class="card-title mb-3 fw-semibold">Request ' . $requestCount . '</h5>';
                    echo '<p><strong>Pickup Location:</strong> ' . $row["pickup_location"] . '</p>';
                    echo '<p><strong>Drop-off Location:</strong> ' . $row["destination_location"] . '</p>';
                    echo '<p><strong>Status:</strong> ' . $row["status"] . '</p>';
                    // Change button to a link to booking.php
                    echo '<a class="btn btn-primary" href="booking.php?booking_id=' . $row["booking_id"] . '">Set Destination</a>';
                    echo '</div>';
                    echo '</div>';
                    echo '</div>';
                    $requestCount++;
                }
            } else {
                echo "No accepted ride requests";
            }

            // Close the database connection
            $conn->close();
            ?>
        </div>
    </div>
</div>

    </div>
</div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4">Design and Developed by Ridelink</p>
        </div>
      </div>
    </div>
  </div>
  <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/js/sidebarmenu.js"></script>
  <script src="../assets/js/app.min.js"></script>
  <script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
  <script src="../assets/js/dashboard.js"></script>
</body>

</html>