package data_management;

import java.util.*;
import java.sql.*;

public class venue {
    
    //variable
    public int venue_id;
    public String venue_name;
    public String venue_size;
    public int venue_capacity;
    public float cost;
    public String address;
    public String description;
    
    public ArrayList<Integer> venue_idList = new ArrayList<> ();
    public ArrayList<String> venue_nameList = new ArrayList<> ();
    public ArrayList<String> venue_sizeListList = new ArrayList<> ();
    public ArrayList<Integer> venue_capacityList = new ArrayList<> ();
    public ArrayList<Float> costList = new ArrayList<> ();
    public ArrayList<String> addressList = new ArrayList<> ();
    public ArrayList<String> descriptionList = new ArrayList<> ();
    
    public venue() {}
    
    public int register_venue() {
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            // get new ID
            PreparedStatement stmt = conn.prepareStatement("SELECT COALESCE(MAX(venue_id), 0) + 1 AS ID FROM venue;");
            ResultSet rslt = stmt.executeQuery();
            while(rslt.next()){
                venue_id = rslt.getInt("ID");
            }
            //insert values
            stmt = conn.prepareStatement("INSERT INTO venue (venue_id, venue_name, venue_size, venue_capacity, cost, address, description)"
                    + " VALUE(?,?,?,?,?,?,?)");
            stmt.setInt(1,venue_id);
            stmt.setString(2,venue_name);
            stmt.setString(3,venue_size);
            stmt.setInt(4, venue_capacity);
            stmt.setFloat(5, cost);
            stmt.setString(6, address);
            stmt.setString(7, description);
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
    
    public int update_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("UPDATE venue " +
                                     "SET venue_name = ?, venue_size = ?, venue_capacity = ?, cost = ?, address = ?, description = ? " +
                                     "WHERE venue_id = ?");
            
            stmt.setString(1, venue_name);
            stmt.setString(2, venue_size);
            stmt.setInt(3, venue_capacity);
            stmt.setFloat(4, cost);
            stmt.setString(5, address);
            stmt.setString(6, description);
            stmt.setInt(7, venue_id);
            
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
    
    public int delete_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM venue WHERE venue_id = ?");
            stmt.setInt(1, venue_id);
            
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
    
    public int search_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM venue WHERE venue_id = ?");
            stmt.setInt(1, venue_id);
            
            ResultSet rs = stmt.executeQuery();   
            
            // 7. Get the results
            if(rs.next()) {
                venue_name = rs.getString("venue_name");
                venue_size = rs.getString("venue_size");
                venue_capacity = rs.getInt("venue_capacity");
                cost = rs.getFloat("cost");
                address = rs.getString("address");
                description = rs.getString("description");
                
                rs.close();
                stmt.close();
                conn.close();
                return 1;
            } else {
                rs.close();
                stmt.close();
                conn.close();
                return 0;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public static void main(String[] args){
        
    }
}
