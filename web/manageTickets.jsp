<%-- 
    Document   : manageTickets
    Created on : Oct 20, 2019, 9:53:45 P
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
        <title>Ticket List</title>
        <link rel="stylesheet" href="css/table.css">
        
        <style type="text/css">
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 18px 20px;
                margin: 30px auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {		
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;		
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {        
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }	
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 10px 18px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {        
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }   
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }  
            .yf{
                padding: 10px;
            }
        </style>
    </head>
    <body>
        
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>User<th>
                            <th>Movie</th>
                            <th>Theater</th>
                            <th>Date</th>						
                            <th>Seats</th>						
                            <th>Amount</th>
                           <th>Action</th>
                        </tr>

                    </thead>
                </table>
        <%
            if(request.getParameter("d")!=null)
            {
        %>
        <script>
            alert("cancelled sucessfully");
        </script>
        <% } %>
                <%  Driver driver = (Driver) Class.forName("com.mysql.jdbc.Driver").newInstance();
                    DriverManager.registerDriver(driver);
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/showtime", "root", "");
                    PreparedStatement st = con.prepareStatement("SELECT * FROM ticket");
                    ResultSet rs = st.executeQuery();
                    int count = 1;
                    while (rs.next()) {

                %>

                <form id="columnForm" action="adminDelete" method="post">
                    <table class="table table-striped table-hover">


                        <tbody>

                            <tr>
                                <td><%=count%></td>
                                <td><%=rs.getString(1)%></td>
                                <td><input type="hidden" value="<%=rs.getString(3)%>" name="movie_name"><%=rs.getString(3)%></td>
                                <td><input type="hidden" value="<%=rs.getString(2)%>" name="theatre_name"><%=rs.getString(2)%></td>
                                <td><input type="hidden" value="<%=rs.getString(6)%>" name="booking_date"><%=rs.getString(6)%></td>   
                                <td><input type="hidden" value="<%=rs.getString(10)%>" name="seats_booked"><%=rs.getString(10)%></td>
                                <td> <input type="hidden" value="<%=rs.getString(3)%>" name="movie_price"><%=rs.getString(4)%></td>                            

                        <input type="hidden" value="<%=rs.getString("slot_id")%>" name="slot_id">
                        <input type="hidden" value="<%=rs.getString("show_time")%>" name="show_time">
                     
                    
                        <td ><center> <button  name="cancel" type="submit">Cancel</button></center>
                        </td>
                        
                        </td>
                        </tr>
                        </tbody>
                    </table>
                </form>          
                <% count++;
                    }

                %>
        
    </body>
</html>