<?php
    $conn = new mysqli('localhost', 'root','','agenziainterinale');

    if($conn->connect_error)
        die ("Connessione fallita!! ". $conn->connect_error);
    else

    ?>