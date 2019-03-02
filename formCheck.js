function validateLogIn(){
    var x = document.forms["login"]["username"].value;
    var e1 = "";
    y = true;
    if (x == "") {
        e1 += "username is invalid" + "<br>";
        
        y =false;
   }else if(/^[-\w\.\$@\*\!]{1,30}$/.test(x) == false){
    e1 += "username is invalid" + "<br>";
    y =false;
   }
   x = document.forms["login"]["password"].value;
   if (x == "") {
    e1 += "password is invalid" + "<br>";
    y =false;
    } else if(/^[-\w\.\$@\*\!]{1,30}$/.test(x) == false){
    e1 += "password is invalid" + "<br>";
    y =false;
    }
    if (e1!=""){
    	document.getElementById('ero').innerHTML = e1;
    }


}
function validateSignUp(){
    var x = document.forms["signUp"]["username"].value;
    var dup =""
    var e1 = "";
    var y = true;
    if (x == "") {
        e1 += "username is invalid" + "<br>";
        y =false;
    }else if(/^[-\w\.\$@\*\!]{1,30}$/.test(x) == false){
        e1 += "username is invalid" + "<br>";
        y =false;
    }
    x = document.forms["signUp"]["password"].value;
    if (x == "") {
        e1 += "password is invalid" + "<br>";
    }  else if(/^[-\w\.\$@\*\!]{1,30}$/.test(x) == false){
        e1 += "password is invalid" + "<br>";
    }
    
    dup = document.forms["signUp"]["passwordConf"].value;
    if(x != dup){
        e1 += "passwords do not match" + "<br>";
    }
    x= document.forms["signUp"]["emailAdd"].value;
    if (x == "") {
        e1 += "email is invalid" + "<br>";
        y =false;
    }else if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x) == false){
        e1 += "email is invalid" + "<br>";
        y =false;
    }
    dup = document.forms["signUp"]["emailConfirm"].value;
    if(x != dup){
        e1 += "email do not match" + "<br>";
    }
    if (e1!=""){
    	document.getElementById('ero').innerHTML = e1;
    }
}