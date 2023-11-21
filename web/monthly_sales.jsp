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
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:useBean id="RVD" class="data_management.reservation_vendor" scope="session" />
        <%
        try{
        String v_month = request.getParameter("month");
        String v_year = request.getParameter("year");
        RVD.month = Integer.parseInt(v_month);
        RVD.year = Integer.parseInt(v_year);
        
        int status = RVD.month_report();
        
        if (status == 1) {
        %>
        <header>
            <h1>Monthly Sales Report</h1>
        </header>
        <table border="1">
            <thead>
                <tr>
                    <th>Vendor ID</th>
                    <th>Vendor Name</th>
                    <th>Total Sales</th>
                </tr>
            </thead>
            <tbody>

                <% for (int i = 0; i < RVD.vendor_idlist.size(); i++) { %>
                    <tr>
                        <td><%= RVD.vendor_idlist.get(i) %></td>
                        <td><%= RVD.vendor_namelist.get(i) %></td>
                        <td><%= RVD.cost_list.get(i) %></td>
                    </tr>
                <% } %>

            </tbody>
        </table>
            
        <%
            }else{
        %>
        <header>
            <h1>No Transactions this Month</h1>
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
