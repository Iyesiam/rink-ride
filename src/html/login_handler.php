<?php
session_start();
require_once 'config.php';

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if credentials are valid
    $stmt = $conn->prepare("SELECT * FROM admin WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $admin = $result->fetch_assoc();

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['username'] = $username;
        header("Location: admin-dash.php");
        exit();
    } else {
        $error = "Invalid username or password";
        header("Location: login.php?error=" . urlencode($error));
        exit();
    }
} else {
    header("Location: admin_login.php");
    exit();
}
?>
