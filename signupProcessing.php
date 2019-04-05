<?php
include 'functions.php';

/*

    This is for SIGNUP .. 

*/

session_start();

$username = $_POST['username'];
$password = $_POST['password'];
$passwordCheck = $_POST['passwordConf'];
$email = $_POST['emailAdd'];
$emailCheck = $_POST['emailConfirm'];

# CHECK IF ANYTHING EMPTY
if ($username == null || $password == null || $email == null){
    $a = "signup.php?msg=n";
    header ("Location: " . $a);
} else if ($password != $passwordCheck){
    //Password does not match
    $a = "signup.php?msg=wp";
    header ("Location: " . $a);
} else if ($email!= $emailCheck){
        //Email does not match 
        $a = "signup.php?msg=we";
        header ("Location: " . $a);
} else if (strlen($password) > 10){
    $a = "signup.php?msg=lp";
        header ("Location: " . $a);  
} else if (strlen($username) > 10){
    $a = "signup.php?msg=lu";
        header ("Location: " . $a);  
} else {
    SignUp($username, $password, $email);
}


?>