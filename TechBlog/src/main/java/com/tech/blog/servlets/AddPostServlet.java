package com.tech.blog.servlets;

import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.SqlConnector;
import com.tech.blog.dao.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class AddPostServlet
 */
@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {       
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out= response.getWriter()){
			HttpSession session=request.getSession();
			User currUser= (User)session.getAttribute("currentUser");
			String title=request.getParameter("title");
    		String content=request.getParameter("content");
    		String code=request.getParameter("code");
    		Part part=request.getPart("pic");
    		byte[] pic= part.getInputStream().readAllBytes();
    		int catid=Integer.parseInt(request.getParameter("cid"));
    		int uid=currUser.getId();
    		
    		Post post=new Post(title,content,code,catid,uid,pic);
    		PostDAO dao=new PostDAO(SqlConnector.getConnection());
    		if(dao.savePost(post)) {
    			SqlConnector.close();
    			out.println("success");
    		}else {
    			SqlConnector.close();
    			out.println("error");
    		}
    		
		}
		
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}
