<?php
include 'functions.php';



$db = getDB();
$query = "SELECT * FROM Users";
$result = runQuery($db, $query);

session_start();

$username = $_POST['username'];
$password = $_POST['password'];

if (!empty($_POST)){
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        SignUp($username, $password);
    }
}
?>


<html>
<h1> SIGNUP </h1>
<form action="" method="post">
    <input type="text" name="username" placeholder="Enter a username" required>
    <input type="password" name="password" placeholder="Enter a password" required>
    <input type="submit" value="Submit">
</form>
</html>