<?php
session_start();

// Include config.php for database connection
include('config.php');

// Check if the user is logged in, if not, redirect to the login page
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php"); // Redirect to the login page
    exit();
}

// Fetch user information from the database
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
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["profile_picture"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
    $check = getimagesize($_FILES["profile_picture"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["profile_picture"]["size"] > 500000) {
        $uploadOk = 0;
    }

    // Allow certain file formats
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif") {
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["profile_picture"]["tmp_name"], $target_file)) {
            // Update the user's profile picture in the database
            $profile_picture = $target_file;
            $update_sql = "UPDATE users SET profile_picture = '$profile_picture' WHERE user_id = '$user_id'";
            if ($conn->query($update_sql) !== TRUE) {
                // Handle error updating record
            }
        } else {
            // Handle error moving uploaded file
        }
    }
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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 10px;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Profile, <?php echo $name; ?>!</h1>
        <?php if ($profile_picture): ?>
            <img src="<?php echo $profile_picture; ?>" alt="Profile Picture" class="profile-picture">
        <?php else: ?>
            <div class="profile-picture"></div>
        <?php endif; ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
            <input type="file" name="profile_picture" id="profile_picture">
            <input type="submit" value="Upload" name="submit">
        </form>
        <p><strong>Name:</strong> <?php echo $name; ?></p>
        <p><strong>Email:</strong> <?php echo $email; ?></p>
        <p><strong>Role:</strong> <?php echo $role; ?></p>
        <p><strong>Registration Date:</strong> <?php echo $registration_date; ?></p>
        
        <!-- Add more user information as needed -->

        <a href="logout.php" class="btn">Logout</a>
    </div>
</body>
</html>
