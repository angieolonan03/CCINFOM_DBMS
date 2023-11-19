<%-- 
    Document   : pay_venueprocessing
    Created on : 11 19, 23, 7:43:04 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Payment</title>
    </head>
    <body>
        <jsp:useBean id="PV" class="data_management.payment_venue" scope="session" />
        <%
        try{
        String v_transaction_id = request.getParameter("transaction_id");
        String v_payment = request.getParameter("payment");

        PV.venue_transaction_id = Integer.parseInt(v_transaction_id);
        PV.payment = Float.parseFloat(v_payment);
        int status = PV.pay_venue();
        
        if(status == 1){
        %>
            <h1>Payment Successful</h1>
        <%
            }else{
        %>
            <h1>Payment Failed</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Invalid Input</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>