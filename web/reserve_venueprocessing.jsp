<%-- 
    Document   : reserve_venueprocessing
    Created on : 11 18, 23, 5:00:16 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Processing</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="RV" class="data_management.reservation_venue" scope="session" />
        <%
        try{
        String v_reservation_date = request.getParameter("reservation_date");
        String v_venue_id = request.getParameter("venue_id");
        String v_customer_id = request.getParameter("customer_id");

        RV.reservation_date = v_reservation_date;
        RV.venue_id = Integer.parseInt(v_venue_id);
        RV.customer_id = Integer.parseInt(v_customer_id);
        int status = RV.book_venue();
        
        if(status == 1){
        %>
        <header>
            <h1>Booked Successfully</h1>
        </header>
        <%
            }else{
        %>
        <header>
            <h1>Booked Failed</h1>
        </header>
        <%
            }
        }catch(Exception e){
        %>
        <header>
            <h1>Missing Fields</h1>
        </header>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
