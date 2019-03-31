<?php

include 'include/header.php';

?>

<!DOCTYPE html>

<html>
<body>
<div class = "container">
    <div class="row">
        <div class="col-xs-5">
            <h1>Login Page</h1>
        </div>
    </div>
     <br>
        <form name="login">
        <div class = "row">
        <div class="form-group ">
        <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="user" type="text" name="username" placeholder="Username"><br>
        </div>
        </div>
        </div>
        <div class = "row">
        <div class="form-group">
        <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="pass" type="text" name="password" placeholder="Password">
        </div>
        </div>
        </div>
        
        </form>
        <div class = "row">
        <div class="col-xs-2">
        <p><a href="forgetPassword.html">Forgot your Password?</a>
        </p>
        </div>
        </div>
        <div class = "row">
        <div class="col-xs-2">
        <button class="btn btn-secondary" onclick="return validateLogIn()">Login</button>
        </div>
        </div>
        <div class = "row">
        <div class="col-xs-2">
    <div class="errobox" id="ero"> </div>
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