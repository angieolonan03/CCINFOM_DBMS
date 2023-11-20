<%-- 
    Document   : updateemployee.jsp
    Created on : 11 14, 23, 11:08:00 PM
    Author     : ccslearner
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, data_management.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Employee Information</title>
</head>

<body>
        <jsp:useBean id="E" class="data_management.employee" scope="session" />
        <%
        String errorMessage = "";
        boolean res = false;

        try {
            // Receive the values from updateinfo.html 
            String v_employee_id = request.getParameter("employee_id");
            String v_first_name = request.getParameter("first_name");
            String v_last_name = request.getParameter("last_name");
            String v_gender = request.getParameter("gender");
            String v_birthday = request.getParameter("birthday");
            String v_age = request.getParameter("age");
            String v_position = request.getParameter("position");
            String v_salary = request.getParameter("salary");
            String v_mobile_no = request.getParameter("mobile_no");
            String v_vendor_id = request.getParameter("vendor_id");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);
            Date birthday = dateFormat.parse(v_birthday);


                // Instantiate an object of the employee class
                data_management.employee employeeObj = new data_management.employee();

                // Set values in the JavaBean
                employeeObj.employeeId = Integer.parseInt(v_employee_id);
                employeeObj.firstName = v_first_name;
                employeeObj.lastName = v_last_name;
                employeeObj.gender = v_gender;
                employeeObj.birthday = birthday;
                employeeObj.age = Integer.parseInt(v_age);
                employeeObj.position = v_position;
                employeeObj.salary = Double.parseDouble(v_salary);
                employeeObj.mobileNo = Integer.parseInt(v_mobile_no);
                employeeObj.vendorId = Integer.parseInt(v_vendor_id);

                // Call the updateEmployee method
                System.out.println("Before updateEmployee");
                res = employeeObj.updateEmployee();
                System.out.println("After updateEmployee");
                if (res){
        %>
                    <h1>Updating Employee Successful!</h1>
        <%      }else{%>
                <h1>Invalid Input</h1>
        <%        }
            } catch (Exception e) {
            %>
                <h1>Invalid Input</h1>
        <%
            }
        %>

        <h1>
            <%= res ? "Updating Employee Successful!" : errorMessage %>
        </h1>
        <form action="employee.html">
                <input type="submit" value="Return to Employee Information Menu">
        </form>
</body>

</html>