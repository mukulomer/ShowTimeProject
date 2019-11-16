<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Movies</title>
        <link rel="stylesheet" href="css/b2style.css">
        <link rel="stylesheet" href="css/card.css">
         <script src="https://kit.fontawesome.com/85d77f6046.js" crossorigin="anonymous"></script>
     
     
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate1.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style1.css">
     
        <link rel="stylesheet" type="text/css" href="css/mystyle_2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <body>
        <%

//            response.setHeader("Cache-Control", "no-cache , no-store,revalidate");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Expires", "0");

            if (session.getAttribute("id") == null) {
                response.sendRedirect("signin.jsp");
            }


        %>

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
                        <c:if test="${sessionScope.id!= null}">
                            <input type="button" value="Welcome , ${sessionScope.name}"  class="btn  btn btn-outline-danger" onclick="window.location = 'welcome.jsp';">
                            <input type="button" value="Logout" class="btn  btn-outline-primary" onclick="window.location = 'logout';">
                            </div>
                            </ul>
                            </c:if>
                            <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
                                <input class="form-control mr-sm-2" type="search" name="find" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
                            </form>
                    </div>
                    </nav>


                    <div class="container">

                        <%        Driver driver = (Driver) (Class.forName("com.mysql.jdbc.Driver")).newInstance();
                            DriverManager.registerDriver(driver);
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/showtime", "root", "");
                            PreparedStatement stmt = con.prepareStatement("select *from movie");
                            int i = 0;
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next() && i < 4) {
                                i++;
                        %>
                        <form action="bookMovie.jsp" method="post">    

                            <div class="movie_card" id="bright">
                                <div class="info_section">
                                    <div class="movie_header">
                                        <img class="locandina" src="<%=rs.getString("movie_primary")%>"/>
                                        <h1><%= rs.getString("movie_name")%></h1>
                                        <h4><%= rs.getString("movie_directer")%></h4>
                                        <span class="minutes"><%= rs.getString("movie_duration")%></span>
                                        <p class="type"><%= rs.getString("movie_genre")%></p>
                                    </div>
                                    <div class="movie_desc">
                                        <p class="text">
                                            <%= rs.getString("movie_desc")%>
                                        </p>
                                        <input type="submit" class="logg" value="Book Now">
                                    </div>

                                </div>
                                <div class="blur_back <%= rs.getString("css")%>" >
                                    <style>
                                        .<%= rs.getString("css")%> {
                                            background: url("<%= rs.getString("movie_secondary")%>");
                                        }

                                    </style>


                                </div>
                            </div>
                            <input type="hidden" value="<%= rs.getString("movie_name")%>" name="movie_name">                 
                            <input type="hidden" value="<%= rs.getString("movie_desc")%>" name="movie_desc">  
                            <input type="hidden" value="<%= rs.getString("movie_duration")%>" name="movie_duration">  
                            <input type="hidden" value="<%= rs.getString("movie_primary")%>" name="movie_primary">  
                            <input type="hidden" value="<%= rs.getString("movie_secondary")%>" name="movie_secondary">  
                            <input type="hidden" value="<%= rs.getString("movie_genre")%>" name="movie_genre">  
                            <input type="hidden" value="<%= rs.getString("css")%>" name="css">
                        </form>

                        <% }%>
                    </div>                        
                        
           
            <!-- footer -->
            <footer class="footer footer_bg_1">
                <div class="footer_top">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-4 col-md-6 col-lg-4">
                                <div class="footer_widget">

                                    <div class="text-center ho">
                                      <h2>About Us</h2>
                                  </div>
                                    <p>
                                        Firmament morning sixth subdue darkness creeping gathered divide our let god moving.
                                        Moving in fourth air night bring upon it beast let you dominion likeness open place day
                                        great.
                                    </p>
                                    <div class="socail_links">
                                        <ul>
                                            <li>
                                                <a href="#">
                                                  <i class="fab fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                 <i class="fab fa-instagram"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                <i class="fab fa-linkedin"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                  <i class="fab fa-twitter"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-2 offset-xl-1 col-md-6 col-lg-3">
                                <div class="footer_widget">
                                    <h3 class="footer_title">
                                        Movies
                                    </h3>
                                    <ul>
                                    <li><a href="#">Dream Girl</a></li>
                                    <li><a href="#">Chhichhore</a></li>
                                    <li><a href="#">End Game</a></li>
                                    <li><a href="#">Black Panther</a></li>
                                    <li><a href="#">Batla House</a></li>
                                    </ul>

                                </div>
                            </div>
                            <div class="col-xl-2 col-md-6 col-lg-2">
                                <div class="footer_widget">
                                    <h3 class="footer_title">
                                        Places
                                    </h3>
                                    <ul>
                                        <li><a href="#">PVR Pacific</a></li>
                                        <li><a href="#">PVR Janakpuri</a></li>
                                        <li><a href="#">Inox</a></li>
                                        <li><a href="#">Imax</a></li>
                                        <li><a href="#">Imax Patel Nagar</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-lg-3">
                                <div class="footer_widget">
                                    <h3 class="footer_title">
                                        Address
                                    </h3>
                                    <p>
                                        200, D-block, Delhi India <br>

                                        +91 912 467 8934 <br>
                                        show@time.com
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copy-right_text">
                    <div class="container">
                        <div class="footer_border"></div>
                        <div class="row">
                            <div class="col-xl-12">

                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- footer -->
   
                
                
                
                
                
                





                        </body>

                        </html>