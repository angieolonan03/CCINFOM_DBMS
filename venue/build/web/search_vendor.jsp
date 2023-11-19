<%-- 
    Document   : vendorsearch
    Created on : 11 15, 23, 8:33:19 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Search Menu</title>
    
    <body>
        <h1>Vendor Search</h1>
        <form action="search_vendor_process.jsp">
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            Vendor ID:<input type="text" id="s_vid" name="s_vid"><br>
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
