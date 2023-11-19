<%-- 
    Document   : vendorupdate
    Created on : 11 16, 23, 12:47:35 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Update</title>
    </head>
    <body>
        <h1>Vendor Update</h1>
        
        <form action="update_vendor_inputval.jsp">
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            Input Vendor ID to update:<input type="text" id="vid_change" name="vid_change"><br><br>
            <button type="submit">Submit</button>
      
        
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
        </table>
        
            <button type="submit" formaction="index.html">Back to Vendor Menu</button>
        </form> 
        
    </body>
</html>
