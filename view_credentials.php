<?php
// Mot de passe secret pour éviter que n'importe qui y accède
$secret = "cccc"; // Change ceci

if (!isset($_GET['key']) || $_GET['key'] !== $secret) {
    http_response_code(403);
    die("Accès refusé.");
}

$filename = "credentials.txt";
if (file_exists($filename)) {
    header("Content-Type: text/plain");
    echo file_get_contents($filename);
} else {
    echo "Fichier introuvable.";
}
?>