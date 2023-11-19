<%-- 
    Document   : update_venue
    Created on : 11 16, 23, 6:28:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Venue</title>
    </head>
    <body>
        <jsp:useBean id="VEN" class="data_management.venue" scope="session" />
        <%
        try{
        String v_venue_id = request.getParameter("venue_id");
        String v_venue_name = request.getParameter("venue_name");
        String v_venue_size = request.getParameter("venue_size");
        String v_venue_capacity = request.getParameter("venue_capacity");
        String v_cost = request.getParameter("cost");
        String v_address = request.getParameter("address");
        String v_description = request.getParameter("description");
        VEN.venue_id = Integer.parseInt(v_venue_id);
        VEN.venue_name = v_venue_name;
        VEN.venue_size = v_venue_size;
        VEN.venue_capacity = Integer.parseInt(v_venue_capacity);
        VEN.cost = Float.parseFloat(v_cost);
        VEN.address = v_address;
        VEN.description = v_description;
        int status = VEN.update_venue();
        
        if(status == 1){
        %>
            <h1>Update Successfully</h1>
        <%
            }else{
        %>
            <h1>Update Failed</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Update Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
