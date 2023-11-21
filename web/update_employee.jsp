<%-- 
    Document   : update_employee
    Created on : 11 21, 23, 10:20:48 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Employee</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Update Employee</h1>
        </header>
        <form action="update_employeeprocessing.jsp" method="post">
        Employee ID: 
            <jsp:useBean id="E" class="data_management.employee" scope="session" />
            <select name="employee_id">
                <%
                    List<Integer> employeeIds = E.all_employees();
                    for (int employeeId : employeeIds) {
                %>
                    <option value="<%=employeeId%>"><%=employeeId%></option>
                <%
                    }
                %>
            </select><br>
            
        First Name: <input type="text" id="first_name" name="first_name" ><br><br> 
        Last Name: <input type="text" id="last_name" name="last_name" ><br><br>
        <label for="Gender">Gender: </label>
        <select id="gender" name="gender" >
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br><br> 
        Birthday: <input type="date" id="birthday" name="birthday" ><br><br>
        Age: <input type="number" id="age" name="age" ><br><br>
        Position: <input type="text" id="position" name="position" ><br><br> 
        Salary: <input type="number" id="salary" name="salary" step="0.01" ><br><br>
        Mobile Number: <input type="text" id="mobile_no" name="mobile_no" ><br><br> 
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

