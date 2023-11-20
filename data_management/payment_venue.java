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
public class payment_venue {
    public int payment_id;
    public float payment;
    public float pending_payment;
    public int venue_transaction_id;
    
    public payment_venue(){}
    
    public int pay_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            // get new ID
            PreparedStatement stmt = conn.prepareStatement("SELECT COALESCE(MAX(payment_id), 0) + 1 AS ID FROM venue_payment;");
            ResultSet rslt = stmt.executeQuery();
            while(rslt.next()){
                payment_id = rslt.getInt("ID");
            }
            
            //check if a down payment was made else get the true price
            stmt = conn.prepareStatement("SELECT COALESCE(MAX(payment_id), 0) AS payment_id "
                                        + "FROM venue_payment "
                                        + "WHERE venue_transaction_id = ?;");
            stmt.setInt(1,venue_transaction_id);
            rslt = stmt.executeQuery();
            int temp = 0;
            while(rslt.next()){
                temp = rslt.getInt("payment_id");
            }
            
            if(temp == 0){
                stmt = conn.prepareStatement("SELECT transaction_cost FROM venue_transaction WHERE transaction_id = ?;");
                stmt.setInt(1,venue_transaction_id);
                rslt = stmt.executeQuery();
                while(rslt.next()){
                    pending_payment = rslt.getFloat("transaction_cost");
                }
            }else{
                stmt = conn.prepareStatement("SELECT MIN(pending_payment) AS pending_payment FROM venue_payment WHERE venue_transaction_id = ?;");
                stmt.setInt(1,venue_transaction_id);
                rslt = stmt.executeQuery();
                while(rslt.next()){
                    pending_payment = rslt.getFloat("pending_payment");
                }
            }
            
            pending_payment -= payment;
            
            if(pending_payment == 0){
                //fully paid
                stmt = conn.prepareStatement("UPDATE venue_transaction SET transaction_status = 'completed' WHERE transaction_id = ?;");
                stmt.setInt(1,venue_transaction_id);
                stmt.executeUpdate();
            }else if(pending_payment < 0){
                //overpayment
                System.out.println("Hi");
                return 0;
            }
            
            //insert values
            stmt = conn.prepareStatement("INSERT INTO venue_payment (payment_id, payment, pending_payment, venue_transaction_id)"
                    + " VALUES (?, ?, ?, ?)");

            stmt.setInt(1, payment_id);
            stmt.setFloat(2, payment);
            stmt.setFloat(3, pending_payment);
            stmt.setInt(4, venue_transaction_id);

            stmt.executeUpdate();
            stmt.close();
            conn.close();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public static void main(String[] args){
        payment_venue pv = new payment_venue();
        pv.payment = 1;
        pv.venue_transaction_id = 1;
        pv.pay_venue();
    }
}
