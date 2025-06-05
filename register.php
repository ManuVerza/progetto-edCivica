<?php
session_start();
require 'connessione.php';

$is_company = isset($_POST['is_company']) ? 1 : 0;

$_SESSION['is_company'] = $is_company;

$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

$sql = "INSERT INTO utenti (username, email, password, is_company) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

//sssi = stringa stringa stringa intero
$stmt->bind_param("sssi", $username, $email, $password, $is_company);

if ($stmt->execute()) {
    header("Location: home.php");
    exit();
} else {
    echo "Errore nella registrazione: " . $stmt->error;
}
