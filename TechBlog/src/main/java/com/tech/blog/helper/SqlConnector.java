package com.tech.blog.helper;

/**
*
* @author Manjeet
*/
import java.sql.*;
public class SqlConnector {
   private static Connection con;
   public static Connection getConnection(){
       try{
           if(con==null){
           Class.forName("com.mysql.cj.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "Manjeet", "2601");
           }
       }catch(Exception e){
           e.printStackTrace();
       }
       return con;
   }
   public static void close() {
	   if(con!=null) {
		   try {
			   con.close();
			   con=null;
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }
	   }
   }
}