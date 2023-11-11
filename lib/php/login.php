<?php
header('Content-Type: application/json');
include "connection.php";

// Vérification des clés dans $_POST avant de les utiliser
$email = isset($_POST['email']) ? $_POST['email'] : '';
$pass = sha1(isset($_POST['password']) ? $_POST['password'] : '');
try {
    if (!empty($email) && !empty($pass)) {
        //$hashedPass = sha1($pass);
        $stmt = $db->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
        $stmt->execute(array($email, $pass));
        if ($stmt->rowCount() == 1) {
            $row = $stmt->fetch();
            $msg = "Success connection";
            $success = 1;
        } else {
            $success = 0;
            $msg = "Invalid email or password";
        }
    } else {
        $success = 0;
        $msg = "Error: Empty data";
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Error: " . $th->getMessage();
}

echo json_encode([
    "data" => [
        "message" => $msg,
        "success" => $success,
    ]
]);
?>