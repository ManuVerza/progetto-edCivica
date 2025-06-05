<?php
session_start();

// Controlla se è stato settato is_company nella sessione, altrimenti imposta a 0
$is_company = $_SESSION['is_company'] ?? 0;
?>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
  <link rel="stylesheet" href="css/home_style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>

  <header>
    <div class="logo">Agenzia Interinale</div>
  </header>

  <nav class="menu" id="menu">
    <ul>
      <li><a href="chi_siamo.html">Chi Siamo</a></li>
      <li>
        <?php
        if ($is_company == 1) {
          echo '<a href="inserisci_azienda.html">Inserisci la tua azienda</a>';
        } else {
          echo '<a href="inserisci_candidato.html">Cerca il tuo lavoro</a>';
        }
        ?>
      </li>
      <li>
        <?php
        if ($is_company == 1) {
          echo '<a href="mostra_candidati.php">Candidati disponibili</a>';
        } else {
          echo '<a href="mostra_azienda.php">Aziende disponibili</a>';
        }
        ?>
      </li>
      <li><a href="contattaci.html">Contatti</a></li>
    </ul>
  </nav>

  <main>
    <h1>Benvenuto nella nostra azienda!</h1>
    <p>Facilitiamo l'incontro tra domanda e offerta di lavoro, aiutando persone e imprese a crescere insieme. Scopri le nostre opportunità e i nostri servizi!</p>
  </main>
</body>

</html>