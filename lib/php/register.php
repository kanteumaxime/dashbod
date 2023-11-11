<?php
header('Content-Type: application/json');
include "connection.php";

// Vérification des clés dans $_POST avant de les utiliser
$name = isset($_POST['nom']) ? $_POST['nom'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$pass = sha1(isset($_POST['password']) ? $_POST['password'] : '');

try {
    if (isset($name, $email, $pass)) {
        $req = $db->prepare("SELECT * FROM users WHERE email = ?");
        $req->execute(array($email));
        $exist = $req->rowCount();
        
        if ($exist == 0) {
            $req = $db->prepare("INSERT INTO users VALUES(null,?,?,?)");
            $req->execute(array($name, $email, $pass));

            if ($req) {
                $success = 1;
                $msg = "success register";
            } else {
                $success = 0;
                $msg = "Error register";4
            }
        } else {
            $success = 0;
            $msg = "email already exists";
        }
    } else {
        $success = 0;
        $msg = "Error empty data";
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Error: " . $th->getMessage();
}

echo json_encode([
    "data" => [
        $msg,
        $success
    ]
]);