<%-- 
    Document   : admin
    Created on : Oct 20, 2019, 10:31:09 AM
    Author     : Nitesh Kr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <% response.setHeader("Cache-Control", "no-cache , no-store,revalidate");
           response.setHeader("Pragma", "no-cache");
           response.setHeader("Expires", "0");
            
            
           try{
               if(session.getAttribute("role").toString().length()<5)
           response.sendRedirect("signin.jsp");
           }
           catch (Exception e)
           {
               response.sendRedirect("signin.jsp");
           }
           
        %>
        
        
        <c:if test="${id != null}">
            <p>Welcome, ${name}</p>
        <form name="Admin" action="logout" method="POST">
            <input type="submit" value="Logout" >
        </form>
        <form name="Tickets" action="manageTickets.jsp" method="POST">
            <input type="submit" value="Manage Tickets" >
        </form>
          <form name="movies" action="manageMovies.jsp" method="POST">
            <input type="submit" value="Manage Movies" >
        </form>
    </body>
</html>
