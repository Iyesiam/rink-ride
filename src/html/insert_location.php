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

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get user ID, latitude, and longitude from the POST data
    $user_id = $_POST["user_id"];
    $latitude = $_POST["latitude"];
    $longitude = $_POST["longitude"];

    // Insert user location into the user_locations table
    $sql_insert_location = "INSERT INTO user_locations (user_id, latitude, longitude) VALUES ('$user_id', '$latitude', '$longitude')";
    if ($conn->query($sql_insert_location) === TRUE) {
        echo "Location inserted successfully";
    } else {
        echo "Error inserting location: " . $conn->error;
    }
} else {
    echo "Invalid request";
}

// Close database connection
$conn->close();
?>
