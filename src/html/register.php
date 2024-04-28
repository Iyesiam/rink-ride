<?php
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

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $role = $_POST["role"];

    // Insert user data into users table
    $sql = "INSERT INTO users (name, email, password, role)
            VALUES ('$name', '$email', '$password', '$role')";

    if ($conn->query($sql) === TRUE) {
        // Get the ID of the inserted user
        $user_id = $conn->insert_id;

        // If the user is a driver, insert additional documents into user_documents table
        if ($role === "temporary_driver" || $role === "private_driver") {
            $id_document = $_POST["idDocument"];
            $driving_license = $_POST["drivingLicense"];
            $vehicle_registration = $_POST["vehicleRegistration"];

            $sql_docs = "INSERT INTO user_documents (user_id, id_document, driving_license, vehicle_registration)
                         VALUES ('$user_id', '$id_document', '$driving_license', '$vehicle_registration')";

            $conn->query($sql_docs);
        }

        // Close database connection
        $conn->close();

        // Display pop-up message and redirect to login page
        echo "<script>
                alert('Registration successful! Click OK to proceed to login.');
                window.location.href = './index.php';
              </script>";
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>