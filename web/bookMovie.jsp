<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie</title>
        <link rel="stylesheet" href="css/b2style.css">
        <script defer type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" href="css/movie_card.css">
        <script defer src="js/fetchDate.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


    </head>

    <body>
        <%
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
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link a" href="aboutUs.jsp"> About Us<span class="sr-only">(current)</span></a>
                    </li>
                    <c:if test="${id != null}">

                        <input type="button" value="Logout" class="btn  btn-outline-primary" onclick="window.location = 'logout';">
                        </ul>

                        <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
                            <input class="form-control mr-sm-2" type="search" name="find" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
                        </form>

                        </div>
                        </nav>

                        <div class="movie-card">

                            <div class="container">

                                <a href="#">
                                    <img src="<%= request.getParameter("movie_primary")%>" alt="cover" class="cover" style="width:192px;height:282px;"></a>


                                                 <div class="<%= request.getParameter("css") %> hero" >
                                        <style>
                                            .<%= request.getParameter("css")%> {
                                                background: url("<%= request.getParameter("movie_secondary")%>");}

                                        </style>





                                    <div class="details">

                                        <div class="title1"><%=  request.getParameter("movie_name")%></div>


                                        <fieldset class="rating">
                                            <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                            <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                            <input type="radio" id="star4" name="rating" value="4" checked /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                            <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                            <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                                            <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                            <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                            <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                            <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                            <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                        </fieldset>

                                        <span class="likes">109 likes</span>

                                    </div> <!-- end details -->

                            </div> <!-- end hero -->

                            <div class="description">

                                <div class="column1">
                                    <span class="tag"><%= request.getParameter("movie_genre")%>  </span>

                                </div> <!-- end column1 -->

                                <div class="column2">

                                    <p><%= request.getParameter("movie_desc")%></p>

                             <form action="searchTheatre.jsp" method="post">
                            <input type="hidden" name="bookDate" id="currentDate">
                            <input type="hidden" name="movie_name" value="<%= request.getParameter("movie_name")%> "  >
                             <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Book Ticket</button>
                        </form>





                                </div> <!-- end column2 -->
                            </div> <!-- end description -->


                        </div> <!-- end container -->
                        </div> <!-- end movie-card -->






















                        </body>
                        </html>