<%-- 
    Document   : register_customer
    Created on : 11 17, 23, 4:00:03 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Customer</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="C" class="data_management.customer" scope="session" />
        <%
        try{
        String c_first_name = request.getParameter("first_name");
        String c_last_name = request.getParameter("last_name");
        String c_mobile_no = request.getParameter("mobile_no");
        String c_address = request.getParameter("address");
        String c_birthday = request.getParameter("birthday");
        C.first_name = c_first_name;
        C.last_name = c_last_name;
        C.mobile_no = Integer.parseInt(c_mobile_no);
        C.address = c_address;
        C.birthday = c_birthday;
        int status = C.register_customer();
        
        if(status == 1){
        %>
        <header>
            <h1>Register Successfully</h1>
        </header>
        <%
            }else{
        %>
        <header>
            <h1>Register Failed</h1>
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
