<%-- 
    Document   : search_venue
    Created on : 11 16, 23, 7:56:01 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="V" class="data_management.venue" scope="session" />
        <%
        try{
        String v_venue_id = request.getParameter("venue_id");
        V.venue_id = Integer.parseInt(v_venue_id);
        int status = V.search_venue();
        
        if(status == 1){
        %>
            <h1>Search Successfully</h1>
            <p>Venue Name: <%= V.venue_name %></p>
            <p>Venue Size: <%= V.venue_size %></p>
            <p>Venue Capacity: <%= V.venue_capacity %></p>
            <p>Cost: <%= V.cost %></p>
            <p>Address: <%= V.address %></p>
            <p>Description: <%= V.description %></p>
        <%
            }else{
        %>
            <h1>Search Failed</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Search Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
