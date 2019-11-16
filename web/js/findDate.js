var date;
$(document).ready(function() {

    //alert("creating button");
    date = new Date();
    var d1 = document.createElement("button");
    d1.innerHTML = date.getDate().toString();
    d1.classList.add("btn");
    d1.classList.add("btn-secondary");
     var year=date.getFullYear();
        var month=date.getMonth()+1;      
        var tarik=date.getDate();
        
        if(tarik.length<2)
            tarik='0'+tarik;
        if(month.length<2)
            month='0'+month;
        var Ymd=[year,month,tarik].join('-').toString();
    
    d1.value = Ymd;

    document.getElementById("date1").appendChild(d1);



    for (var i = 1; i < 6; i++) {
        date.setDate(date.getDate()+1)
        var year=date.getFullYear();
        var month=date.getMonth()+1;      
        var tarik=date.getDate();
        
        if(tarik.length<2)
            tarik='0'+tarik;
        if(month.length<2)
            month='0'+month;
        var Ymd=[year,month,tarik].join('-').toString();
        //alert("ymd"+Ymd);
        d1 = document.createElement("button");
        d1.innerHTML = date.getDate().toString();
        d1.classList.add("btn");
        d1.classList.add("btn-secondary");
     
        d1.value = Ymd;
        d1.name=date.getDate().toString();
        document.getElementById("date1").appendChild(d1);

    }

$(".btn-secondary").on('click',function()
{
    var val=this.value;
    var put=document.getElementById("date12");
    put.value=val;
    document.getElementById("dateForm").submit();
    
    
    
    
});



});