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
        <title>Delete Customer</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="form-container">
        <jsp:useBean id="C" class="data_management.customer" scope="session" />
        <%
        try{
        String v_customer_id = request.getParameter("customer_id");
        C.customer_id = Integer.parseInt(v_customer_id);
        int status = C.delete_customer();
        
        if(status == 1){
        %>
        <header>    
        <h1>Delete Successfully</h1>
        </header>
        <%
            }else{
        %>
        <header>    
        <h1>Delete Failed</h1>
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
        </div>
    </body>
</html>
