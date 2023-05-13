package com.tech.blog.dao;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import java.sql.Blob;
import com.tech.blog.entities.Post;


public class PostDAO {
     Connection con;
     public PostDAO(Connection con) {
    	 this.con=con;
     }
     
     public boolean savePost(Post post) {
    	 
    	 try {
    		 InputStream pic=new ByteArrayInputStream(post.getpPic());
    		 String q="insert into posts(pTitle,pContent,pCode,catid,uid,pPic) values(?,?,?,?,?,?)";
    		 PreparedStatement ps=con.prepareStatement(q);
    		 ps.setString(1,post.getpTitle());
    		 ps.setString(2,post.getpContent());
    		 ps.setString(3,post.getpCode());
    		 ps.setInt(4,post.getCatid());
    		 ps.setInt(5,post.getUid());
    		 ps.setBlob(6,pic);
    		 ps.executeUpdate();
    		 return true;
    	 }catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 
    	 
    	 
    	 
    	 return false;
     }
     public ArrayList<Post> getAllPosts() {
         ArrayList<Post> list=new ArrayList<>();
    	 try {
    		 String q="select * from posts order by rDate desc";
    		 PreparedStatement ps=con.prepareStatement(q);
    		 ResultSet all= ps.executeQuery();
    		 while(all.next()) {
    			 int pid=all.getInt("pid");
    			 int uid=all.getInt("uid");
    			 int catid=all.getInt("catid");
    			 String pTitle=all.getString("pTitle");
    			 String pContent=all.getString("pContent");
    			 String pCode=all.getString("pCode");
    			 Blob b=all.getBlob("pPic");
    			 Timestamp rDate=all.getTimestamp("rDate");
    			 byte[] pPic;
    			 if(b==null) 
    				pPic=new byte[0]; 
    			 else pPic=b.getBytes(1, (int)b.length());
    			 
    			 Post post=new Post(pid, uid, catid, pTitle, pContent, pCode, pPic, rDate);
    			 list.add(post);		 
    		 }
    	 }catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 return list;
     }
     public ArrayList<Post> getAllPostsByCatid(int cid) {
         ArrayList<Post> list=new ArrayList<>();
    	 try {
    		 String q="select * from posts where catid=? order by rdate desc";
    		 PreparedStatement ps=con.prepareStatement(q);
    		 ps.setInt(1,cid);
    		 ResultSet all= ps.executeQuery();
    		 while(all.next()) {
    			 int pid=all.getInt("pid");
    			 int uid=all.getInt("uid");
    			 int catid=all.getInt("catid");
    			 String pTitle=all.getString("pTitle");
    			 String pContent=all.getString("pContent");
    			 String pCode=all.getString("pCode");
    			 Blob b=all.getBlob("pPic");
    			 Timestamp rDate=all.getTimestamp("rDate");
    			 byte[] pPic;
    			 if(b==null) 
    				pPic=new byte[0]; 
    			 else pPic=b.getBytes(1, (int)b.length());
    			 Post post=new Post(pid, uid, catid, pTitle, pContent, pCode, pPic, rDate);
    			 list.add(post);
    		 }
    	 }catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 return list;
     }
     public Post getPostById(int postid) {
    	 try {
    		 String q="select * from posts where pid=?";
    		 PreparedStatement ps=con.prepareStatement(q);
    		 ps.setInt(1,postid);
    		 ResultSet all= ps.executeQuery();
    		 if(all.next()) {
    			 int pid=all.getInt("pid");
    			 int uid=all.getInt("uid");
    			 int catid=all.getInt("catid");
    			 String pTitle=all.getString("pTitle");
    			 String pContent=all.getString("pContent");
    			 String pCode=all.getString("pCode");
    			 Blob b=all.getBlob("pPic");
    			 Timestamp rDate=all.getTimestamp("rDate");
    			 byte[] pPic;
    			 if(b==null) 
    				pPic=new byte[0]; 
    			 else pPic=b.getBytes(1, (int)b.length());
    			 Post post=new Post(pid, uid, catid, pTitle, pContent, pCode, pPic, rDate);
    			 return post;
    		 }
    	 }catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 return null;
     }
     
}
