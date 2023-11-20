/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data_management;

import java.util.*;
import java.sql.*;
/**
 *
 * @author ccslearner
 */
public class customer {
    //variable
    public int customer_id;
    public String first_name;
    public String last_name;
    public int mobile_no;
    public String address;
    public String birthday;
    
    public ArrayList<Integer> customer_id_list = new ArrayList<>();
    public ArrayList<String> first_name_list = new ArrayList<>();
    public ArrayList<String> last_name_list = new ArrayList<>();
    public ArrayList<Integer> mobile_no_list = new ArrayList<>();
    public ArrayList<String> address_list = new ArrayList<>();
    public ArrayList<String> birthday_list = new ArrayList<>();
    
    public customer(){}
    
    public int register_customer(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            // get new ID
            PreparedStatement stmt = conn.prepareStatement("SELECT COALESCE(MAX(customer_id), 0) + 1 AS ID FROM customer;");
            ResultSet rslt = stmt.executeQuery();
            while(rslt.next()){
                customer_id = rslt.getInt("ID");
            }
            //insert values
            stmt = conn.prepareStatement("INSERT INTO customer (customer_id, first_name, last_name, mobile_no, address, birthday)"
                    + " VALUE(?,?,?,?,?,?)");
            stmt.setInt(1,customer_id);
            stmt.setString(2,first_name);
            stmt.setString(3,last_name);
            stmt.setInt(4, mobile_no);
            stmt.setString(5, address);
            stmt.setString(6, birthday);
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            System.out.println("Hi");
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public int update_customer(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("UPDATE customer "
                    + "SET first_name = ?, last_name = ?, mobile_no = ?, address = ?, birthday = ? "
                    + "WHERE customer_id=?");
            stmt.setString(1, first_name);
            stmt.setString(2, last_name);
            stmt.setInt(3, mobile_no);
            stmt.setString(4, address);
            stmt.setString(5, birthday);
            stmt.setInt(6, customer_id);
            int x = stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            System.out.println("Hi");
            if(x == 0){
                return 0;
            }
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public int delete_customer(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM customer WHERE customer_id = ?");
            stmt.setInt(1, customer_id);
            
            int x = stmt.executeUpdate();   
            stmt.close();
            conn.close();
            if(x == 0){
                return 0;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public int search_customer(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer "
                                        + "WHERE first_name = ? AND last_name = ?"
                                        + "ORDER BY customer_id;");
            stmt.setString(1, first_name);
            stmt.setString(2, last_name);
            
            ResultSet rs = stmt.executeQuery();   
            
            customer_id_list.clear();
            first_name_list.clear();
            last_name_list.clear();
            mobile_no_list.clear();
            address_list.clear();
            birthday_list.clear();
            
            while(rs.next()) {
                customer_id = rs.getInt("customer_id");
                first_name = rs.getString("first_name");
                last_name = rs.getString("last_name");
                mobile_no = rs.getInt("mobile_no");
                address = rs.getString("address");
                birthday = rs.getString("birthday");
                
                customer_id_list.add(customer_id);
                first_name_list.add(first_name);
                last_name_list.add(last_name);
                mobile_no_list.add(mobile_no);
                address_list.add(address);
                birthday_list.add(birthday);
            }
            rs.close();
            stmt.close();
            conn.close();
            
            if(customer_id_list.isEmpty()){
                return 0;
            }
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public List<Integer> all_customers(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer");
            
            ResultSet rs = stmt.executeQuery();   
            List<Integer> customer_list = new ArrayList<>();
            // 7. Get the results
            while(rs.next()) {
                int customerId = rs.getInt("customer_id");
                customer_list.add(customerId);
                
            }
                rs.close();
                stmt.close();
                conn.close();
                return customer_list;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static void main(String[] args){
        
    }
}
