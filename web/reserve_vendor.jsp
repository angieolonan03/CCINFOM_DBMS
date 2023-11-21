<%-- 
    Document   : reserve_vendor
    Created on : 11 19, 23, 1:53:07 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve a Caterer</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Reserve Vendor</h1>
        </header>
        <form action="reserve_vendorprocessing.jsp">
            Event Date: <input type="date" id="event_date" name="event_date"><br>
            Number of sets: <input type="number" id="sets_ordered" name="sets_ordered"><br>
            
            Vendor ID: 
            <jsp:useBean id="VE" class="data_management.vendor" scope="session" />
            <select name="vendor_id">
                <%
                    List<Integer> vendorIds = VE.all_vendor();
                    for (int vendorId : vendorIds) {
                %>
                    <option value="<%=vendorId%>"><%=vendorId%></option>
                <%
                    }
                %>
            </select><br>
            
            <jsp:useBean id="C" class="data_management.customer" scope="session" />
            Customer ID:
            <select name="customer_id">
                <%
                    List<Integer> customerIds = C.all_customers();
                    for (int customerId : customerIds) {
                %>
                    <option value="<%=customerId%>"><%=customerId%></option>
                <%  }
                %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
