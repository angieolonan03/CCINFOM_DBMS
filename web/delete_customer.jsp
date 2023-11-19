<%-- 
    Document   : delete_customer
    Created on : 11 17, 23, 10:43:14 PM
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
        String v_customer_id = request.getParameter("customer_id");
        C.customer_id = Integer.parseInt(v_customer_id);
        int status = C.delete_customer();
        
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
