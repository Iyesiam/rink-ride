<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
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
    }

    #map {
      height: 400px;
      width: 100%;
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
  </style>
</head>

<body>
  <header>
    <div class="menu-icon">&#9776;</div>
    <h1 class="brand">Ridelink</h1>
  </header>

  <div class="container">
    <form id="routeForm">
      <label for="from">From:</label>
      <input type="text" id="from" placeholder="Enter starting location">

      <label for="to">To:</label>
      <input type="text" id="to" placeholder="Enter destination location">

      <input type="submit" value="Calculate Route">
    </form>

    <div id="map"></div>
  </div>

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

    document.getElementById("routeForm").addEventListener("submit", function(event) {
      event.preventDefault();
      var from = document.getElementById("from").value;
      var to = document.getElementById("to").value;

      // Use Nominatim API for geocoding
      var fromUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=' + from;
      var toUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=' + to;

      Promise.all([fetch(fromUrl), fetch(toUrl)])
        .then(responses => Promise.all(responses.map(response => response.json())))
        .then(data => {
          var fromCoords = [parseFloat(data[0][0].lat), parseFloat(data[0][0].lon)];
          var toCoords = [parseFloat(data[1][0].lat), parseFloat(data[1][0].lon)];

          // Fetch route from OpenRouteService API
          fetch('https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf62488b06281daaaa4005bd07488d4eecdc6a&start=' + fromCoords[1] + ',' + fromCoords[0] + '&end=' + toCoords[1] + ',' + toCoords[0])
            .then(response => response.json())
            .then(data => {
              var routeCoordinates = data.features[0].geometry.coordinates;
              var latlngs = routeCoordinates.map(coord => [coord[1], coord[0]]);
              
              // Remove existing polyline if exists
              if (polyline) {
                map.removeLayer(polyline);
              }

              // Draw polyline
              polyline = L.polyline(latlngs, {color: 'blue'}).addTo(map);
            })
            .catch(error => {
              console.error('Error fetching route:', error);
            });
        })
        .catch(error => {
          console.error('Error geocoding:', error);
        });
    });
  </script>
</body>

</html>
