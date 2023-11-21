<%-- 
    Document   : view_vendortransaction
    Created on : 11 20, 23, 5:15:18 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Vendor Transaction</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form action="index.html">
        <jsp:useBean id="RVD" class="data_management.reservation_vendor" scope="session"/>
        
        <header>
            <h1>Vendor Transactions</h1>
        </header>
        
            <table border=2 width="50%"> 
                <tr>
                    <th>Transaction ID</th>
                    <th>Event Date</th>
                    <th>Sets Ordered</th>
                    <th>Transaction Cost</th>
                    <th>Transaction Status</th>
                    <th>Vendor ID</th>
                    <th>Customer ID</th>
                </tr>
        
        <%
            int status = RVD.get_vendorres_data();
            if(status==1){

                for(int i=0; i<RVD.trans_id_list.size(); i++){
        %>
                    
                    <tr>
                        <td><%=RVD.trans_id_list.get(i)%></td>
                        <td><%=RVD.event_date_list.get(i)%></td>
                        <td><%=RVD.sets_order_list.get(i)%></td>
                        <td><%=RVD.trans_cost_list.get(i)%></td>
                        <td><%=RVD.trans_status_list.get(i)%></td>
                        <td><%=RVD.vendor_id_list.get(i)%></td>
                        <td><%=RVD.customer_id_list.get(i)%></td>
                    </tr>
        <%  
                }
            }
        %>
        
            </table>
        
        <button type="submit" formaction="index.html">Back to Menu</button>
        
        </form>
    </body>
</html>