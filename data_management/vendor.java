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
public class vendor {

    public int vendor_id;
    public String vendor_name;
    public String v_desc;
    public String v_type;
    public double cost_p_set;
    
    public String chosen_vid;
    public String id_chose;
    public String chosen_column;
    public String new_col_val;
    
    public String delete_id;
    
    
    public ArrayList<Integer> vendorid_list = new ArrayList<> ();
    public ArrayList<String> v_name_list = new ArrayList<> ();
    public ArrayList<String> v_desc_list = new ArrayList<> ();
    public ArrayList<String> v_type_list = new ArrayList<> ();
    public ArrayList<Double> cost_p_set_list = new ArrayList<> ();
    
    
    public vendor(){}
    
    public int delete_vendor() {
        
        try{
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection successful!");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM vendor    WHERE  vendor_id=?;");
            pstmt.setString(1, delete_id);
            pstmt.executeUpdate();
            
            delete_id = null;
            
            pstmt.close();
            conn.close();
            
            return 1;
            
        } catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
    public int update_vendor() {
        
        try{
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection successful!");
            
            PreparedStatement pstmt;

            
            switch(chosen_column) {
                case "vendor_name": 
                    pstmt = conn.prepareStatement("UPDATE vendor  SET vendor_name = ?  WHERE vendor_id = ?;");
                    pstmt.setString(1, new_col_val);
                    pstmt.setString(2, id_chose);
                    pstmt.executeUpdate();
                    pstmt.close();
                    
                    break;
                    
                case "vend_desc":
                    pstmt = conn.prepareStatement("UPDATE vendor  SET description = ? WHERE vendor_id = ?;");
                    pstmt.setString(1, new_col_val);
                    pstmt.setString(2, id_chose);
                    pstmt.executeUpdate();
                    pstmt.close();
                    
                    break;
                    
                case "vend_type":
                    pstmt = conn.prepareStatement("UPDATE vendor  SET vendor_type = ?  WHERE vendor_id = ?;");
                    pstmt.setString(1, new_col_val);
                    pstmt.setString(2, id_chose);
                    pstmt.executeUpdate();
                    pstmt.close();
                    
                    break;
                    
                case "cost_pset":
                    pstmt = conn.prepareStatement("UPDATE vendor  SET cost_per_set = ?  WHERE vendor_id = ?;");
                    pstmt.setString(1, new_col_val);
                    pstmt.setString(2, id_chose);
                    pstmt.executeUpdate();
                    pstmt.close();
                    
                    break;
                    
            }
            
            id_chose = null;
            
            conn.close();
            
            
            return 1;
            
        } catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int search_vendor() {
        
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection successful!");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT vendor_id, vendor_name, description, vendor_type, cost_per_set  FROM  vendor  WHERE vendor_id = ?;");
            pstmt.setString(1, chosen_vid);
            ResultSet result = pstmt.executeQuery();
            
            //initialize values
            chosen_vid = null;
            vendor_id=0;
            vendor_name=null;
            v_desc=null;
            v_type=null;
            cost_p_set=0;
            
            while(result.next()){
                vendor_id = result.getInt("vendor_id");
                vendor_name = result.getString("vendor_name");
                v_desc = result.getString("description");
                v_type = result.getString("vendor_type");
                String temp_costpset = result.getString("cost_per_set");
                cost_p_set = Double.parseDouble(temp_costpset);
                
            }
            
            pstmt.close();
            conn.close();
            
            if(vendor_name==null && vendor_id==0 && v_desc==null && v_type==null && cost_p_set==0){
                return 0;
            } else{
                return 1;
            }
            
        } catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }

    //TRANSFERS THE DATA FROM THE DATABASE TO AN ARRAYLIST:
    public int vendor_transfer() {
        
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection successful!");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT vendor_id, vendor_name, description, vendor_type, cost_per_set  FROM  vendor;");
            ResultSet result = pstmt.executeQuery();
            //clear up the array list
            vendorid_list.clear();
            v_name_list.clear();
            v_desc_list.clear();
            v_type_list.clear();
            cost_p_set_list.clear();
            
            while(result.next()){
                vendor_id = result.getInt("vendor_id");
                vendor_name = result.getString("vendor_name");
                v_desc = result.getString("description");
                v_type = result.getString("vendor_type");
                String temp_costpset = result.getString("cost_per_set");
                cost_p_set = Double.parseDouble(temp_costpset);
                
                vendorid_list.add(vendor_id);
                v_name_list.add(vendor_name);
                v_desc_list.add(v_desc);
                v_type_list.add(v_type);
                cost_p_set_list.add(cost_p_set);
            }
            
            pstmt.close();
            conn.close();
            
            return 1;
            
        } catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        
    }

    public int register_vendor(){
        
        try{
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection successful!");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT COALESCE(MAX(vendor_id), 0) + 1 AS new_ID  FROM vendor;");
            ResultSet result = pstmt.executeQuery();
            while(result.next()){
                vendor_id = result.getInt("new_ID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO vendor (vendor_id, vendor_name, description, vendor_type, cost_per_set) VALUE (?, ?, ?, ?, ?);");
            pstmt.setInt(1, vendor_id);
            pstmt.setString(2, vendor_name);
            pstmt.setString(3, v_desc);
            pstmt.setString(4, v_type);
            pstmt.setDouble(5, cost_p_set);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            return 1;
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
    public List<Integer> all_vendor(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");

            PreparedStatement stmt = conn.prepareStatement("SELECT vendor_id FROM vendor;");

            ResultSet rs = stmt.executeQuery();
            List<Integer> vendorIds = new ArrayList<>();

            while (rs.next()) {
                int vendorId = rs.getInt("vendor_id");
                vendorIds.add(vendorId);
            }

            rs.close();
            stmt.close();
            conn.close();

            return vendorIds;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    //FOR TESTING PURPOSES:
    public static void main(String args[]){
        
        vendor v = new vendor();
        
    }
    
}