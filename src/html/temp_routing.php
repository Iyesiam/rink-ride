<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modernize Free</title>
    <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="../assets/css/styles.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            position: relative;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .menu-icon {
            color: #fff;
            cursor: pointer;
        }

        .brand {
            color: #8b4513;
            font-weight: bold;
            font-size: 1.2em;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            padding-bottom: 80px; /* Adjusted padding for footer */
            position: relative;
        }

        #map {
            height: 400px;
            width: 100%;
            margin-top: 20px; /* Added margin to separate map from route info */
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #f8f9fa;
            color: #333;
            padding: 10px 20px;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .loading-indicator {
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    z-index: 1000; /* Ensure the loading indicator is on top of the map */
}


        .loading-text {
            font-weight: bold;
        }

        .loading-spinner {
            border: 4px solid rgba(0, 0, 0, 0.1);
            border-left-color: #007bff;
            animation: spin 1s linear infinite;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin: 0 auto;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        /* iOS Font for Heading */
        .ios-font {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
            font-weight: bold;
            font-size: 1.5em;
        }

    </style>
</head>

<body>
    <header>
        <div class="menu-icon">&#9776;</div>
        <h1 class="brand">Ridelink</h1>
    </header>

    <div class="container">
        <h2 class="ios-font">Plan Your Route</h2>
        <form id="routeForm">
            <label for="from">From:</label>
            <input type="text" id="from" placeholder="Enter starting location">

            <label for="to">To:</label>
            <input type="text" id="to" placeholder="Enter destination location">

            <input type="submit" value="Calculate Route">
        </form>

        <div id="routeInfo" style="display: none;">
            <div id="routeTitle" class="ios-font"></div>
            <p id="distance"></p>
            <p id="eta"></p>
        </div>

        <div id="map"></div>

        <div class="loading-indicator" id="loadingIndicator">
            <div class="loading-text">Loading...</div>
            <div class="loading-spinner"></div>
        </div>
    </div>

    <footer>
        &copy; 2024 Ridelink. All Rights Reserved.
    </footer>

    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    <!-- Leaflet JavaScript -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([-1.9441, 30.0619], 13); // Set initial map view to Kigali

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
            maxZoom: 19
        }).addTo(map);

        var polyline;
        var startMarker, endMarker;
        var loadingIndicator = document.getElementById('loadingIndicator');
        var routeInfo = document.getElementById('routeInfo');
        var routeTitle = document.getElementById('routeTitle');
        var distanceElement = document.getElementById('distance');
        var etaElement = document.getElementById('eta');

        document.getElementById("routeForm").addEventListener("submit", function (event) {
            event.preventDefault();
            var from = document.getElementById("from").value;
            var to = document.getElementById("to").value;

            // Show loading indicator
            loadingIndicator.style.display = 'block';

            // Use Nominatim API for geocoding
            var fromUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=' + from;
            var toUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=' + to;

            Promise.all([fetch(fromUrl), fetch(toUrl)])
                .then(responses => Promise.all(responses.map(response => response.json())))
                .then(data => {
                    var fromCoords = [parseFloat(data[0][0].lat), parseFloat(data[0][0].lon)];
                    var toCoords = [parseFloat(data[1][0].lat), parseFloat(data[1][0].lon)];

                    // Fetch route from OpenRouteService API
                    fetch('https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62480fd2916978f7464282cf70e2aa662028&start=' + fromCoords[1] + ',' + fromCoords[0] + '&end=' + toCoords[1] + ',' + toCoords[0])
                        .then(response => response.json())
                        .then(data => {
                            var routeCoordinates = data.features[0].geometry.coordinates;
                            var latlngs = routeCoordinates.map(coord => [coord[1], coord[0]]);

                            // Remove existing polyline and markers if they exist
                            if (polyline) {
                                map.removeLayer(polyline);
                            }
                            if (startMarker) {
                                map.removeLayer(startMarker);
                            }
                            if (endMarker) {
                                map.removeLayer(endMarker);
                            }

                            // Draw polyline
                            polyline = L.polyline(latlngs, { color: 'blue' }).addTo(map);

                            // Add markers for start and end points
                            startMarker = L.marker(latlngs[0]).addTo(map);
                            endMarker = L.marker(latlngs[latlngs.length - 1]).addTo(map);

                            // Fit the map to the bounds of the route
                            map.fitBounds(polyline.getBounds());

                            // Display route information
                            var distance = (data.features[0].properties.summary.distance / 1000).toFixed(2); // Convert meters to kilometers
                            var duration = Math.round(data.features[0].properties.summary.duration / 60); // Convert seconds to minutes
                            distanceElement.textContent = 'Distance: ' + distance + ' km';
                            etaElement.textContent = 'Estimated Time: ' + duration + ' minutes';
                            routeTitle.textContent = from + ' - ' + to; // Set heading to starting and destination locations separated by a hyphen
                            routeInfo.style.display = 'block';

                            // Hide loading indicator
                            loadingIndicator.style.display = 'none';
                        })
                        .catch(error => {
                            console.error('Error fetching route:', error);
                            // Hide loading indicator in case of error
                            loadingIndicator.style.display = 'none';
                        });
                })
                .catch(error => {
                    console.error('Error geocoding:', error);
                    // Hide loading indicator in case of error
                    loadingIndicator.style.display = 'none';
                });
        });
    </script>
</body>

</html>
