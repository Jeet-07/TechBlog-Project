package com.tech.blog.servlets;

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

import com.tech.blog.dao.UserDAO;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.SqlConnector;

/**
 * Servlet implementation class ProfilePicUpdateServlet
 */
@MultipartConfig
@WebServlet("/ProfilePicUpdateServlet")
public class ProfilePicUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
        	HttpSession session=request.getSession();
        	User currUser=(User)session.getAttribute("currentUser");
        	
            Part part=request.getPart("profile");
            byte[] profile= part.getInputStream().readAllBytes();
            
            try{
            UserDAO dao=new UserDAO(SqlConnector.getConnection());
            if(dao.updateUserProfile(currUser.getId(),part.getInputStream())) {
            	SqlConnector.close();
            	currUser.setProfile(profile);
            	Message msg=new Message("Profile Updated Successfully.",true);
            	session.setAttribute("updatedProfile",msg);
            	response.sendRedirect("profile-page.jsp");
            }else {    
            	SqlConnector.close();
            	Message msg=new Message("Something Went Wrong.",false);
            	session.setAttribute("updatedProfile",msg);
            	response.sendRedirect("profile-page.jsp");
            }
           
        }catch(Exception e){
            e.printStackTrace();
        }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
