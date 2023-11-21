<%-- 
    Document   : view_venuetransaction
    Created on : 11 20, 23, 5:14:24 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Venue Transaction</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <h1>Venue Transaction</h1>
        </header>
        <form action="index.html">
        
        <jsp:useBean id="RV" class="data_management.reservation_venue" scope="session"/>
        
        <table border=2 width="50%"> 
                <tr>
                    <th>Transaction ID</th>
                    <th>Reservation Date</th>
                    <th>Transaction Cost</th>
                    <th>Transaction Status</th>
                    <th>Venue ID</th>
                    <th>Customer ID</th>
                </tr>
                
        <%
            int status = RV.get_venueres_data();
            if(status==1){

                for(int i=0; i<RV.trans_id_list.size(); i++){
        %>
                    <tr>
                        <td><%=RV.trans_id_list.get(i)%></td>
                        <td><%=RV.reserve_date_list.get(i)%></td>
                        <td><%=RV.trans_cost_list.get(i)%></td>
                        <td><%=RV.trans_status_list.get(i)%></td>
                        <td><%=RV.venue_id_list.get(i)%></td>
                        <td><%=RV.customer_id_list.get(i)%></td>
                    </tr>
        <%  
                }
            }
        %>
        </table>
        
        <button type="submit">Back to Menu</button>
        
        </form>
    </body>
</html>
