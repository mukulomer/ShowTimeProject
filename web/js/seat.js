/* global length1, amount */

var seats;
var array1;
var price;
var total = 0;
var length1;
var amount;

$(document).ready(function() {

    seats = document.getElementById("reserved").value;
  
    array1 = seats.split(',');

    length1 = array1.length - 1;
  
    var i;
    
    for (i = 0; i < array1.length; i++) {
        let set = document.getElementById(array1[i].toString());
        try{
        set.disabled = true;
        }
        catch(err){}


    }
    price = document.createElement("INPUT");
    price.setAttribute("type", "text");
    price.setAttribute("name","price");
    price.setAttribute("value", "Total Price Rs." + total);
    price.setAttribute("disabled", true);
    amount=document.createElement("INPUT");
    amount.setAttribute("type","hidden");
    amount.setAttribute("value",""+total);
    amount.setAttribute("name","amount");
    document.getElementById("seats_form").appendChild(price);
    document.getElementById("seats_form").appendChild(amount);


});




$('input[type="checkbox"]').click(function() {
    if ($(this).prop("checked") == true) {
        array1.push($(this).attr('id'));
       

        if ($(this).attr('id').toString().match(/^[A][0-9]+/)) {
            total = total + 200;
            price.setAttribute("value", "Total Price Rs." + total);
            amount.setAttribute("value",""+total);
 
        }
        if ($(this).attr('id').toString().match(/^[B][0-9]+/)) {
            total = total + 300;
            price.setAttribute("value", "Total Price Rs." + total);
            amount.setAttribute("value",""+total);
         
        }
        if ($(this).attr('id').toString().match(/^[C][0-9]+/)) {
            total = total + 400;
            price.setAttribute("value", "Total Price Rs." + total);
            amount.setAttribute("value",""+total);
           
        }
    }



    if ($(this).prop("checked") == false) {

      

    }
    if (!$(this).is(':checked')) {

        if ($(this).attr('id').toString().match(/^[A][0-9]+/g)) {
            if(total>0)
            {total = total - 200;
            price.setAttribute("value", "Total Price Rs." + total);
            amount.setAttribute("value",""+total);
            }
        }
        if ($(this).attr('id').toString().match(/^[B][0-9]+/g)) {
            if(total>0)
            {
                total = total - 300;
            
                price.setAttribute("value", "Total Price Rs." + total);
            
                amount.setAttribute("value",""+total);
                
            }
        }
        if ($(this).attr('id').toString().match(/^[C][0-9]+/g)) {
           if(total>0){
            total = total - 400;
            price.setAttribute("value", "Total Price Rs." + total);
            amount.setAttribute("value",""+total);
           
        }
        }
        var index = array1.indexOf($(this).attr('id'));
   
        if (index > -1) {
            array1.splice(index, 1);
        }
    }




});
document.getElementById("PROCEED").addEventListener("click", function(event) {
    if(total==0)
    {  alert("Please Select A Seat To Proceed");
        
        event.preventDefault();
      
        document.location.reload();
    }
    var m = 0;
    var sets = "";
    
    length1=length1+1;
    
    for (m = length1; m < array1.length; m++) {
        sets = sets + array1[m] + ",";
        
    }
    


    document.getElementById("client_seats").value = sets;
    document.getElementById("reserved").value = array1.join();



});