<%-- 
    Document   : vendordelete
    Created on : 11 17, 23, 3:04:21 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Delete</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
        <h1>Vendor Delete Menu</h1>
        </header>
        <form action="delete_vendor_confirm.jsp">
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            Input Vendor ID to delete:<input type="text" id="delete_id" name="delete_id"><br>
            <button type="submit">Submit</button><br><br>
        
        
        <table border=2 width="50%"> 
                <tr>
                    <th>Vendor ID</th>
                    <th>Vendor Name</th>
                    <th>Description</th>
                    <th>Vendor Type</th>
                    <%--<th>Product Type</th>--%>
                    <th>Cost per Set</th>
                </tr>
                <%
                    int status = V.vendor_transfer();
                    
                    if(status==1){
                        for(int i=0; i<V.vendorid_list.size(); i++){
                %>
                    <tr>
                        <td><%=V.vendorid_list.get(i)%></td>
                        <td><%=V.v_name_list.get(i)%></td>
                        <td><%=V.v_desc_list.get(i)%></td>
                        <td><%=V.v_type_list.get(i)%></td>
                        <%--<td><%=V.prodtype_list.get(i)%></td>--%>
                        <td><%=V.cost_p_set_list.get(i)%></td>
                    </tr>
                
                <%
                        }
                    }
                %>
        </table><br><br>
        
            <button type="submit" formaction="index.html">Back to Vendor Menu</button>
        </form> 
    </body>
</html>
