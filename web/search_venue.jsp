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
        <jsp:useBean id="VEN" class="data_management.venue" scope="session" />
        <%
        try{
        String v_venue_name = request.getParameter("venue_name");
        VEN.venue_name = v_venue_name;
        int status = VEN.search_venue();
        
        if(status == 1){
        %>
            <h1>Search Successfully</h1>
        <table border="1">
            <tr>
                <th>Venue ID</th>
                <th>Venue Name</th>
                <th>Venue Size</th>
                <th>Venue Capacity</th>
                <th>Cost</th>
                <th>Address</th>
                <th>Description</th>
            </tr>
            <% for (int i = 0; i < VEN.venue_idlist.size(); i++) { %>
                <tr>
                    <td><%= VEN.venue_idlist.get(i) %></td>
                    <td><%= VEN.venue_namelist.get(i) %></td>
                    <td><%= VEN.venue_sizelist.get(i) %></td>
                    <td><%= VEN.venue_capacitylist.get(i) %></td>
                    <td><%= VEN.costlist.get(i) %></td>
                    <td><%= VEN.addresslist.get(i) %></td>
                    <td><%= VEN.descriptionlist.get(i) %></td>
                </tr>
            <% } %>
        </table>
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
