<?php
include 'db_config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];

    $sql = "INSERT INTO items (name, price, quantity) VALUES ('$name', $price, $quantity)";

    if ($conn->query($sql) === TRUE) {
        echo "New item added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
    header("Location: index.php");
    exit;
}
?>
