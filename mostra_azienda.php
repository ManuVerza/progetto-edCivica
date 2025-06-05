<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elenco Aziende e Offerte</title>
    <link rel="stylesheet" href="css/mostra.css">
</head>

<body>

    <div class="container">
        <?php
        require('connessione.php');

        // --- Sezione Aziende ---
        $sqlAziende = "SELECT * FROM aziende";
        $risAziende = $conn->query($sqlAziende);

        echo "<h1>Elenco Aziende</h1>";

        if ($risAziende->num_rows > 0) {
            echo "<table>
                <tr>
                    <th>ID</th>
                    <th>Ragione Sociale</th>
                    <th>P. IVA</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Sede</th>
                    <th>Indirizzo</th>
                    <th>Numero Dipendenti</th>
                </tr>";

            foreach ($risAziende as $riga) {
                echo "<tr>
                    <td>" . htmlspecialchars($riga['ID_Azienda']) . "</td>
                    <td>" . htmlspecialchars($riga['RagioneSociale']) . "</td>
                    <td>" . htmlspecialchars($riga['P_Iva']) . "</td>
                    <td>" . htmlspecialchars($riga['Telefono']) . "</td>
                    <td>" . htmlspecialchars($riga['Email']) . "</td>
                    <td>" . htmlspecialchars($riga['Sede']) . "</td>
                    <td>" . htmlspecialchars($riga['Indirizzo']) . "</td>
                    <td>" . htmlspecialchars($riga['N_Dipendenti']) . "</td>
                </tr>";
            }

            echo "</table>";
        } else {
            echo "<p>Nessuna azienda trovata.</p>";
        }

        // --- Sezione Offerte di Lavoro ---
        $sqlOfferte = "SELECT * FROM offertedilavoro";
        $risOfferte = $conn->query($sqlOfferte);

        echo "<h1>Offerte di lavoro disponibili</h1>";

        if ($risOfferte->num_rows > 0) {
            echo "<table>
                <tr>
                    <th>ID Offerta</th>
                    <th>Descrizione</th>
                    <th>Inizio</th>
                    <th>Fine</th>
                    <th>Posti Disponibili</th>
                    <th>ID Azienda</th>
                </tr>";

            foreach ($risOfferte as $offerta) {
                echo "<tr>
                    <td>" . htmlspecialchars($offerta['ID_Offerta']) . "</td>
                    <td>" . htmlspecialchars($offerta['Descrizione']) . "</td>
                    <td>" . htmlspecialchars($offerta['Inizio']) . "</td>
                    <td>" . htmlspecialchars($offerta['Fine']) . "</td>
                    <td>" . htmlspecialchars($offerta['PostiDisponibili']) . "</td>
                    <td>" . htmlspecialchars($offerta['id_Azienda']) . "</td>
                </tr>";
            }

            echo "</table>";
        } else {
            echo "<p>Nessuna offerta di lavoro trovata.</p>";
        }

        $conn->close();
        ?>
    </div>

</body>

</html>