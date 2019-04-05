<?php

include 'include/header.php';
include 'functions.php';


session_start();

?>

<!DOCTYPE html>

<html>
<body>
    <div class = "container">
        <div class = "row">
            <div class = "col">
                <!-- EMPTY COL: to put login in center --> 
            </div>
            <div class = "col-md-4 text-center">
                <h1> Create A Free EverydayFacts Account </h1>
                    <form  action="signupProcessing.php" method="post" name="signUp" onsubmit = "return validateSignUp()">
                        <div class = "form-group mt-4">
                        <input type="text" class="form-control" name ="username" id="user" placeholder="Username">
                        </div>
                        <div class = "form-group">
                        <input type="password" class="form-control" id="pass" name ="password" placeholder="Password">
                        </div>
                        <div class = "form-group">
                        <input type="password" class="form-control" id="passConf" name ="passwordConf" placeholder="Confirm Password">
                        </div>
                        <div class = "form-group">
                        <input type="text" class="form-control" id="emailAdd" name ="emailAdd" placeholder="Email">
                        </div>
                        <div class = "form-group">
                        <input type="text" class="form-control" id="emailConfirm" name ="emailConfirm" placeholder="Confirm Email">
                        </div>
                        <input type="submit" value = "Submit" class="mt-2 btn btn-secondary">
                    </form>
                    <div class = "mt-4">
                        <a href = "login.php">Already have an account? Log In</a>
                        
                        <!-- Error Messages -->
                        <div class="errobox" id="ero"> 
                        
                        <?php
                            echo "<br>";
                                if (isset($_GET["msg"]) && $_GET["msg"] == 'exists') {
                                    echo "User already exists. Please log in";
                                }

                                if (isset($_GET["msg"]) && $_GET["msg"] == 'failed') {
                                    echo "Email already in use";
                                }

                                if (isset($_GET["msg"]) && $_GET["msg"] == 'wp'){
                                    echo "Passwords do not match";
                                } 
                                
                                if (isset($_GET["msg"]) && $_GET["msg"] == 'we'){
                                    echo "Email must match";
                                }

                                if (isset($_GET["msg"]) && $_GET["msg"] == 'n'){
                                    echo "All fields are required";
                                }

                                if (isset($_GET["msg"]) && $_GET["msg"] == 'lp'){
                                    echo "Password must be between 1-10 characters";
                                }

                                if (isset($_GET["msg"]) && $_GET["msg"] == 'lu'){
                                    echo "Username must be between 1-16 characters";
                                }
                            ?>
                        </div>

                        
                      
                  
                    </div>
            </div>
            <div class = "col">
                <!-- EMPTY COL: to put login in center --> 
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
        
        <!-- Footer -->
        </div>
</body>

</html>