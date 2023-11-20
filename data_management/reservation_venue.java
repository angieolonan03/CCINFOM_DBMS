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
public class reservation_venue {
    public int transaction_id;
    public String reservation_date;
    public float transaction_cost;
    public String transaction_status;
    public int venue_id;
    public int customer_id;
    
    public reservation_venue() {}
    
    public int book_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            //edit later for message that says venue booked
            if(isBooked(reservation_date, venue_id)){
                return 0;
            }
            // get new ID
            PreparedStatement stmt = conn.prepareStatement("SELECT COALESCE(MAX(transaction_id), 0) + 1 AS ID FROM venue_transaction;");
            ResultSet rslt = stmt.executeQuery();
            while(rslt.next()){
                transaction_id = rslt.getInt("ID");
            }
            
            stmt = conn.prepareStatement("SELECT cost FROM venue WHERE venue_id = ?;");
            stmt.setInt(1,venue_id);
            
            rslt = stmt.executeQuery();
            while(rslt.next()){
                transaction_cost = rslt.getFloat("cost");
            }
            
            transaction_status = "incomplete";
            //insert values
            stmt = conn.prepareStatement("INSERT INTO venue_transaction (transaction_id, reservation_date, transaction_cost, transaction_status, venue_id, customer_id)"
                    + " VALUES (?, ?, ?, ?, ?, ?)");
            
            stmt.setInt(1, transaction_id);
            stmt.setString(2, reservation_date);
            stmt.setFloat(3, transaction_cost);
            stmt.setString(4, transaction_status);
            stmt.setInt(5, venue_id);
            stmt.setInt(6, customer_id);

            stmt.executeUpdate();
            stmt.close();
            conn.close();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public boolean isBooked(String reservation_date, int venue_id){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM venue_transaction WHERE reservation_date = ? AND venue_id = ?");
            stmt.setString(1, reservation_date);
            stmt.setInt(2, venue_id);
            ResultSet rslt = stmt.executeQuery();
            
            if (rslt.next()) {
                return true;
            }
            
            stmt.close();
            conn.close();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return true;
        }
        return false;
    }
    
    public List<Integer> unpaid_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT transaction_id "
                                                + "FROM venue_transaction "
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
    
    public static void main(String[] args){
        reservation_venue rv = new reservation_venue();
        System.out.println(rv.unpaid_venue());
    }
}
