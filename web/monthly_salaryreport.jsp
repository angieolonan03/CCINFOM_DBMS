<%-- 
    Document   : monthly_salaryreport
    Created on : 11 20, 23, 2:48:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
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
        <jsp:useBean id="E" class="data_management.employee" scope="session" />
        <%
        try{
        String v_vendor_id = request.getParameter("vendor_id");
        E.vendorId = Integer.parseInt(v_vendor_id);
        
        int status = E.monthly_salary();
        
        if (status == 1) {
        %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody>

                <% for (int i = 0; i < E.employeeIdList.size(); i++) { %>
                    <tr>
                        <td><%= E.employeeIdList.get(i) %></td>
                        <td><%= E.employeeNameList.get(i) %></td>
                        <td><%= E.salaryList.get(i) %></td>
                    </tr>
                <% } %>

                </tbody>
            </table>
            
        <%
            }else{
        %>
        <header>
            <h1>No Employee in this caterer</h1>
        </header>
        <%
            }
        }catch(Exception e){
        %>
        <header>
            <h1>Search Failed</h1>
        </header>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
