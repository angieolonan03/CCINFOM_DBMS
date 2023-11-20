<%-- 
    Document   : register_employee
    Created on : 11 20, 23, 5:22:03 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Employee</title>
    </head>
    <body>
        <form action="register_employeeprocessing.jsp" method="post">
            First Name: <input type="text" id="first_name" name="first_name"><br> 
            Last Name: <input type="text" id="last_name" name="last_name"><br>
            <label for="Gender">Gender: </label>
            <select id="gender" name="gender" >
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select><br>
            Birthday: <input type="date" id="birthday" name="birthday"><br>
            Age: <input type="number" id="age" name="age" ><br>
            Position: <input type="text" id="position" name="position"><br>
            Salary: <input type="number" id="salary" name="salary" step="0.01" min="1"><br>
            Mobile Number: <input type="text" id="mobile_no" name="mobile_no"><br> 
            Vendor ID: 
            <jsp:useBean id="VE" class="data_management.vendor" scope="session"/>
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
