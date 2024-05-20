<?php
include 'config.php';

$category = $_GET['category'];
$sql = "";

switch($category) {
    case 'passengers':
        $sql = "SELECT * FROM users WHERE role = 'Passenger'";
        break;
    case 'private_drivers':
        $sql = "SELECT * FROM users WHERE role = 'Private Driver'";
        break;
    case 'car_owners':
        $sql = "SELECT * FROM users WHERE role = 'Car Owner'";
        break;
    case 'temp_drivers':
        $sql = "SELECT * FROM users WHERE role = 'Temp Driver'";
        break;
}

$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode(['data' => $data]);
?>
