<%-- 
    Document   : manageMovies
    Created on : Oct 21, 2019, 11:32:20 PM
    Author     : Nitesh Kr
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/table.css">
         <link rel="stylesheet" href="css/mystyle_1.css">
         
    </head>
    <body>
        <%
            if(request.getAttribute("msg") != null)
            {
            %>
            <p>Insertion was sucessfull</p>
        <% 
             response.setHeader("refresh","3:url=manageMovies.jsp");
        }
        
        
        %>
        
        
        
        
        <form action="insertMovie" method="post" class="container">
               <input type="submit" value="Insert" >
        <table>    
            <thead>
                <tr>
                    <td>Column</td>
                    <td>Type</td>
                    <td>Value</td>
                </tr>
            </thead>
            
            <tr>    
                <td>Movie ID</td> 
                <td>varchar(4)</td>
                <td><input type="text" name="movie_id" placeholder="MXXX" maxlength="4"></td> 
            </tr>
            <tr>    
                <td>Movie Name</td> 
                <td>varchar(40)</td>
                <td><input type="text" name="movie_name" placeholder="Rockstar" maxlength="40"></td> 
            </tr>
            <tr>    
                <td>Movie Price</td> 
                <td>int(4)</td>
                <td><input type="text" name="movie_price" placeholder="xxx" maxlength="4" ></td> 
            </tr>
            <tr>    
                <td>Movie Genre</td> 
                <td>Varchar(30)</td>
                <td><input type="text" name="movie_genre" placeholder="Horror" maxlength="30"></td> 
            </tr>
            <tr>    
                <td>Movie Duration</td> 
                <td>time in minutes</td>
                <td><input type="text" name="movie_duration" placeholder="xxx min" ></td> 
            </tr>
            <tr>    
                <td>Movie Director</td> 
                <td>Varchar(40)</td>
                <td><input type="text" name="movie_director" placeholder="Director's name" ></td> 
            </tr>
            <tr>    
                <td>Movie Description</td> 
                <td>Varchar(200)</td>
                <td><input type="text" name="movie_desc" placeholder="Description" ></td> 
            </tr>
            <tr>    
                <td>Movie Primary Image Url</td> 
                <td>Varchar(300)</td>
                <td><input type="text" name="movie_primary" placeholder="images/a.jpg" ></td> 
            </tr>
            <tr>    
                <td>Movie Secondary Image Url</td> 
                <td>Varchar(300)</td>
                <td><input type="text" name="movie_secondary" placeholder="images/a.jpg" ></td> 
            </tr>
            <tr>    
                <td>Movie Css class</td> 
                <td>Varchar(10)</td>
                <td><input type="text" name="css" placeholder="fadeIn" ></td> 
            </tr>
        
        </table>
         
        </form>
    </body>
</html>