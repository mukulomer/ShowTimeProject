<%-- 
    Document   : searchTheatre
    Created on : 25 Oct, 2019, 8:38:52 PM
    Author     : manish
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Theatre list </title>
        <script defer type="text/javascript" src="js/findDate.js"></script>
        <script defer type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
          
            <link rel="stylesheet" href="css/b2style.css">
    
         <script src="https://kit.fontawesome.com/85d77f6046.js" crossorigin="anonymous"></script>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

     

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top ">
            <a class="navbar-brand a brand" href="index.jsp">ShowTime</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link a" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link a" href="booking.jsp">Movies <span class="sr-only">(current)</span></a>
                        <li class="nav-item active">
                            <a class="nav-link a" href="bookedTickets.jsp"> Booked Movie<span class="sr-only">(current)</span></a>
                    </li>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link a" href="aboutUs.jsp"> About Us<span class="sr-only">(current)</span></a>
                    </li>
                    <div class="a">
                        <c:if test="${id != null}">
                            <input type="button" value="Welcome , ${sessionScope.name}"  class="btn  btn btn-outline-danger" onclick="window.location = 'welcome.jsp';">
                            <input type="button" value="Logout" class="btn  btn-outline-primary" onclick="window.location = 'logout';">
                            </div>
                            </ul>

                            <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
                                <input class="form-control mr-sm-2" type="search" name="find" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
                            </form>
                    </div>
                    </nav>
        <button type="button" class="btn  btn-lg btn-block"></button>
        
        
        <form action="searchTheatre" action="post" id="dateForm">
        <div class="btn-group mr-2" role="group" aria-label="First group" id="date1"></div>
        <input type="hidden" name="movie_name" value="<%= request.getParameter("movie_name") %>">
        <input type="hidden" name="bookDate" id="date12" >
        
        </form>
   <%
       
       Driver driver=(Driver)(Class.forName("com.mysql.jdbc.Driver").newInstance());
       DriverManager.registerDriver(driver);
       String movie_name=request.getParameter("movie_name");
     
       String date=request.getParameter("bookDate");
       if(request.getAttribute("servlet")!=null)
       {
           date=request.getAttribute("bookDate").toString();
           //out.print("date is"+date);
       }
       request.setAttribute("date",date);
           
       
       String times;
       int slotc;
       String []slots;
       Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/showtime","root","");
       PreparedStatement stmt=con.prepareStatement("select *from reservation where movie_name=? and date=?");
       stmt.setString(1,movie_name);
       stmt.setString(2,date);
       ResultSet rs=stmt.executeQuery();
       PreparedStatement ts=con.prepareStatement("select timing from time_slots where slot_id=?");
       
       while(rs.next())
       {
           
      times= rs.getString("slot_id");
      ts.setString(1,times);
   %>
   
     <div class="panel panel-success">
         <div class="panel-heading">
             <%= rs.getString("theatre_name") %>
            
         </div>
      
        
      <% ResultSet rss=ts.executeQuery();         
         while(rss.next()){ %>
         <form action="bookSeats" method="post" class="panel-body"> 
         <input type="hidden" name="movie_name" value="<%= request.getParameter("movie_name") %>">
         <input type="hidden" name="date" value="<%= request.getAttribute("date")  %>">
    
         <input type="hidden" name="slot" value="<%= rs.getString("slot_id") %>">
         <input type="hidden" name="theatre_name" value="<%= rs.getString("theatre_name") %>">
         <input type="hidden" name="screen_id" value="<%= rs.getString("screen_id") %>">
         <input type="hidden" name="timing" value="<%= rss.getString("timing") %>">
         
         <button type="submit" name="getTime" class="btn btn-outline-dark" ><%= rss.getString("timing") %></button>
       
           </form>    
         
       <% } %>
          
      
      
       
    </div>
    <% } %>
    </body>
</html>
