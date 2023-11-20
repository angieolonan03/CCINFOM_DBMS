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
    </head>
    <body>
        <jsp:useBean id="E" class="data_management.employee" scope="session" />
        <%
        try{
        String v_vendor_id = request.getParameter("vendor_id");
        E.vendorId = Integer.parseInt(v_vendor_id);
        
        Map<Integer, Float> monthlySalary = E.monthly_salary();
        
        if (monthlySalary != null && !monthlySalary.isEmpty()) {
        %>
            <h1>Monthly Salary Report</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
            
            <% for (Map.Entry<Integer, Float> entry : monthlySalary.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue() %></td>
                </tr>
            <% } %>
                
            </tbody>
        </table>
            
        <%
            }else{
        %>
            <h1>No Employee in this caterer</h1>
        <%
            }
        }catch(Exception e){
        %>
            <h1>Search Failed</h1>
        <%
            }
        %>
        <form action="index.html">
            <input type="submit" value="return to main menu">
        </form>
    </body>
</html>
