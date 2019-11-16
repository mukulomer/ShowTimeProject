/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkSignIn(e)
{ 
    var username = document.getElementById("login");
    var password = document.getElementById("password");
    

    var uLetters = /^([A-Za-z_]+[A-Za-z0-9_]*){7,}/;
    var pLetters = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
    if (!username.value.match(uLetters)) {
      document.getElementById("login").style.borderColor="#FF0000";
     
      e.preventDefault();
    }
    
    if(!password.value.match(pLetters))
    {
//         var S = "Invalid Password : Password must include uppercase, lowercase, number and special character";
//         document.getElementById("pass").innerHTML=S;
         document.getElementById("password").style.borderColor="#FF0000";
         e.preventDefault();
    }
   
    
    
}
function show(){
    var pwd = document.getElementById("password");
    if (pwd.type === 'password') {
        pwd.type = 'text';
    } else {
        pwd.type = 'password';
    }
}

function changeCol1()    {document.getElementById("login").style.borderColor="#ffffff";}

function changeCol2()   {document.getElementById("password").style.borderColor="#ffffff";}


