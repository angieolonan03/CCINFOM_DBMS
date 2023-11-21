<%-- 
    Document   : delete_employee
    Created on : 11 20, 23, 5:57:46 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, data_management.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Employee</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="E" class="data_management.employee" scope="session"/>
        <% 
            // Receive the values from the form
            String v_employee_id = request.getParameter("employee_id");
            
            // Check if employee ID is provided
            if (v_employee_id != null && !v_employee_id.isEmpty()) {
                try {
                    // Instantiate an object of the employee class
                    data_management.employee employeeObj = new data_management.employee();

                    // Set employee ID in the JavaBean
                    employeeObj.employeeId = Integer.parseInt(v_employee_id);

                    // Create a connection
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");

                    // Check if the employee exists
                    if (employeeObj.employeeExists(conn)) {
                        // Call the deleteEmployee method
                        boolean res = employeeObj.deleteEmployee();

                        // Close the connection
                        conn.close();
        %>
                        <h1><%= res ? "Deleting Employee Successful!" : "Deleting Employee Failed." %></h1>
        <%
                    } else {
        %>
                        <header>                
                        <h1>Employee ID does not exist.</h1>
                        </header>
        <%
                    }
                } catch (Exception e) {
        %>
                    <header>            
                    <h1>Missing Fields</h1>
                    </header>
        <%
                }
            } else {
        %> 
                <header>
                <h1>Missing Fields</h1>
                </header>
        <%
            }
        %>  
        <form action="employee.html">
                <input type="submit" value="Return to Employee Information Menu">
        </form>
    </body>
</html>
