<%-- 
    Document   : vendordelete_confirm
    Created on : 11 17, 23, 3:09:23 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Delete Confirm</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <form action="delete_vendor_process.jsp">
            
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            
            <%
                String delete_id_search = request.getParameter("delete_id");
                V.chosen_vid = delete_id_search;

                int status = V.search_vendor();
                V.delete_id = delete_id_search;
                
                if(status==1){ 
            %>
            <header>    
            <h1>Confirm deletion?</h1>
            <header>
                <table border=2 width="50%"> 
                    <tr>
                        <th>Vendor ID</th>
                        <th>Vendor Name</th>
                        <th>Description</th>
                        <th>Vendor Type</th>
                        <%--<th>Product Type</th>--%>
                        <th>Cost per Set</th>
                    </tr>
                    <tr>
                        <td><%=V.vendor_id%></td>
                        <td><%=V.vendor_name%></td>
                        <td><%=V.v_desc%></td>
                        <td><%=V.v_type%></td>
                        <%--<td><%=V.prod_type%></td>--%>
                        <td><%=V.cost_p_set%></td>
                    </tr>
                </table><br>
            
                <button type="submit">Confirm</button>
                <button type="submit" formaction="delete_vendor.jsp">Cancel</button>
                
            <%
                } else{
            %>
                    <header>        
                    <h1>No results found!</h1>
                    </header>
                    <button type="submit" formaction="delete_vendor.jsp">Back to Delete Menu</button>

            <%
                }
            %>
        </form>
        
    </body>
</html>
