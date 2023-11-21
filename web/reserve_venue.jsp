<%-- 
    Document   : reserve_venue
    Created on : 11 18, 23, 2:40:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a Venue</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Book a Venue</h1>
        </header>
        <form action="reserve_venueprocessing.jsp">
            Reservation Date: <input type="date" id="reservation_date" name="reservation_date"><br>
            
            Venue ID: 
            <jsp:useBean id="VEN" class="data_management.venue" scope="session" />
            <select name="venue_id">
                <%
                    List<Integer> venueIds = VEN.all_venue();
                    for (int venueId : venueIds) {
                %>
                    <option value="<%=venueId%>"><%=venueId%></option>
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
