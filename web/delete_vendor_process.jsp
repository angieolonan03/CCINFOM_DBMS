<%-- 
    Document   : vendordelete_process
    Created on : 11 17, 23, 3:26:20 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Delete Status</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <form>
            
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
            
            <%
                
                int stat = V.delete_vendor();
                if(stat==1){ 
            %>
            <header>    
            <h2>Deletion Successful!</h2>
            </header>
            <%
                } else{
            %>
            <header>    
            <h2>Deletion Failed!</h2>
            </header>
            <%
                }
            %>
            
            <button type="submit" formaction="delete_vendor.jsp">Back to Vendor Delete Menu</button>

            
        </form>
        
    </body>
</html>
