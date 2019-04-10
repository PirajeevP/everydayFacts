<?php

include 'include/header.php';
include 'functions.php';

session_start();

$id = $_GET["id"];
$user = $_SESSION['userID'];
$comment = $_POST['user-comment'];

$result = fillPost($id);
$comments_result = getComments($id);
$rank_result = getRank($id);

# ONLY CREATES A NEW COMMENT IF COMMENT IS NOT EMPTY.
if (!empty($_POST)){
    if ( isset( $_POST['user-comment']) ){
        if ($comment != null){
            newComment($id,$user,$comment);
        } else {
            $durl = "post.php?id=" . $id;
            header ("Location: " . $durl);
        }
    } 
}

?>

<html>
    <body style="background-color: #f5fafd;">
        <div class="container mt-5">
            <div class = "row">
                <div class = "col-md-8">
                     <?php
                        if (mysqli_num_rows($result) > 0) {
                            while($row = mysqli_fetch_array($result)) {
                        ?>
                    <div class = "p-3 user-post bg-white border border-light shadow-sm p-3 mb-5">
                        <p class = "float-left"><?php echo $row["UserName"]?></p>
                        <p class="float-right"><?php echo $row["P"];?></p>
                        <div class = "mt-5 text-center">
                            <img width="200" src="./images/categories/<?php echo $row["Image"];?>.png" class="img-fluid" alt="">
                            <p class = mt-5><?php echo $row["Type"];?></p>
                            <h3 class = "mt-3"><?php echo $row["Title"];?></h3>
                            <p> <?php echo $row["Content"];?> </p>
                        </div>
                    </div>
                    
                    <?php
                        }
                    } else {
                    echo ("No Posts");
                    }
                    ?>
                 

                    <div class = "p-3 mt-3 user-post bg-white border border-light shadow-sm p-3 mb-5">
                        <h2>Join the discussion</h2>
                       <form action ="" method = "post" name="new-comment">
                        <div class = "form-group">
                            <textarea class="form-control" id="comment-textbox" name="user-comment"></textarea>
                        </div>
                        <div class = "text-right">
                            <button name = "comment-submit" type="Submit" class="btn btn-success">Submit</button>
                        </div>
                        </form>
                    </div>

                    <div class = "p-3 mt-3 user-post bg-white border border-light shadow-sm p-3 mb-5">
                        <!-- PULL FROM DATABASE THE COMMENTS.. -->
                        <h2>Discussion</h2>
                        <?php
                        if (mysqli_num_rows($comments_result) > 0) {
                            while($row = mysqli_fetch_array($comments_result)) {
                        ?>
                            <div class = "user-info d-inline-block">
                                <p class="float-left"><b><?php echo $row["UserName"];?></b></p>
                            </div>
                            <p class="float-right"><?php echo $row["P"];?></p>
                            <p class="d-block"><?php echo $row["Comment"];?></p>
                        <hr> <!-- horizontal line -->
                        <?php
                            }
                        } else {
                        echo ("No Posts");
                        }
                        ?>
                    </div>
                </div>
                <div class = "col-md-2">
                    <?php
                        if (mysqli_num_rows($rank_result) > 0) {
                            while($row = mysqli_fetch_array($rank_result)) {
                    ?>
                    <div class = "text-center p-3 rank-area bg-white border border-light shadow-sm p-3 mb-5">
                        <p>RANK</p>
                        <h2><?php echo $row["RANK"];?></p>
                    </div>
                    <div class = "p-3 text-center mt-3 rating-area bg-white border border-light shadow-sm p-3 mb-5">
                        <?php
                            $data = array(
                               'id' => $row["PostID"],
                               'vote' => "1",
                              'user' => $row["UserID"],
                            );
                        ?>
                        <a href = "updownVote-Post.php?<?php echo http_build_query($data,'', '&');?>">
                            <img width="50" src="./images/thumb-up.png" class="img-fluid" alt="">
                        </a>
                        <p class = "mt-3"><?php echo $row["RANK"];?></p>
                        <?php
                                        $data2 = array(
                                            'id' => $row["PostID"],
                                            'vote' => "0",
                                            'user' => $row["UserID"],
                                        );
                                    ?>
                                    <a href = "updownVote-Post.php?<?php echo http_build_query($data2,'', '&');?>">
                                        <img width="50" src="./images/thumb-down.png" class="img-fluid" alt="">
                                    </a>
                    </div>
                    <?php
                            }
                        } else {
                        echo ("No Comments.");
                        }
                        ?>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class = "footer bg-dark">
            <footer class="navbar navbar-expand-lg navbar-light bg-dark justify-content-between">
                <!-- Content -->
                <a href = "#" class="navbar-brand">
                    <img width="200" class = "img-fluid" src="./images/Logo-black.png">
                </a>

                <!-- Copyright -->
                <div class="text-white nav navbar-nav ml-auto">© 2019 Copyright Michelle & Pirajeev
                </div>
                <!-- Copyright -->

            </footer>
        </div>
        <!-- Footer -->
    </body>
</html>