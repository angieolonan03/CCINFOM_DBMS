<%-- 
    Document   : pay_venue
    Created on : 11 19, 23, 6:36:21 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venue Payment</title>
    </head>
    <body>
        <div>Pay Venue</div>
        <form action="pay_venueprocessing.jsp">            
            Transaction ID: 
            <jsp:useBean id="RV" class="data_management.reservation_venue" scope="session" />
            <select name="transaction_id">
                <%
                    List<Integer> transactionIds = RV.unpaid_venue();
                    for (int transactionId : transactionIds) {
                %>
                    <option value="<%=transactionId%>"><%=transactionId%></option>
                <%
                    }
                %>
            </select><br>
            
            Payment: <input type="number" id="payment" name="payment">
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
