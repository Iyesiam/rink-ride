<?php
session_start();

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

// Update session status to "disconnected" for the logged-out user
if (isset($_SESSION["user_id"])) {
    $userId = $_SESSION["user_id"];

    $sql_update_session = "UPDATE user_sessions SET status = 'disconnected' WHERE user_id = '$userId'";
    $conn->query($sql_update_session);

    // Destroy the session
    session_destroy();

    // Redirect the user to the login page or any other appropriate page
    header("Location: index.php");
    exit();
} else {
    // If the user is not logged in, redirect them to the login page
    header("Location: index.php");
    exit();
}
?>
