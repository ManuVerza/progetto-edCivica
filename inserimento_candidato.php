<?php
require('connessione.php');

// Abilita debug
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // "pulisce" da eventuali caratteri pericolosi (come apici singoli) che potrebbero causare problemi nella query SQL
    $nome = $conn->real_escape_string($_POST['nome']);
    $cognome = $conn->real_escape_string($_POST['cognome']);
    $indirizzo = $conn->real_escape_string($_POST['indirizzo']);
    $telefono = $conn->real_escape_string($_POST['telefono']);
    $email = $conn->real_escape_string($_POST['email']);
    $url_curriculum = $conn->real_escape_string($_POST['url_curriculum']);
    $data_nascita = $conn->real_escape_string($_POST['data_nascita']);

    // Se URL vuoto, inserisci NULL nel db
    $url_curriculum_sql = empty($url_curriculum) ? "NULL" : "'$url_curriculum'";

    $sql = "INSERT INTO candidati (Nome, Cognome, Indirizzo, Telefono, Email, URL_Curriculum, Data_Nascita)
            VALUES ('$nome', '$cognome', '$indirizzo', '$telefono', '$email', $url_curriculum_sql, '$data_nascita')";

    if ($conn->query($sql) === TRUE) {
        echo "✅ Candidato inserito con successo.";
    } else {
        echo "❌ Errore: " . $conn->error;
    }
} else {
    echo "❗ Il form non è stato inviato.";
}

$conn->close();
