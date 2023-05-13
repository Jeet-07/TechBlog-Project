package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tech.blog.dao.LikeDAO;
import com.tech.blog.helper.SqlConnector;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int uid=Integer.parseInt(request.getParameter("userid"));
			int pid=Integer.parseInt(request.getParameter("postid"));
			LikeDAO ldao=new LikeDAO(SqlConnector.getConnection());
			
			if(!ldao.isLikedByUser(pid,uid)) {
				if(ldao.addlike(pid, uid)) {
					response.getWriter().println("inc");
				}else {
					response.getWriter().println("error");
				}
				SqlConnector.close();
			}else {
				if(ldao.removelike(pid, uid)) {
					response.getWriter().println("dec");
				}else {
					response.getWriter().println("error");
				}
				SqlConnector.close();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
