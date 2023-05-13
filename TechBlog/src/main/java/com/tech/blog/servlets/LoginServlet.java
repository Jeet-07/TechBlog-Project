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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            try{
            UserDAO dao=new UserDAO(SqlConnector.getConnection());
            User user=dao.getUserByEmailAndPassword(email, pass);

            if(user==null){
            	SqlConnector.close();
            	Message msg=new Message("Invalid Credentials!","Error","alert-danger");
            	HttpSession session= request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("profile-page.jsp");
            }else{
            	SqlConnector.close();
                HttpSession session= request.getSession();
                session.setAttribute("currentUser", user);
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
