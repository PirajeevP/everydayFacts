<?php

include 'include/header.php';

?>
<!DOCTYPE html>
<html>

<body>
<div class = "container">
    <div class="row">
        <div class="col-xs-5">
        <h1>Create a Free EverydayFacts Account</h1>
        </div>
    </div>
        <br>
        <form name="signUp">
        <div class="form-group row">
            <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="user" type="text" name="username" placeholder="Username"><br>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="pass" type="text" name="password" placeholder="Password"><br>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="passConf" type="text" name="passwordConf" placeholder="Confirm Password"><br>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="emailAdd" type="text" name="emailAdd" placeholder="Email"><br>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-xs-2">
            <input class = "form-control form-control-sm-2" id="emailConfirm" type="text" name="emailConfirm" placeholder="Confirm Email"><br>
            </div>
        </div>
        </form>
        <div class = "row">
        <div class="col-xs-2">
        <button class="btn btn-secondary" onclick="return validateSignUp()">Sign me up</button></th>
        </div>
        </div>
        <br>
        <div class = "row">
        <div class="col-xs-5">
        <p>By clicking "Sign Up" you agree to EveryDay Facts Terms of Service</p>
        </div>
        </div>
        <div class = "row">
        <div class="col-xs-5">
    <div class="errobox" id="ero"> </div>
    </div>
        </div>
</body>

</html>