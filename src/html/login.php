<?php
// Start session to manage user authentication
session_start();

// Database connection
$servername = "localhost";
$username = "root"; // default username for XAMPP
$password = ""; // default password for XAMPP is empty
$dbname = "ridelink"; // your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process login form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Check if user exists with the provided email
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();

        // Verify password
        if (password_verify($password, $row["password"])) {
            // Set session variables for user authentication
            $_SESSION["user_id"] = $row["user_id"];
            $_SESSION["name"] = $row["name"];
            $_SESSION["email"] = $row["email"];
            $_SESSION["role"] = $row["role"];

            // Get initial user location using Geolocation API
            ?>
            <script>
                // Function to handle success in getting user's current location
                function getLocationSuccess(position) {
                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;

                    // Send the latitude and longitude to the server to insert into the user_locations table
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            console.log("Location inserted successfully");
                        }
                    };
                    xhttp.open("POST", "insert_location.php", true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send("user_id=<?php echo $row["user_id"]; ?>&latitude=" + latitude + "&longitude=" + longitude);
                }

                // Function to handle error in getting user's current location
                function getLocationError(error) {
                    console.error("Error getting location:", error);
                }

                // Get the user's current location
                navigator.geolocation.getCurrentPosition(getLocationSuccess, getLocationError);
            </script>
            <?php

            // Insert a record into user_sessions table for active session
            $session_token = bin2hex(random_bytes(32)); // Generate a random session token
            $user_id = $row["user_id"];
            $sql_insert_session = "INSERT INTO user_sessions (user_id, session_token, status) VALUES ('$user_id', '$session_token', 'active')";
            $conn->query($sql_insert_session);

            // Redirect user based on their role
            switch ($_SESSION["role"]) {
                case "passenger":
                    header("Location: Passenger-home.php");
                    break;
                case "private_driver":
                    header("Location: p-driver-home.php");
                    break;
                case "temporary_driver":
                    header("Location: t-driver-home.php");
                    break;
                default:
                    // Redirect to a default page if the role is not recognized
                    header("Location: index.php");
                    break;
            }
            exit();
        } else {
            // Invalid password
            echo "<script>alert('Invalid email or password.'); window.location.href = 'index.php';</script>";
        }
    } else {
        // User not found
        echo "<script>alert('Invalid email or password.'); window.location.href = 'index.php';</script>";
    }
}
?>
