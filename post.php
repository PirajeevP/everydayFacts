<?php

include 'include/header.php';
include 'functions.php';

session_start();

$id = $_GET["id"];

$result = fillPost($id);
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
                        <p class = "float-left"><?php echo $row["UserName"];?></p>
                        <p class="float-right"><?php echo $row["P"];?></p>
                        <div class = "mt-5">
                            <img width="200" class = "img-fluid" src = "./images/hamster.jpg">
                            <h3 class = "mt-3"><?php echo $row["Title"];?></h3>
                            <p> SAMPLE TEXT SAMPLE TEXT SAMPLE PARAGRAPH TEXT </p>
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
                        <div class = "form-group">
                            <textarea class="form-control" id="comment-textbox" name="user-comment"></textarea>
                        </div>
                        <div class = "text-right">
                            <button type="button" class="btn btn-success">Submit</button>
                        </div>
                    </div>

                    <div class = "p-3 mt-3 user-post bg-white border border-light shadow-sm p-3 mb-5">
                        <!-- PULL FROM DATABASE THE COMMENTS.. -->
                        <h2>Discussion</h2>
                        <p class="float-left">user</p>
                        <p class="float-right">01/01/2019</p>
                        <p class="d-inline-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non efficitur diam, 
                            id molestie sapien. Duis sit amet massa posuere, eleifend mauris vel, euismod magna.
                        </p>
                        <hr> <!-- horizontal line -->
                    </div>
                </div>
                <div class = "col-md-2">
                
                    <div class = "text-center p-3 rank-area bg-white border border-light shadow-sm p-3 mb-5">
                        <p>RANK</p>
                        <h2><?php echo $row["RANK"];?></p>
                    </div>
                    <div class = "p-3 text-center mt-3 rating-area bg-white border border-light shadow-sm p-3 mb-5">
                        <img width = "50" class = "img-fluid" src="./images/thumb-up.png">
                        <p class = "mt-3"><?php echo $row["RANK"];?></p>
                        <img width = "50" class = "img-fluid" src="./images/thumb-down.png">
                    </div>
                </div>
                ...
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