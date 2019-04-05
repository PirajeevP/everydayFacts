<?php
include 'include/config.php';
include 'include/functions.php';

    // $db = getDB();

    // echo "HEY";
    $deleteIds = $_POST['checkbox'];   // it will be an array
    echo $deleteIds;
    // $sql = "DEFRE FROM tablename WHERE id in (".implode("," , $deleteIds).") ";
    // $statement = "DELETE FROM Post WHERE PostID in (".implode("," , $deleteIds).") ";
        
    //     if (mysqli_query($db,$statement)){
    //         echo "sucesss";     
    //         // $_SESSION['userID'] = $username;
    //         $success = 1;   
    //     } else {
    //         echo "Error in creating new user";
    //         $success = -2;
    //     };
    // // run the query

 

?>