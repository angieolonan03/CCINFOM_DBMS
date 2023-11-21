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
public class reservation_vendor {
    
    public int transaction_id;
    public String event_date;
    public int sets_ordered;
    public float transaction_cost;
    public String transaction_status;
    public int vendor_id;
    public int customer_id;
    
    public int month;
    public int year;
    
    public ArrayList<Integer> vendor_idlist = new ArrayList<>();
    public ArrayList<String> vendor_namelist = new ArrayList<>();
    public ArrayList<Float> cost_list = new ArrayList<>();
    
    public ArrayList<Integer> trans_id_list = new ArrayList<>();
    public ArrayList<String> event_date_list = new ArrayList<>();
    public ArrayList<Integer> sets_order_list = new ArrayList<>();
    public ArrayList<Float> trans_cost_list = new ArrayList<>();
    public ArrayList<String> trans_status_list = new ArrayList<>();
    public ArrayList<Integer> vendor_id_list = new ArrayList<>();
    public ArrayList<Integer> customer_id_list = new ArrayList<>();
    
    
    public reservation_vendor(){}
    
    public int reserve_vendor(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            // get new ID
            PreparedStatement stmt = conn.prepareStatement("SELECT COALESCE(MAX(transaction_id), 0) + 1 AS ID FROM vendor_transaction;");
            ResultSet rslt = stmt.executeQuery();
            while(rslt.next()){
                transaction_id = rslt.getInt("ID");
            }
            
            stmt = conn.prepareStatement("SELECT cost_per_set FROM vendor WHERE vendor_id = ?;");
            stmt.setInt(1,vendor_id);
            
            rslt = stmt.executeQuery();
            while(rslt.next()){
                transaction_cost = (float) sets_ordered * rslt.getFloat("cost_per_set");
            }
            
            transaction_status = "incomplete";
            //insert values
            stmt = conn.prepareStatement("INSERT INTO vendor_transaction (transaction_id, event_date, sets_ordered, transaction_cost, transaction_status, vendor_id, customer_id)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)");

            stmt.setInt(1, transaction_id);
            stmt.setString(2, event_date);
            stmt.setInt(3, sets_ordered);
            stmt.setFloat(4, transaction_cost);
            stmt.setString(5, transaction_status);
            stmt.setInt(6, vendor_id);
            stmt.setInt(7, customer_id);
            
            System.out.println("hi");
            stmt.executeUpdate();
            stmt.close();
            conn.close();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public List<Integer> unpaid_vendor(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT transaction_id "
                                                + "FROM vendor_transaction "
                                                + "WHERE transaction_status = 'incomplete';");
            
            ResultSet rs = stmt.executeQuery();   
            List<Integer> transaction_list = new ArrayList<>();
            // 7. Get the results
            while(rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                transaction_list.add(transactionId);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            return transaction_list;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public int get_vendorres_data() {
        try{
            
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT transaction_id, event_date, sets_ordered, transaction_cost, transaction_status, vendor_id, customer_id FROM vendor_transaction;");
            ResultSet rslt = stmt.executeQuery();
            
            //clear the arraylist 
            trans_id_list.clear();
            event_date_list.clear();
            sets_order_list.clear();
            trans_cost_list.clear();
            trans_status_list.clear();
            vendor_id_list.clear();
            customer_id_list.clear();
            
            while(rslt.next()){
                transaction_id = rslt.getInt("transaction_id");
                event_date = rslt.getString("event_date");
                sets_ordered = rslt.getInt("sets_ordered");
                transaction_cost = rslt.getFloat("transaction_cost");
                transaction_status = rslt.getString("transaction_status");
                vendor_id = rslt.getInt("vendor_id");
                customer_id = rslt.getInt("customer_id");
                
                trans_id_list.add(transaction_id);
                event_date_list.add(event_date);
                sets_order_list.add(sets_ordered);
                trans_cost_list.add(transaction_cost);
                trans_status_list.add(transaction_status);
                vendor_id_list.add(vendor_id);
                customer_id_list.add(customer_id);
                
            }
            
            stmt.close();
            conn.close();
            
            return 1;
            
        } catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int month_report(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT vendor_id, SUM(transaction_cost) AS total_sales " +
                                        "FROM vendor_transaction " +
                                        "WHERE transaction_status = 'completed' AND MONTH(event_date) = ? AND YEAR(event_date) = ? " +
                                        "GROUP BY vendor_id " +
                                        "ORDER BY vendor_id;");

            stmt.setInt(1, month);
            stmt.setInt(2, year);

            ResultSet rs = stmt.executeQuery();
            
            vendor_idlist.clear();
            vendor_namelist.clear();
            cost_list.clear();

            while (rs.next()) {
                int vendorId = rs.getInt("vendor_id");
                float totalSales = rs.getFloat("total_sales");
                
                PreparedStatement tempStmt = conn.prepareStatement("SELECT vendor_name " +
                                        "FROM vendor " +
                                        "WHERE vendor_id = ?;");
                tempStmt.setInt(1, vendorId);
                
                ResultSet temp = tempStmt.executeQuery();
                
                if (temp.next()) {
                    String name = temp.getString("vendor_name");

                    vendor_idlist.add(vendorId);
                    vendor_namelist.add(name);
                    cost_list.add(totalSales);
                }
                temp.close();
                tempStmt.close();
            }
            
            
            rs.close();
            stmt.close();
            conn.close();
            
            if(vendor_idlist.isEmpty()){
                return 0;
            }
            
            return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String[] args){
        reservation_vendor a = new reservation_vendor();
        a.month = 11;
        a.year = 2023;
        System.out.print(a.month_report());
    }
    
}
