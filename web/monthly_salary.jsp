<%-- 
    Document   : monthly_salary
    Created on : 11 20, 23, 2:40:48 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salary Report</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Monthly Salary Report</h1>
        </header>
        <form action="monthly_salaryreport.jsp">
            Vendor ID: 
            <jsp:useBean id="VE" class="data_management.vendor" scope="session" />
            <select name="vendor_id">
                <%
                    List<Integer> vendorIds = VE.all_vendor();
                    for (int vendorId : vendorIds) {
                %>
                    <option value="<%=vendorId%>"><%=vendorId%></option>
                <%
                    }
                %>
            </select><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
