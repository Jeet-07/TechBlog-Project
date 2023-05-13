package com.tech.blog.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.tech.blog.entities.Category;
public class CategoryDao {
	public static ArrayList<Category> getCategories(Connection con){
		try {
			String query="select * from categories";
			PreparedStatement psmt=con.prepareStatement(query);
			ResultSet all= psmt.executeQuery();
			ArrayList<Category> list=new ArrayList<Category>();
			while(all.next()) {
			 Category temp=new Category(all.getInt("cid"),all.getString("name"),all.getString("description"));
			 list.add(temp);
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
}
