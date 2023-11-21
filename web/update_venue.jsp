<%-- 
    Document   : update_venue
    Created on : 11 21, 23, 10:03:42 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Venue</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Update Venue</h1>
        </header>
        <form action="update_venueprocessing.jsp">
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
            Name:<input type ="text" id="venue_name" name ="venue_name"><br>
            Size:<input type ="text" id="venue_size" name ="venue_size"><br>
            Capacity:<input type ="number" id="venue_capacity" name ="venue_capacity"><br>
            Cost:<input type ="number" id="cost" name ="cost" step="0.01"><br>
            Address:<input type ="text" id="address" name ="address"><br>
            description<input type ="text" id="description" name ="description"><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
