<?php
session_start();
require 'connessione.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT ID_utente, password, is_company FROM utenti WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $stmt->bind_result($id, $db_password, $is_company);
    $stmt->fetch();

    // Confronto diretto senza hash
    if ($password === $db_password) {
        $_SESSION['user_id'] = $id;
        $_SESSION['username'] = $username;
        $_SESSION['is_company'] = $is_company;
        header("Location: home.php");
        exit();
    } else {
        echo "Password errata.";
    }
} else {
    echo "Utente non trovato.";
}
