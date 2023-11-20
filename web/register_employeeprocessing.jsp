<%-- 
    Document   : register_employeeprocessing
    Created on : 11 20, 23, 5:25:30 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, data_management.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Processing</title>
    </head>
    <body>
        <jsp:useBean id="E" class="data_management.employee" scope="session" />

        <% 
            // Receive the values from addemployee.html
            String v_first_name = request.getParameter("first_name");
            String v_last_name = request.getParameter("last_name");
            String v_gender = request.getParameter("gender");
            String v_birthday = request.getParameter("birthday");
            String v_age = request.getParameter("age");
            String v_position = request.getParameter("position");
            String v_salary = request.getParameter("salary");
            String v_mobile_no = request.getParameter("mobile_no");
            String v_vendor_id = request.getParameter("vendor_id");


            try {

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = dateFormat.parse(v_birthday);

                    // Instantiate an object of the employee class
                    data_management.employee employeeObj = new data_management.employee();

                    // Set values in the JavaBean
                    employeeObj.firstName = v_first_name;
                    employeeObj.lastName = v_last_name;
                    employeeObj.gender = v_gender;
                    employeeObj.birthday = birthday;
                    employeeObj.age = Integer.parseInt(v_age);
                    employeeObj.position = v_position;
                    employeeObj.salary = Double.parseDouble(v_salary);
                    employeeObj.mobileNo = Integer.parseInt(v_mobile_no);
                    employeeObj.vendorId = Integer.parseInt(v_vendor_id);


                    // Call the addEmployee method
                    boolean res = employeeObj.addEmployee();
                    if(res){
            %>
                    <h1>Register Successfully</h1>
            <%
                    }else{
            %>
                    <h1>Register Failed</h1>
            <%
                    }
                                
                }catch(Exception e){
            %>
                <h1>Missing Fields</h1>
            <%
                }
            %>
            <form action="employee.html">
                <input type="submit" value="Return to Employee Information Menu">
            </form>
    </body>
</html>