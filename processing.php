<?php
include 'functions.php';

/*

    This is for LOGIN.. 

*/

session_start();

$username = $_POST['username'];
$password = $_POST['password'];

echo $username; 

$db = getDB();
    
// Check if User exists in Database + Bind Parameters
$statement = "SELECT * FROM Users WHERE UserName = ?";
$statement = mysqli_prepare($db, $statement);
mysqli_stmt_bind_param($statement,'s',$username);
mysqli_stmt_execute($statement);
$result = mysqli_stmt_get_result($statement);

// If User exists, then password will be checked. 
// Otherwise, Password will not be checked. 
// Note: Password's are hashed for security reasons. 
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_array($result)){
        if (password_verify($password,$row['Password'])){
            echo "Login Successful";
            //echo $row["UserID"];
            $_SESSION['userID'] = $row["UserID"];
            header("Location: dashboard.php");
        } else {
            echo "wrong password";
            $a = "login.php?msg=failed";
            header ("Location: " . $a);
        }
    }
} else {
   echo "Account Does not Exist";
   header ("Location: login.php");
}
//  header ("Location: login.php");
?>