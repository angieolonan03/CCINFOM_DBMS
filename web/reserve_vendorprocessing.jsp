<%-- 
    Document   : reserve_vendorprocessing
    Created on : 11 19, 23, 1:54:42 PM
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
        <jsp:useBean id="RVD" class="data_management.reservation_vendor" scope="session" />
        <%
        try{
        String v_event_date = request.getParameter("event_date");
        String v_sets_ordered = request.getParameter("sets_ordered");
        String v_vendor_id = request.getParameter("vendor_id");
        String v_customer_id = request.getParameter("customer_id");

        RVD.event_date = v_event_date;
        RVD.sets_ordered = Integer.parseInt(v_sets_ordered);
        RVD.vendor_id = Integer.parseInt(v_vendor_id);
        RVD.customer_id = Integer.parseInt(v_customer_id);
        int status = RVD.reserve_vendor();
        
        if(status == 1){
        %>
        <header>
            <h1>Reservation Successful</h1>
        </header>
        <%
            }else{
        %>
        <header>
            <h1>Reservation Failed</h1>
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
