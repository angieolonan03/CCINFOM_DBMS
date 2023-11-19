<%-- 
    Document   : update_customer
    Created on : 11 17, 23, 11:30:35 PM
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
        String c_first_name = request.getParameter("first_name");
        String c_last_name = request.getParameter("last_name");
        String c_mobile_no = request.getParameter("mobile_no");
        String c_address = request.getParameter("address");
        String c_birthday = request.getParameter("birthday");
        C.customer_id = Integer.parseInt(c_customer_id);
        C.first_name = c_first_name;
        C.last_name = c_last_name;
        C.mobile_no = Integer.parseInt(c_mobile_no);
        C.address = c_address;
        C.birthday = c_birthday;
        int status = C.update_customer();
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
