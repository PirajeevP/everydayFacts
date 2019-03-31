<!DOCTYPE html>
<html lang = "en">

<?php
session_start(); 
?>
<!-- This file contains the header for each page for navigation -->
    <head>
         <!-- Required meta tags -->
         <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

         <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- other css -->
        <link href="./css/style2.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="js/formCheck.js"></script>
        <title>EverydayFacts</title>
    </head>

    <nav class = "navbar navbar-expand-lg navbar-light justify-content-between bg-white border border-light shadow-sm p-3 mb-5">
    
    <!-- logo -->
        <a href = "index.php" class="navbar-brand">
            <img width="200" class = "img-fluid" src="./images/Logo.png">
        </a>
    
    <!-- links -->
    <div class = "collapse navbar-collapse" id="navbarSupportedContent">
        
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.php">All Facts</a>
                </li>


                <?php
                    if ( isset( $_SESSION['userID'])) {
                        $a = $_SESSION['userID'];
                ?>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.php">My Facts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#!">Post</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary" href="./logout.php">Log Out</a>
                    </li>

                <?php
                    } else { 
                ?>
                    <li class="nav-item">
                        <a class="btn btn-primary" href="signup.php">Sign Up</a>
                    </li>
            
                <?php
                }
                ?>
            </ul>
        </div>

    </nav>
</html>