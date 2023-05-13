package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tech.blog.entities.User;

/**
 * Servlet implementation class BlogPicServlet
 */
@WebServlet("/BlogPicServlet")
public class BlogPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		try(ServletOutputStream out=response.getOutputStream()){
				response.setContentType("image/gif");
				out.write(user.getProfile());
				out.flush();
				out.close();
		}
	}
}