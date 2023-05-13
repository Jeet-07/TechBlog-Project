package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDAO {
	Connection con;
	public LikeDAO(Connection con) {
		this.con=con;
	}	
	public boolean addlike(int pid,int uid) {
		try {
			String q="insert into likes(postid,userid) values(?,?)";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return false;
	}
	public boolean removelike(int pid,int uid) {
		try {
			String q="delete from likes where postid=? and userid=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			psmt.executeUpdate();
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return false;
	}
	public int getLikesByPost(int pid) {
		try {
			String q="select count(*) from likes where postid=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, pid);
			ResultSet rs=psmt.executeQuery();
			if(rs.next())
				return rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public boolean isLikedByUser(int pid,int uid) {
		try {
			String q="select count(*) from likes where postid=? and userid=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setInt(1, pid);
			psmt.setInt(2, uid);
			ResultSet rs=psmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)==1)
				 return true;
				else return false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
