<%-- 
    Document   : vendosearch_process
    Created on : 11 14, 23, 8:08:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Search Process</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form action="search_vendor.jsp">
       
            <jsp:useBean id="V" class="data_management.vendor" scope="session"/>
        
            <%
                String v_id_search = request.getParameter("s_vid");
                V.chosen_vid = v_id_search;

                int status = V.search_vendor();
                if(status==1){ 
            %>
            <header>
                <h1>Search Successful</h1>
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
            </table>
                
            <%
                } else{
            %>
            <header>
                <h1>No Results Found</h1>
            </header>
            <%
                }
            %>
            <input type="submit" value="Back to Search Menu">
        </form>
    </body>
</html>
