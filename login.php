<?php

include 'include/header.php';
include 'functions.php';

$db = getDB();
$query = "SELECT * FROM Users";
$result = runQuery($db, $query);

session_start();
$username = $_POST['username'];
$password = $_POST['password'];

if (!empty($_POST)){
    if ( isset( $_POST['username'] ) && isset( $_POST['password'] ) ) {
        echo "hey";
        LogIn($username,$password);
    } 
}
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
                <h1> Login Page </h1>
                    <form  action="" method="post" name="login">
                        <div class = "form-group mt-4">
                        <input type="text" class="form-control" name ="username" placeholder="Username">
                        </div>
                        <div class = "form-group">
                        <input type="password" class="form-control" name ="password" placeholder="password">
                        </div>
                        <input type="submit" value = "Submit" class="mt-2 btn btn-secondary">
                    </form>
                    <div class = "mt-4">
                        <a href = "forgetPassword.html">Forgot your password?</a>
                        <div class="errobox" id="ero"> </div>
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