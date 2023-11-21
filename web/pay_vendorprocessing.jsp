<%-- 
    Document   : pay_vendorprocessing
    Created on : 11 19, 23, 9:12:15 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Payment</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="PVD" class="data_management.payment_vendor" scope="session" />
        <%
        try{
        String v_transaction_id = request.getParameter("transaction_id");
        String v_payment = request.getParameter("payment");

        PVD.vendor_transaction_id = Integer.parseInt(v_transaction_id);
        PVD.payment = Float.parseFloat(v_payment);
        int status = PVD.pay_vendor();
        
        if(status == 1){
        %>
        <header>
            <h1>Payment Successful</h1>
        </header>
        <%
            }else{
        %>
        <header>
            <h1>Payment Failed</h1>
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
