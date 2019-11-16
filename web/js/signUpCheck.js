/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkSignUp(e)
{
 var name = document.getElementById("name");
 var username = document.getElementById("username");
 var password = document.getElementById("password");
 var re_password = document.getElementById("re_password");
 
 var S="";
 var name_e = /^[A-Za-z]+[A-Za-z ]*[A-Za-z]$/;
 var username_e = /^([A-Za-z_]+[A-Za-z0-9_]*){5,}/;
 var password_e = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}$/;
 
 if(!name.value.match(name_e))
 {
      name.style.borderColor="#FF0000";
      document.getElementById("msg").innerHTML="Are you sure you entered your name correctly?" ;      
      e.preventDefault();
 }
 
 else if(!username.value.match(username_e))
 {
      username.style.borderColor="#FF0000";
      document.getElementById("msg").innerHTML="Username must starts with Alphabets or underscore and of lenght atleast 5" ;
      e.preventDefault();
 }
 
else if(!password.value.match(password_e))
 {
      
      document.getElementById("msg").innerHTML="Password must include uppercase, lowercase, number and special character" ;
      password.style.borderColor="#FF0000";
      e.preventDefault();  
 }
 
 else if(!re_password.value.match(password_e))
 {
      re_password.style.borderColor="#FF0000";
      document.getElementById("msg").innerHTML="Password must include uppercase, lowercase, number and special character" ;
      e.preventDefault();  
 }
 
 else if(!(re_password.value === password.value))
 {
     document.getElementById("msg").innerHTML="Password do not match" ;
      password.style.borderColor="#FF0000";
      re_password.style.borderColor="#FF0000";
      e.preventDefault();  
 }
 
 else if(!document.getElementById("agree-term").checked)
 {
     document.getElementById("msg").innerHTML="Please agree to terms and conditions first" ; e.preventDefault();
 }
 

}



function changeCol1()    {document.getElementById("name").style.borderColor="#ffffff";}
function changeCol2()    {document.getElementById("username").style.borderColor="#ffffff";}
function changeCol3()    {document.getElementById("password").style.borderColor="#ffffff";}
function changeCol4()    {document.getElementById("re_password").style.borderColor="#ffffff";}