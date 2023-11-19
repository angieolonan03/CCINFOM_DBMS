<%-- 
    Document   : vendorupdate_process
    Created on : 11 17, 23, 12:26:14 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Update  Process</title>
    </head>
    <body>
        <form action="update_vendor.jsp">
        
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
        
            <%
                String column_selected = request.getParameter("column");
                V.chosen_column = column_selected;
                
                String new_value = request.getParameter("new_val");
                V.new_col_val = new_value;
                

                int status = V.update_vendor();
                if(status==1){ 
            %>
                <h1>Update Successful!</h1>
            <%
                } else{
            %>
                <h1>Update Failed!</h1>
            <%
                }
            %>
            <button type="submit">Back to Vendor Update Menu</button>
        </form>
        
    </body>
</html>
