<?php

include 'include/header.php';
include 'functions.php';

session_start();

$result = getAll();

// echo "this is session id: " . $_SESSION['userID'];

// echo '<pre>';
// var_dump($_SESSION);
// echo '</pre>';




?>

<html>
    <body>
        <div class="container">
            <div class = "row">
                
                <!-- first column -->
                <div class = "col-md-6">
                <?php
                        if (mysqli_num_rows($result) > 0) {
                            while($row = mysqli_fetch_array($result)) {
                        ?>
                    <!-- POST -->
                    <div class="card mt-3 bg-white border border-light shadow-sm mb-5">
                        <div class="row no-gutters">
                            <div class="col-auto">
                                <img width="130" src="./images/hamster.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="col">
                                <div class="card-block ml-2 mt-2 mr-2 px-2">
                                    <a href="post.php?id=<?php echo $row["PostID"];?>"
                                    class="card-link">
                                    <?php echo $row["Title"]?>
                                    </a>
                                </div>

                                <div class="card-block ml-2 mr-2 mt-2 px-2">
                                    <div class = "mt-3">
                                        <p class="card-text d-inline"><?php echo $row["UserName"];?></p>
                                        <p class="card-text d-inline"><?php echo $row["P"];?></p>
                                        <p class="card-text float-right"><?php echo $row["Type"];?></p>
                                    </div>
                                </div>
                            </div>
                            <div class = "col-md-1 text-center bg-light">
                                <div class = "mt-2">
                                    <?php
                                        $data = array(
                                            'id' => $row["PostID"],
                                            'vote' => "1",
                                            'user' => $row["UserID"],
                                        );
                                    ?>
                                    <a href = "updownVote.php?<?php echo http_build_query($data,'', '&');?>">
                                        <img width="20" src="./images/thumb-up.png" class="img-fluid" alt="">
                                    </a>
                                    <p class = "mt-3"><?php echo $row["RANK"]?></p>
                                    <?php
                                        $data2 = array(
                                            'id' => $row["PostID"],
                                            'vote' => "0",
                                            'user' => $row["UserID"],
                                        );
                                    ?>
                                    <a href = "updownVote.php?<?php echo http_build_query($data2,'', '&');?>">
                                        <img width="20" src="./images/thumb-down.png" class="img-fluid" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>    
                    </div>
                     <!-- POST END -->

                     <!-- POST -->
                   
                     <!-- POST END -->
                     <?php
                            }
                        } else {
                            echo ("No Posts");
                        }
                        ?>
                </div>

                <!-- second column -->

                <div class = "col-md-6">
                    <!-- POST -->
                 
                     <!-- POST END -->

                     <!-- POST -->
                    
                     <!-- POST END -->
                </div>
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