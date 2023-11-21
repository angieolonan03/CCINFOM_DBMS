<%-- 
    Document   : search_customer
    Created on : 11 18, 23, 10:20:24 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Customer</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="C" class="data_management.customer" scope="session" />
        <%
        try{
        String c_first_name = request.getParameter("first_name");
        String c_last_name = request.getParameter("last_name");
        C.first_name = c_first_name;
        C.last_name = c_last_name;
        
        int status = C.search_customer();
        if(status == 1){
        %>
        <header>
            <h1>Search Successfully</h1>
        </header>
        <table border="1">
            <tr>
                <th>Customer ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mobile Number</th>
                <th>Address</th>
                <th>Birthday</th>
            </tr>
            <% for (int i = 0; i < C.customer_id_list.size(); i++) { %>
                <tr>
                    <td><%= C.customer_id_list.get(i) %></td>
                    <td><%= C.first_name_list.get(i) %></td>
                    <td><%= C.last_name_list.get(i) %></td>
                    <td><%= C.mobile_no_list.get(i) %></td>
                    <td><%= C.address_list.get(i) %></td>
                    <td><%= C.birthday_list.get(i) %></td>
                </tr>
            <% } %>
        </table>
        <%
            }else{
        %>
        <header>
            <h1>Search Failed</h1>
        </header>
        <%
            }
        }catch(Exception e){
        %>
        <header>
            <h1>Missing Fields</h1>
        </header>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
