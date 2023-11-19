<%-- 
    Document   : register_venue
    Created on : 11 14, 23, 7:25:49 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Venue Processing</title>
    </head>
    <body>
        <jsp:useBean id="V" class="data_management.venue" scope="session" />
        <%
        try{
        String v_venue_name = request.getParameter("venue_name");
        String v_venue_size = request.getParameter("venue_size");
        String v_venue_capacity = request.getParameter("venue_capacity");
        String v_cost = request.getParameter("cost");
        String v_address = request.getParameter("address");
        String v_description = request.getParameter("description");
        V.venue_name = v_venue_name;
        V.venue_size = v_venue_size;
        V.venue_capacity = Integer.parseInt(v_venue_capacity);
        V.cost = Float.parseFloat(v_cost);
        V.address = v_address;
        V.description = v_description;
        int status = V.register_venue();
        
        if(status == 1){
        %>
            <h1>Register Successfully</h1>
        <%
            }else{
        %>
            <h1>Register Failed</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Register Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
