<%-- 
    Document   : monthly_sales
    Created on : 11 20, 23, 1:25:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Report</title>
    </head>
    <body>
        <jsp:useBean id="RVD" class="data_management.reservation_vendor" scope="session" />
        <%
        try{
        String v_month = request.getParameter("month");
        String v_year = request.getParameter("year");
        RVD.month = Integer.parseInt(v_month);
        RVD.year = Integer.parseInt(v_year);
        
        Map<Integer, Float> monthlySales = RVD.month_report();
        
        if (monthlySales != null && !monthlySales.isEmpty()) {
        %>
            <h1>Monthly Sales Report</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Vendor ID</th>
                    <th>Total Sales</th>
                </tr>
            </thead>
            <tbody>
            
            <% for (Map.Entry<Integer, Float> entry : monthlySales.entrySet()) { %>
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
            <h1>No Transactions this Month</h1>
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
