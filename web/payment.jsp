<%-- 
    Document   : payment
    Created on : Nov 2, 2019, 9:32:56 AM
    Author     : Nitesh Kr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link rel="stylesheet" href="css/payment.css">
        <script defer  src="js/paymentCheck.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache , no-store,revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");


        %>
        <div class="container">

            <div class="card__container">
                <div class="card">
                    <div class="row paypal">
                        <div class="price">
                            <center><h1>Awesome, that's ₹<%= request.getParameter("amount")%> !</h1></center>
                        </div>
                    </div>
                    <div class="row credit">
                        <div class="left">
                            <input id="cd" type="radio" name="payment" checked/>
                            <div class="radio"></div>
                            <label for="cd">Debit/ Credit Card</label>
                        </div>
                        <div class="right">
                            <img src="images/visa.jpg" alt="visa" />
                            <img src="images/mastercard.png" alt="mastercard" />
                            <img src="images/amex.png" alt="amex" />
                            <img src="images/cirrus.png" alt="cirrus" />
                        </div>
                    </div>
                    <div class="row cardholder">
                        <div class="info">
                            <label for="cardholdername">Name</label>
                            <input placeholder="e.g. Richard Bovell" id="cardholdername" type="text" onfocus="resetCardholderColor()" required/>
                        </div>
                    </div>
                    <div class="row number">
                        <div class="info">
                            <label for="cardnumber">Card number</label>
                            <input id="cardnumber" type="text" pattern="[0-9]{16,19}" minlength="19" maxlength="22" placeholder="8888-8888-8888-8888" onfocus="resetCardColor()" required />
                        </div>
                    </div>
                    <div class="row details">
                        <div class="left">
                            <label for="expiry-date">Expiry</label>
                            <select id="expiry-month"  onfocus="resetExpiryColor()" required>
                                <option>MM</option>
                                <option value="1">01</option>
                                <option value="2">02</option>
                                <option value="3">03</option>
                                <option value="4">04</option>
                                <option value="5">05</option>
                                <option value="6">06</option>
                                <option value="7">07</option>
                                <option value="8">08</option>
                                <option value="9">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <span>/</span>
                            <select id="expiry-year" onfocus="resetExpiryColor()" required>
                                <option>YYYY</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                                <option value="2028">2028</option>
                                <option value="2029">2029</option>
                                <option value="2030">2030</option>
                            </select>
                        </div>
                        <div class="right">
                            <label for="cvv">CVC/CVV</label>
                            <input type="text" maxlength="4" minlength="3" id="cvv" placeholder="123" onfocus="resetCvvColor()" required/>
                            <span data-balloon-length="medium" data-balloon="The 3 or 4-digit number on the back of your card." data-balloon-pos="up">i</span>
                        </div>
                    </div>
                </div>
            </div>
            <form action="generateTicket" method="post">
                <div class="button">
                    <input type="hidden" name="movie_name" value="<%=request.getParameter("movie_name")%>">
                    <input type="hidden" name="date" value="<%=request.getParameter("date")%>">

                    <input type="hidden" name="slot" value="<%=request.getParameter("slot")%>">
                    <input type="hidden" name="theatre_name" value="<%=request.getParameter("theatre_name")%>">
                    <input type="hidden" name="screen_id" value="<%=request.getParameter("screen_id")%>">
                    <input type="hidden" name="timing" value="<%=request.getParameter("timing")%>">
                    <input type="hidden" name="amount" value="<%=request.getParameter("amount")%>">
                    <input type="hidden" name="client_seats" value="<%=request.getParameter("client_seats")%>">
                    <input type="hidden" name="tt" value="<%=request.getParameter("reserved")%>">

                    <button type="submit" onclick="checkPayment(event)"><i class="ion-locked"></i> Confirm and Pay</button>
                </div>
            </form>
        </div>
    </body>
</html>
