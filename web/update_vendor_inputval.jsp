<%-- 
    Document   : vendorupdate_process
    Created on : 11 16, 23, 3:57:04 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Select & Input New Value</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <form action="update_vendor_process.jsp">
            
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            <%
                String id_selected = request.getParameter("vid_change");
                V.chosen_vid = id_selected;

                int status = V.search_vendor();
                V.id_chose = id_selected;
                if(status==1){ 
            %>
                <header>
                    <h1>Vendor Input Values</h1>
                </header>
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
                
                <label for="column">Column:</label>
                <select name="column" id= "column">
                <option value="vendor_name">Vendor Name</option>
                <option value="vend_desc">Description</option>                
                <option value="vend_type">Vendor Type</option>                
                <%--<option value="prod_type">Product Type</option>--%>                
                <option value="cost_pset">Cost per Set</option>               
                </select>
                
                Input new value:<input type="text" id="new_val" name="new_val"><br>
                <button type="submit">Submit</button>
                
            <%
                } else{
            %>    
                <header>
                    <h1>Vendor ID not found!</h1>
                </header>
            <%
                }
            %>
                
            <button type="submit" formaction="update_vendor.jsp">Back to Vendor Update Menu</button>

        </form>
        
    </body>
</html>
