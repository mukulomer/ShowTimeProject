
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/about.css">
    <script src="https://kit.fontawesome.com/85d77f6046.js" crossorigin="anonymous"></script>

<!-- footer css -->

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate1.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style1.css">

<link rel="stylesheet" href="css/b2style.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
                    </li>
                    <% if(session.getAttribute("id")!=null)
                    {
                    %>
                     <li class="nav-item active">
                         <a class="nav-link a" href="bookedTickets.jsp">BookedMovies <span class="sr-only">(current)</span></a>
                    </li>
                    <% } %>
                    <li class="nav-item active">
                        <a class="nav-link a" href="aboutUs.jsp"> About Us<span class="sr-only">(current)</span></a>
                    </li>
                     <div class="a">
                        <% if(session.getAttribute("id")!=null){ %>
                        
                            <input type="button" value="Welcome , ${sessionScope.name}"  class="btn  btn btn-outline-danger" onclick="window.location = 'welcome.jsp';">
                            <input type="button" value="Logout" class="btn  btn-outline-primary" onclick="window.location = 'logout';">
                            </div>
                         
                            <% } else { %>
                            
                    <div class="a">
                        <button type="button" class="btn  btn-outline-primary" onclick="window.location = 'signin.jsp';">Sign In</button>

                    </div>
                   <%}%>



                </ul>


                <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
                    <input class="form-control mr-sm-2" type="search" name="find" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
                </form>
            </div>
        </nav>


<section class="about" id="about">
            <div class="container">
                <div class="heading text-center">
                    <h2>About
                        <span>Us</span></h2>
                    <p>
                      Founded in october 2019, by young scholars of DDUC, University of Delhi. The site seeks to use the great growling engine of change the technology to our comfort. The ultimate goal behind designing this website is to make you the master of the world that you command by just a click on your smart screens (cellphones). We promise to deliver agile online bookings of your favourite movies from anytime anywhere.


                    </p>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <img src="images/war.jpeg" alt="about" class="img-fluid" width="100%">
                    </div>
                    <div class="col-lg-6">
                      <img src="images/dream_s.jpg" alt="about" class="img-fluid" width="100%">
                </div>
            </div>
        </section>








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
                                        Created BY
                                    </h3>
                                    <p>
                                        Nitesh Kumar <br>

                                        Mukul Omer <br>
                                        Tarun Verma <br>
                                        Ricky Rajat Kerketta
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