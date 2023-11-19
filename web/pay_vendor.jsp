<%-- 
    Document   : pay_vendor
    Created on : 11 19, 23, 9:10:29 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay Vendor</title>
    </head>
    <body>
        <div>Pay Venue</div>
        <form action="pay_vendorprocessing.jsp">            
            Transaction ID: 
            <jsp:useBean id="RVD" class="data_management.reservation_vendor" scope="session" />
            <select name="transaction_id">
                <%
                    List<Integer> transactionIds = RVD.unpaid_vendor();
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
