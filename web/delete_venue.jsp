<%-- 
    Document   : delete_venue
    Created on : 11 16, 23, 5:55:36 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Venue</title>
    </head>
    <body>
        <jsp:useBean id="VEN" class="data_management.venue" scope="session" />
        <%
        try{
        String v_venue_id = request.getParameter("venue_id");
        VEN.venue_id = Integer.parseInt(v_venue_id);
        int status = VEN.delete_venue();
        
        if(status == 1){
        %>
            <h1>Delete Successfully</h1>
        <%
            }else{
        %>
            <h1>Delete Failed</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Delete Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
