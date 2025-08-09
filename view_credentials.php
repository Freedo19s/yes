<?php
$secret_key = "cccc"; // clé secrète

if (!isset($_GET['key']) || $_GET['key'] !== $secret_key) {
    http_response_code(403);
    die("Accès refusé");
}

$file = "credentials.txt";

if (!file_exists($file)) {
    die("Fichier introuvable");
}

echo "<pre>" . htmlspecialchars(file_get_contents($file)) . "</pre>";
?>
