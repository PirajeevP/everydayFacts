<?php
include 'include/config.php';

/*
Defines functions to connect to the Database, retrieve the result and 
return them. 
*/

function getDB()
{
	// connect to database
	$conn= mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);

	
	if(!$conn){
		print "Error- Could not connect to mySQL";
		exit;
	}
	
	return $conn;
}

function runQuery($db, $query) {

    // takes a reference to the DB and a query and returns the 
    // results of running the query on the database

	$result = mysqli_query($db,$query);
	if (mysqli_num_rows($result) > 0){
	   return $result;
	} else {
		echo ("0 results");
	}
}


/*
Defines functions for users to login or signup.
*/

function LogIn($username, $password){
    // Create a Database Connection
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
        } else {
            echo "Incorrect Password";
        }
    }
    } else {
       echo "Account Does not Exist";
    }
}

function SignUp($username, $password){
    // Create a Database Connection
    $db = getDB();
    
    // Check if User exists in Database + Bind Parameters
    $statement = "SELECT * FROM Users WHERE UserName = ?";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_bind_param($statement,'s',$username);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);

    
    // If User Does Not Exist, then a new account will be created. 
    // Note: Password's are hashed for security reasons. 
    if (mysqli_num_rows($result) > 0) {
        echo "User already exists";
    } else {
        $password = password_hash($password,PASSWORD_DEFAULT);
        $statement = "INSERT INTO Users (UserName,Password) VALUES ('$username', '$password')";
    
        if (mysqli_query($db,$statement)){
            echo "sucesss";     
            $_SESSION['userID'] = $username;   
        } else {
            echo "Error";
        };
    }
}

?>