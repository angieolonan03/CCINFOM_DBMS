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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="C" class="data_management.customer" scope="session" />
        <%
        try{
        String c_customer_id = request.getParameter("customer_id");
        C.customer_id = Integer.parseInt(c_customer_id);
        int status = C.search_customer();
        if(status == 1){
        %>
            <h1>Search Successfully</h1>
            <p>First Name: <%= C.first_name %></p>
            <p>Last Name: <%= C.last_name %></p>
            <p>Mobile Number: <%= C.mobile_no %></p>
            <p>Address: <%= C.address %></p>
            <p>Birthday: <%= C.birthday %></p>
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
