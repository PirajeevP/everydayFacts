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
                echo $row["UserID"];
                $_SESSION['userID'] = $row["UserID"];
                header("Location: dashboard.php");
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
    $statement = "SELECT UserName, UserID FROM Users WHERE UserName = ?";
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
            // $_SESSION['userID'] = $username;
            $sucess = 1;   
        } else {
            echo "Error";
            $success = -1;
        };
    }

    if ($sucess ==1){
        $statement = "SELECT UserName, UserID FROM Users WHERE UserName = ?";
        $statement = mysqli_prepare($db, $statement);
        mysqli_stmt_bind_param($statement,'s',$username);
        mysqli_stmt_execute($statement);
        $result = mysqli_stmt_get_result($statement);
        while($row = mysqli_fetch_array($result)){
            echo $row["UserID"];
            $_SESSION["userID"] = $row["UserID"];
        }
    }
    
}

/*
    Defines functions for user dashboard
*/
function getPosts($userID){
    # Make Database Connection
    $db = getDB();

    # Retrieve posts that belong to user
    $statement = "SELECT p.PostID, p.Title, p.PostDate, c.Type, SUM(r.Number) as 'Rank' FROM Rank r 
    INNER JOIN Post p 
    INNER JOIN Users u 
    INNER JOIN Category c 
    ON u.UserID = p.UserID 
    AND p.CategoryID = c.CategoryID 
    AND p.PostID = r.PostID 
    WHERE u.UserID = ? 
    GROUP BY p.PostID ORDER BY Rank DESC";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_bind_param($statement,'i',$userID);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);
    $numberofrows = mysqli_num_rows($result);

    return $result;
}


function getAll(){
    # establish database connection
    $db = getDB();

    # get SQL query + Bind Parameters
    $statement = "SELECT u.UserID, p.PostID, u.UserName, p.PostID, p.Title, DATE_FORMAT(p.PostDate, '%m/%d/%y') AS 'P', c.Type, SUM(r.Number) as 'RANK' 
    FROM Rank r 
    INNER JOIN Post p INNER JOIN Users u 
    INNER JOIN Category c ON u.UserID = p.UserID 
    AND p.CategoryID = c.CategoryID AND p.PostID = r.PostID 
    GROUP BY p.PostID ORDER BY RANK DESC";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);
    $numberofrows = mysqli_num_rows($result);

    return $result;
}


/* 
    These are SQL functions for filling up data for a single post page
*/

function fillPost($postID){
    # establish database connection
    $db = getDB();

    # get SQL query + Bind Parameters
    $statement = "SELECT u.UserName, p.PostID, p.Title, DATE_FORMAT(p.PostDate, '%m/%d/%y') AS 'P', c.Type, SUM(r.Number) as 'RANK' 
    FROM Rank r 
    INNER JOIN Post p INNER JOIN Users u 
    INNER JOIN Category c ON u.UserID = p.UserID 
    AND p.CategoryID = c.CategoryID AND p.PostID = r.PostID  WHERE p.PostID = ?
    GROUP BY p.PostID";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_bind_param($statement,'i',$postID);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);
    $numberofrows = mysqli_num_rows($result);
   
    return $result;
}

function getComments($postID){
    # establish database connection
    $db = getDB();

    # get SQL query + Bind Parameters
    $statement = "SELECT c.Comment, c.UserID, DATE_FORMAT(c.CommentDate, '%m/%d/%y') AS 'P', u.UserName 
    FROM Comments c INNER JOIN Post p INNER JOIN Users u 
    ON p.PostID = c.PostID AND u.UserID = c.UserID WHERE p.PostID = ? 
    ORDER BY c.CommentDate DESC";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_bind_param($statement,'i',$postID);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);
    $numberofrows = mysqli_num_rows($result);

    return $result;
}

function getRank($postID){
    # establish database connection
    $db = getDB();

    # get SQL query + Bind Parameters
    $statement = "SELECT u.UserID, p.PostID, SUM(r.Number) as 'RANK' FROM Rank r 
    INNER JOIN Post p INNER JOIN Users u ON p.PostID = r.PostID AND u.UserID = p.UserID WHERE p.PostID = ? GROUP BY p.PostID";
    $statement = mysqli_prepare($db, $statement);
    mysqli_stmt_bind_param($statement,'i',$postID);
    mysqli_stmt_execute($statement);
    $result = mysqli_stmt_get_result($statement);
    $numberofrows = mysqli_num_rows($result);

    return $result;
}

function newComment($postID,$userID,$comment){
      # establish database connection
      $db = getDB();

      # INSERT NEW COMMENT into COMMENTS Table + Bind Parameters
      $statement = "INSERT INTO Comments (PostID, UserID, Comment) VALUES ($postID,$userID,'$comment')";
  
      # IF INSERT SUCCESSFUL, GO BACK TO POST. ELSE, SIGN UP BECAUSE NOT LOGGED IN. 
      if (mysqli_query($db,$statement)){ 
            $string = "post.php?id=" .$postID; 
            header("Location: ". $string);
    } else {
            header("Location: signup.php");
    };
}


?>


