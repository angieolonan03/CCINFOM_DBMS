<%-- 
    Document   : update_customer
    Created on : 11 21, 23, 10:11:28 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Update Customer</h1>
        </header>
        <form action="update_customerprocessing.jsp">
            <jsp:useBean id="C" class="data_management.customer" scope="session" />
            Customer ID:
            <select name="customer_id">
                <%
                    List<Integer> customerIds = C.all_customers();
                    for (int customerId : customerIds) {
                %>
                    <option value="<%=customerId%>"><%=customerId%></option>
                <%  }
                %>
            </select><br>
            First Name:<input type ="text" id="first_name" name ="first_name"><br>
            Last Name:<input type ="text" id="last_name" name ="last_name"><br>
            Mobile No:<input type ="number" id="mobile_no" name ="mobile_no"><br>
            Address:<input type ="text" id="address" name ="address"><br>
            Birthday:<input type ="date" id="birthday" name ="birthday">
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
