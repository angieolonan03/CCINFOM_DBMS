<%-- 
    Document   : vendorreg
    Created on : 11 13, 23, 9:31:52 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, data_management.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor & Supplier Registration</title>
    </head>
    <body>
      <form>
          
        <jsp:useBean id="V" class="data_management.vendor" scope="session" />
        
        
        <%  //Receive the values from register_vendor.html
           int status;
           try{
                
            String v_vendor_name = request.getParameter("vname");
            V.vendor_name = v_vendor_name;
            String v_vendor_desc = request.getParameter("desc");
            V.v_desc = v_vendor_desc;
            String v_vendor_type = request.getParameter("vtype");
            V.v_type = v_vendor_type;
            //String v_prod_type = request.getParameter("ptype");
            //V.prod_type = v_prod_type;
            String v_costpset = request.getParameter("costpset");
            double v_d_costpset = Double.parseDouble(v_costpset);
            V.cost_p_set = v_d_costpset;
            
            status = V.register_vendor();
            
            } catch(Exception e){
               System.out.println(e.getMessage());
               status = 0;
            }
            
            
            if(status==1){
        %>
                <h1>Vendor successfully registered!</h1>
        <%
            } else{
        %>
                <h1>Failed to register vendor.</h1>
        <% } 
        %>
        <button type="submit" formaction="register_vendor.html">Register another vendor</button>
        <button type="submit" formaction="index.html">Back to Vendor Menu</button>
        
       </form>
    </body>
</html>
