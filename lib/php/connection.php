<?php 
   $host = "localhost";
   $dbname = "id21485955_onprogramme";
   $user = "id21485955_maxime";
   $pass = "@Maxime123";
   try {
      $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
      //<echo "Connected!";
   } catch (\Throwable $th) {
      //echo "Error: " . $th->getMessage();
   }
?>