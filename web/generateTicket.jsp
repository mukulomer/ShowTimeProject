<%-- 
    Document   : generateTicket
    Created on : Nov 3, 2019, 7:54:43 PM
    Author     : Nitesh Kr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket</title>
        <link rel="stylesheet" href="css/ticket.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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


<div class="ticket">
    <div class="holes-top"></div>
    <div class="title">
        <p class="cinema"><%= request.getParameter("theatre_name") %>(Screen No.<%= request.getParameter("screen_id")    %>)</p>
        
        <p class="movie-title"><%=  request.getParameter("movie_name") %></p>
    </div>
    <div class="poster">
        <img src="<%= request.getAttribute("movie_image") %>" alt="Movie: <%=  request.getParameter("movie_name") %>" />
    </div>
    <div class="info">
        <table>
            <tr>
                <th>BOOKING NO.</th>
                
                <th>SEAT</th>
            </tr>
            <tr>
                <td class="bigger"><%= request.getAttribute("booking_id") %></td>
               
                <td class="bigger"><%= request.getParameter("client_seats") %></td>
            </tr>
        </table>
        <table>
            <tr>
                <th>PRICE</th>
                <th>DATE</th>
                <th>TIME</th>
            </tr>
            <tr>
                <td><%= request.getParameter("amount") %></td>
                <td><%=  request.getParameter("date")  %></td>
                <td><%= request.getParameter("timing") %></td>
            </tr>
        </table>
    </div>
    <div class="holes-lower"></div>
    <div class="serial">
        <table class="barcode">
            <tr></tr>
        </table>
        <table class="numbers">
            <tr>
                <td>9</td>
                <td>1</td>
                <td>7</td>
                <td>3</td>
                <td>7</td>
                <td>5</td>
                <td>4</td>
                <td>4</td>
                <td>4</td>
                <td>5</td>
                <td>4</td>
                <td>1</td>
                <td>4</td>
                <td>7</td>
                <td>8</td>
                <td>7</td>
                <td>3</td>
                <td>4</td>
                <td>1</td>
                <td>4</td>
                <td>5</td>
                <td>2</td>
            </tr>
        </table>
    </div>
</div>
    </body>
</html>
