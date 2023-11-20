/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data_management;

/**
 *
 * @author ccslearner
 */
import java.util.*;
import java.sql.*;

public class employee {
    public int employeeId;
    public String firstName;
    public String lastName;
    public String gender;
    public String birthday;
    public int age;
    public String position;
    public float salary;
    public int mobileNo;
    public int vendorId;
    
    public employee(){}
    
    public Map<Integer,Float> monthly_salary(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT employee_id, salary " +
                                        "FROM employee " +
                                        "WHERE vendor_id = ? " +
                                        "ORDER BY employee_id;");

            stmt.setInt(1, vendorId);
            
            ResultSet rs = stmt.executeQuery();

            Map<Integer, Float> report = new HashMap<>();

            while (rs.next()) {
                int employeeId = rs.getInt("employee_id");
                float salary = rs.getFloat("salary");

                report.put(employeeId, salary);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            return report;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static void main(String[] args){
        employee e = new employee();
        e.vendorId = 1;
        System.out.print(e.monthly_salary());
    }
}
