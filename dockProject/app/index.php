<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "db";
$username = "user";
$password = "userpassword";
$dbname = "myapp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
   die("Connexion échouée: " . $conn->connect_error);
} else {
  echo "Connexion réussie à MYSQL !<br>";
}


$sql = "SHOW TABLES LIKE 'users'";
$result = $conn->query($sql);

if ($result->num_rows == 0) {
   die("Erreur: la table 'users' n'existe pas !");
} else {
  echo "La table 'users' existe !<br>";
}

$sql = "SELECT name FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {

   echo "<h1>Utilisateurs : </h1>";
   while ($row = $result->fetch_assoc()) {
      echo "<p>" . $row["name"] . "</p>";
   }
} else {
  echo "Aucun utilisateur trouvé.<br>";
}

$conn->close();
?>