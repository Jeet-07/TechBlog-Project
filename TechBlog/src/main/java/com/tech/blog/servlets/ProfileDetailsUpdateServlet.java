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
@WebServlet("/ProfileDetailsUpdateServlet")
public class ProfileDetailsUpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	
        	HttpSession session=request.getSession();
        	User currUser=(User)session.getAttribute("currentUser");
        	
        	String name=request.getParameter("name").toUpperCase();
        	System.out.println(name);
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String about=request.getParameter("about");
            User temp=new User(name,email,password,about);
            
            try{
            UserDAO dao=new UserDAO(SqlConnector.getConnection());
            if(dao.updateUser(currUser,temp)) {
            	SqlConnector.close();
            	currUser.setName(name);
            	currUser.setEmail(email);
            	currUser.setPassword(password);
            	currUser.setAbout(about);
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
