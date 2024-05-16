<?php
session_start();

// Include config.php for database connection
include('config.php');

// Check if the user is logged in, if not, redirect to the login page
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php"); // Redirect to the login page
    exit();
}

// Fetch user information from the database based on the user_id stored in the session
$user_id = $_SESSION["user_id"];
$sql = "SELECT * FROM users WHERE user_id = '$user_id'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $name = $row["name"];
    $email = $row["email"];
    $role = $row["role"];
    $registration_date = $row["registration_date"];
    $profile_picture = $row["profile_picture"]; // Fetch profile picture URL
} else {
    // User not found
    // You can handle this case accordingly, e.g., display an error message
}

// Handle profile picture upload
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["profile_picture"])) {
    // Handle profile picture upload code
}

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
        /* CSS styles */
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Profile, <?php echo $name; ?>!</h1>
        <?php if ($profile_picture): ?>
            <img src="<?php echo $profile_picture; ?>" alt="Profile Picture" class="profile-picture">
        <?php else: ?>
            <!-- Placeholder for profile picture if not available -->
            <div class="profile-picture"></div>
        <?php endif; ?>
        <!-- Form for uploading profile picture -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
            <input type="file" name="profile_picture" id="profile_picture">
            <input type="submit" value="Upload" name="submit">
        </form>
        <!-- Display user information -->
        <p><strong>Name:</strong> <?php echo $name; ?></p>
        <p><strong>Email:</strong> <?php echo $email; ?></p>
        <p><strong>Role:</strong> <?php echo $role; ?></p>
        <p><strong>Registration Date:</strong> <?php echo $registration_date; ?></p>
        
        <!-- Add more user information as needed -->

        <!-- Logout button -->
        <a href="logout.php" class="btn">Logout</a>
    </div>
</body>
</html>
