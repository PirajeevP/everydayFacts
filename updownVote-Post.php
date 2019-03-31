<!-- <?php
include 'include/config.php';
include 'functions.php';


/*

IMPORTANT: THIS IS FOR POST.PHP ONLY

*/

# intialize the session
session_start();

# if user is logged in, then apply rankings
if ( isset( $_SESSION['userID'])) {
    // get URL values
    $PostID = $_GET['id'];
    $Vote = $_GET['vote'];
    $UserID = $_SESSION['userID'];

    # create array that holds user ID, post ID, and weight of a vote. 
    $item = array(
        "UserID" => $UserID,
        "PostID" => $PostID,
        "Vote" => $Vote,
    );

    # add array item to user session
    $_SESSION["uservote"][] = $item;

    # establish database connection
    $db = getDB();

    # for each item in user vote for this particular user.. update rankings
    foreach ($_SESSION["uservote"] as $key => $val){
        $postID = $val["PostID"];
        $userID = $val["UserID"];
        $vote = $val["Vote"];

        $statement = "INSERT INTO Rank (UserID, PostID, Number) VALUES ($userID,$postID,$vote) ON DUPLICATE KEY UPDATE Number = $vote";
        
        # if update is sucessful, delete items in USERVOTE for particular user
        if (mysqli_query($db,$statement)){
            echo "sucesss";      
            unset($_SESSION["uservote"]);
        } else {
            echo "Error";
            unset($_SESSION["uservote"]);
        };
    } 
        # redirect back to the post page with new ranking
        $string = "post.php?id=" .$PostID; 
        header("Location: ". $string);
    } else { 
        # redirect to SIGN UP since no user is logged in
        header("Location: signup.php");
    }

?> 