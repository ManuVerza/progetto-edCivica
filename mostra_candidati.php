<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <title>Elenco Candidati</title>
</head>
<link rel="stylesheet" href="css/mostra.css">

<body>

    <h1>Elenco Candidati</h1>

    <?php
    require('connessione.php');

    // Query per ottenere i candidati
    $sql = "SELECT * FROM candidati";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Indirizzo</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Curriculum</th>
                    <th>Data di Nascita</th>
                </tr>
            </thead>
            <tbody>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                <td>" . htmlspecialchars($row['ID_Candidato']) . "</td>
                <td>" . htmlspecialchars($row['Nome']) . "</td>
                <td>" . htmlspecialchars($row['Cognome']) . "</td>
                <td>" . htmlspecialchars($row['Indirizzo']) . "</td>
                <td>" . htmlspecialchars($row['Telefono']) . "</td>
                <td>" . htmlspecialchars($row['Email']) . "</td>
                <td><a href='" . htmlspecialchars($row['URL_Curriculum']) . "' target='_blank'>Visualizza</a></td>
                <td>" . htmlspecialchars($row['Data_Nascita']) . "</td>
              </tr>";
        }

        echo "</tbody></table>";
    } else {
        echo "<p style='text-align:center;'>Nessun candidato trovato.</p>";
    }

    $conn->close();
    ?>

</body>

</html>