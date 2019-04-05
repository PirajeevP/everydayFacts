function validateLogIn(){
    var x = document.forms["login"]["username"].value;
    var e1 = "";
    y = true;
    if (x == "") {
        e1 += "Username cannot be empty" + "<br>";
        
        y =false;
   }else if(/^[-\w\.\$@\*\!]{1,10}$/.test(x) == false){
    e1 += "Username must be between 1-10 characters" + "<br>";
    y =false;
   }
   x = document.forms["login"]["password"].value;
   if (x == "") {
    e1 += "Password cannot be empty" + "<br>";
    y =false;
    } else if(/^[-\w\.\$@\*\!]{1,10}$/.test(x) == false){
    e1 += "Password must be between 1-10 characters" + "<br>";
    y =false;
    }
    if (e1!=""){
    	document.getElementById('ero').innerHTML = e1;
    }

    return y;
}

function validateSignUp(){
    var x = document.forms["signUp"]["username"].value;
    var dup =""
    var e1 = "";
    var y = true;
    if (x == "") {
        e1 += "Username cannot be blank" + "<br>";
        y =false;
    }else if(/^[-\w\.\$@\*\!]{1,16}$/.test(x) == false){
        e1 += "Username must be between 1-16 characters" + "<br>";
        y =false;
    }
    x = document.forms["signUp"]["password"].value;
    if (x == "") {
        e1 += "Password cannot be blank" + "<br>";
    }  else if(/^[-\w\.\$@\*\!]{1,16}$/.test(x) == false){
        e1 += "Password must be between 1-16 characters" + "<br>";
    }
    
    dup = document.forms["signUp"]["passwordConf"].value;
    if(x != dup){
        e1 += "Passwords do not match" + "<br>";
    }
    x= document.forms["signUp"]["emailAdd"].value;
    if (x == "") {
        e1 += "Email cannot be blank" + "<br>";
        y =false;
    }else if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x) == false){
        e1 += "Email is invalid" + "<br>";
        y =false;
    }
    dup = document.forms["signUp"]["emailConfirm"].value;
    if(x != dup){
        e1 += "Emails do not match" + "<br>";
    }
    if (e1!=""){
    	document.getElementById('ero').innerHTML = e1;
    }

    return y;
}