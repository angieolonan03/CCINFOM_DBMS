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
    
    public ArrayList<Integer> venue_idlist = new ArrayList<> ();
    public ArrayList<String> venue_namelist = new ArrayList<> ();
    public ArrayList<String> venue_sizelist = new ArrayList<> ();
    public ArrayList<Integer> venue_capacitylist = new ArrayList<> ();
    public ArrayList<Float> costlist = new ArrayList<> ();
    public ArrayList<String> addresslist = new ArrayList<> ();
    public ArrayList<String> descriptionlist = new ArrayList<> ();
    
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
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM venue WHERE venue_name LIKE ?;");
            stmt.setString(1,"%" + venue_name + "%");
            
            ResultSet rs = stmt.executeQuery();   
            
            venue_idlist.clear();
            venue_namelist.clear();
            venue_sizelist.clear();
            venue_capacitylist.clear();
            costlist.clear();
            addresslist.clear();
            descriptionlist.clear();
            while(rs.next()) {
                venue_id = rs.getInt("venue_id");
                venue_name = rs.getString("venue_name");
                venue_size = rs.getString("venue_size");
                venue_capacity = rs.getInt("venue_capacity");
                cost = rs.getFloat("cost");
                address = rs.getString("address");
                description = rs.getString("description");
                
                venue_idlist.add(venue_id);
                venue_namelist.add(venue_name);
                venue_sizelist.add(venue_size);
                venue_capacitylist.add(venue_capacity);
                costlist.add(cost);
                addresslist.add(address);
                descriptionlist.add(description);
            }
                rs.close();
                stmt.close();
                conn.close();
                if(venue_idlist.isEmpty()){
                    return 0;
                }
                return 1;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public List<Integer> all_venue(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_app?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            System.out.println("Connection Success");
            
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM venue");
            
            ResultSet rs = stmt.executeQuery();   
            List<Integer> venue_list = new ArrayList<>();
            // 7. Get the results
            while(rs.next()) {
                int venueId = rs.getInt("venue_id");
                venue_list.add(venueId);
                
            }
                rs.close();
                stmt.close();
                conn.close();
                return venue_list;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static void main(String[] args){
        
    }
}
