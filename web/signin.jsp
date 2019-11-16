<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <link rel="stylesheet" href="css/b2style.css">
      
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!--       <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
        <script defer  src="js/signInCheck.js"></script>

    </head>

    <body>
        <%
            if (session.getAttribute("id") != null) {
                if (session.getAttribute("role").equals("admin")) {
                    response.sendRedirect("admin.jsp");

                } else {
                    response.sendRedirect("welcome.jsp");

                }
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
                    <div class="a">
                        <button type="button" class="btn  btn-outline-primary" onclick="window.location = 'signin.jsp';">Sign In</button>

                    </div>
                </ul>



            </div>
        </nav>

        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <i class="large material-icons">account_circle</i>
                </div>
                <%                     if (request.getParameter("error") != null) {
                %> 
                <script>
                    alert("incorrect username or password");
                </script>
                <% }%>
                 <%                     if (request.getParameter("created") != null) {
                %> 
                <script>
                    alert("account created successfully");
                </script>
                <% }%>
                <!-- Login Form -->
                <form action="Signin" method="post" id="form-signin">
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username" onfocus="changeCol1()" required>
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password" onfocus="changeCol2()" required> 

                    
                       <br>
                        <span class="input-group-btn">
                            <button value="eye" class="btn btn-default reveal" onclick="show()" type="button"><i class="glyphicon glyphicon-eye-open" ></i></button>
                        </span>          
                    


                    <input type="submit" class="fadeIn fourth" id="submit1" value="Log In" onclick="checkSignIn(event)" >
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="signup.jsp">Don't have an Account create one</a>
                </div>

            </div>
        </div>

    </body>

</html>