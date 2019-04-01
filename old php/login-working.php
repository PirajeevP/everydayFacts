<?php
include 'functions.php';

// echo password_hash("1234",PASSWORD_DEFAULT);

$db = getDB();
$query = "SELECT * FROM Users";
$result = runQuery($db, $query);

session_start();
$username = $_POST['username'];
$password = $_POST['password'];

if (!empty($_POST)){
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        LogIn($username,$password);
    }
}
?>


<html>
<?php


?>
<h1> LOGIN </h1>
<form action="" method="post">
    <input type="text" name="username" placeholder="Enter your username" required>
    <input type="password" name="password" placeholder="Enter your password" required>
    <input type="submit" value="Submit">
</form>
</html>