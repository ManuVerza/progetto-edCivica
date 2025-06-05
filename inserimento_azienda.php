<?php
require('connessione.php');

// Abilita debug
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $ragioneSociale = $_POST['ragioneSociale'];
    $pIva = $_POST['pIva'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $sede = $_POST['sede'];
    $indirizzo = $_POST['indirizzo'];
    $nDipendenti = $_POST['nDipendenti'];

    $sql = "INSERT INTO aziende (RagioneSociale, P_Iva, Telefono, Email, Sede, Indirizzo, N_Dipendenti)
            VALUES ('$ragioneSociale', '$pIva', '$telefono', '$email', '$sede', '$indirizzo', $nDipendenti)";

    if ($conn->query($sql) === TRUE) {
        echo "✅ Azienda inserita con successo.";
    } else {
        echo "❌ Errore: " . $conn->error;
    }
} else {
    echo "❗ Il form non è stato inviato.";
}

$conn->close();
