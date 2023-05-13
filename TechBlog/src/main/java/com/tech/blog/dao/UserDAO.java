package com.tech.blog.dao;

/**
 * @author Manjeet
 */
import com.tech.blog.entities.User;

import java.io.InputStream;
import java.sql.*;
public class UserDAO {
    private Connection con;
    public UserDAO(Connection con){
        this.con=con;
    }
    public boolean saveUser(User user){
        boolean ok=false;
        try{
           String q="insert into users(name,email,password,gender,about) values (?,?,?,?,?)";
           PreparedStatement psmt= this.con.prepareCall(q);
           psmt.setString(1,user.getName());
           psmt.setString(2,user.getEmail());
           psmt.setString(3,user.getPassword());
           psmt.setString(4,user.getGender());
           psmt.setString(5,user.getAbout());
           psmt.executeUpdate();
           ok=true;
        }catch(SQLException e){
           e.printStackTrace();
        }
        return ok;
    }
    public boolean updateUser(User currUser,User temp){
        boolean ok=false;
        try{
        	String q="update users set name=? , email=? , password=?, about=? where id=?";
        	PreparedStatement psmt= this.con.prepareCall(q);
        	psmt.setString(1,temp.getName());
        	psmt.setString(2,temp.getEmail());
        	psmt.setString(3,temp.getPassword());
        	psmt.setString(4,temp.getAbout());
        	psmt.setInt(5,currUser.getId());
        	psmt.executeUpdate();
        	ok=true;
        }catch(SQLException e){
           e.printStackTrace();
        }
        return ok;
    }
    public boolean updateUserProfile(int id,InputStream profile){
        boolean ok=false;
        try{
        	
        	String q="update users set profile=? where id=?";
        	PreparedStatement psmt= this.con.prepareCall(q);
        	psmt.setBlob(1,profile);
        	psmt.setInt(2,id);
        	psmt.executeUpdate();
        	ok=true;
        }catch(SQLException e){
           e.printStackTrace();
        }
        return ok;
    }
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        
        try{
            String q="select * from users where email=? and password=?";
            PreparedStatement psmt= this.con.prepareCall(q);
            psmt.setString(1,email);
            psmt.setString(2,password);
            ResultSet set = psmt.executeQuery();
            if(set.next()){
              user=new User();
              user.setId(set.getInt("id"));
              user.setName(set.getString("name"));
              user.setEmail(set.getString("email"));
              user.setPassword(set.getString("password"));
              user.setGender(set.getString("gender"));
              user.setAbout(set.getString("about"));
              user.setRdate(set.getTimestamp("rdate"));
              Blob p=set.getBlob("profile");
              if(p==null) {
            	  user.setProfile(new byte[0]);
              }else {
              user.setProfile(p.getBytes(1, (int) p.length()));
              }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public User getUserByEmail(String email) {
    	User user =null;
    	try{
            String q="select * from users where email=?";
            PreparedStatement psmt= this.con.prepareCall(q);
            psmt.setString(1,email);
            ResultSet set = psmt.executeQuery();
            if(set.next()){
              user=new User();
              user.setId(set.getInt("id"));
              user.setName(set.getString("name"));
              user.setEmail(set.getString("email"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    	return user;
    }
    public User getUserById(int id) {
    	
    	try{
            String q="select * from users where id=?";
            PreparedStatement psmt= this.con.prepareCall(q);
            psmt.setInt(1,id);
            ResultSet set = psmt.executeQuery();
            if(set.next()){
            	User user=new User();
                user.setName(set.getString("name"));
                user.setRdate(set.getTimestamp("rDate"));
                return user;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    	return null;
    }
}