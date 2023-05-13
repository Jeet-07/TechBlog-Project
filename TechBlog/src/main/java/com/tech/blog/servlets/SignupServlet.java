package com.tech.blog.servlets;

import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Manjeet
 */
@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	UserDAO dao=new UserDAO(SqlConnector.getConnection());
        	
            String name=request.getParameter("name").toUpperCase();
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String gender=request.getParameter("gender");
            String about=request.getParameter("about");
            
            User user=dao.getUserByEmail(email);
            if(user==null) {
            	user=new User(name,email,password,gender,about);
	            if(dao.saveUser(user)){
	                SqlConnector.close();
	            	Message msg=new Message("jssuccess");
	            	HttpSession session=request.getSession();
	            	session.setAttribute("msg",msg);
	            	response.sendRedirect("signup-page.jsp");
	            }else{
	            	SqlConnector.close();
	            	Message msg=new Message("jserror");
	            	HttpSession session=request.getSession();
	            	session.setAttribute("msg",msg);
	            	response.sendRedirect("signup-page.jsp");
	            }
            }else {
            	SqlConnector.close();
            	Message msg=new Message("Email already registered. Try different email or Try login.","csserror","alert-danger");
            	HttpSession session=request.getSession();
            	session.setAttribute("msg",msg);
            	response.sendRedirect("signup-page.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
