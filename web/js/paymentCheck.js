/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkPayment(e){
    var cardholdername = document.getElementById("cardholdername");
    var cardnumber = document.getElementById("cardnumber");
    var expiry_month = document.getElementById("expiry-month");
    var expiry_year = document.getElementById("expiry-year");
    var cvv = document.getElementById("cvv");
    
    
    
    if(!cardholdername.value) {cardholdername.style.borderColor="#FF0000";  e.preventDefault();}
    else if( !cardnumber.value.match(/^([0-9]+){16}$/) ){ cardnumber.style.borderColor="#FF0000";  e.preventDefault();}
    else if(!expiry_month.value.match(/^[0-9]+/)) {expiry_month.style.borderColor="#FF0000";  e.preventDefault();}
    else if(!expiry_year.value.match(/^[0-9]+/)) { expiry_year.style.borderColor="#FF0000";  e.preventDefault();}
    else if(!cvv.value.match(/^([0-9]+){3,4}/)){ cvv.style.borderColor="#FF0000"; e.preventDefault();}
}

function resetCardholderColor() {cardholdername.style.borderColor="#ffffff";}
function resetCardColor() {cardnumber.style.borderColor="#ffffff";}
function resetExpiryColor(){ expiry_month.style.borderColor="#ffffff";
                            expiry_year.style.borderColor="#ffffff";}
function resetCvvColor() {cvv.style.borderColor="#ffffff";}