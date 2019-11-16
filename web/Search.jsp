<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Movies</title>
    <link rel="stylesheet" href="css/b2style.css">
     <link rel="stylesheet" href="css/card.css">
     
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
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
                    <li class="nav-item active">
                        <a class="nav-link a" href="aboutUs.jsp"> About Us<span class="sr-only">(current)</span></a>
                    </li>
                    <%
                        if(session.getAttribute("id") == null)
                        {
                    %>
                     <div class="a">
                        <button type="button" class="btn  btn-outline-primary" onclick="window.location='signin.jsp';">Sign In</button>

                    </div>
                     <% } else{%>
                           <div class="a">
                    
              <button type="button" class="btn  btn-outline-primary" onclick="window.location='logout';">Log out</button>
            </div>
                    <%  }%>
                </ul>


                <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
                    <input class="form-control mr-sm-2" type="search" name="find" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0"  type="submit">Search</button>
                </form>
            </div>
        </nav>

<!--        <button type="button" class="btn btn-outline-light btn-lg btn-block"></button>-->
     
            
                <%
            Driver driver=(Driver)(Class.forName("com.mysql.jdbc.Driver")).newInstance();
            DriverManager.registerDriver(driver);
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/showtime","root", "");
            String cont=request.getParameter("find");
            PreparedStatement stmt = con.prepareStatement("select *from movie where movie_name like ? or movie_genre like ?");
            stmt.setString(1, "%" + cont + "%");
            stmt.setString(2, "%" + cont + "%");
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
            %>
                
            <form action="bookMovie.jsp" method="post">     
      <div class="movie_card" id="bright">
    <div class="info_section">
      <div class="movie_header">
          <img class="locandina" src="<%=rs.getString("movie_primary") %>"/>
        <h1><%= rs.getString("movie_name") %></h1>
        <h4><%= rs.getString("movie_directer") %></h4>
        <span class="minutes"><%= rs.getString("movie_duration") %></span>
        <p class="type"><%= rs.getString("movie_genre") %></p>
      </div>
      <div class="movie_desc">
        <p class="text">
          <%= rs.getString("movie_desc") %>
        </p>
        <input type="hidden" name="movie_name" value="<%=rs.getString("movie_name")%>">
        <input type="submit" class="fadeIn fourth" value="Book Now" <% if(session.getAttribute("id")!=null) {%>onclick="window.location='bookMovie.jsp';"<% } else {%> onclick="window.location='signin.jsp';"<% }%>>
        <input type="hidden" name="movie_desc" value="<%=rs.getString("movie_desc")%>">
        <input type="hidden" name="movie_director" value="<%=rs.getString("movie_directer")%>">
        <input type="hidden" name="movie_primary" value="<%=rs.getString("movie_primary")%>">
        <input type="hidden" name="movie_secondary" value="<%=rs.getString("movie_secondary")%>">
          <input type="hidden" value="<%= rs.getString("movie_genre")%>" name="movie_genre">  
        
            
      </div>

    </div>
        <div class="blur_back <%= rs.getString("css")%>" >
            <style>
                .<%= rs.getString("css")%> {
                    background: url("<%= rs.getString("movie_secondary")  %>");
}

                </style>
            
            
        </div>
</div>
            </form>
       <%
            }
        %>
        
       
  
       
                
                
                
                
                
                
                
    </body>

</html>