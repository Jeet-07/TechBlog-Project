<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.tech.blog.helper.SqlConnector"%>
<%@page import="com.tech.blog.dao.*"%>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.entities.User" %>
<%
    User currUser=(User)session.getAttribute("currentUser");
    PostDAO pdao=new PostDAO(SqlConnector.getConnection());
    int pid=Integer.parseInt( request.getParameter("pid"));    
	Post post=pdao.getPostById(pid);
    UserDAO udao=new UserDAO(SqlConnector.getConnection());
    User user=udao.getUserById(post.getUid());
    LikeDAO ldao=new LikeDAO(SqlConnector.getConnection());
    
%>
<div class="container-fluid">
			<div class="card">
				<div class="card-header primary-background text-white">
					<h3 class="post-title">
					 <%= post.getpTitle() %>
					</h3>
				</div>
				<div class="card-body">
					<%if(post.getpPic().length != 0){%>
		          		<img src="blog_pics<%=File.separator+post.getPid()%>.jpg" class="card-img-top card-img-top-post my-2">
		          	<%}else{%>
		           		<img src="blog_pics<%=File.separator%>default.jpg" class="card-img-top card-img-top-post my-2"  >
           			<%} %>
					<div class="row">
					 <div class="col-md-6"><p>Blog posted by: <%=user.getName() %></p></div>
					 <div class="col-md-6" style="text-align:right;"><p>Date : <%=post.getpDate().toLocaleString() %></p></div>
					</div>
					
					<p class="post-content"><%= post.getpContent() %> </p>
				    <br>
				    <br>
				    <% if(!post.getpCode().isEmpty()){ %>
				    <div class="post-code">
						<h4>Code:</h4><br>
						<p>
						<%=post.getpCode() %>
						</p>
					</div>
					<%} %>
				</div>
				<div class="card-footer">
          			<a href="#" onclick="dolike(<%=currUser.getId()%>,<%=post.getPid()%>)"class="btn btn-primary"><i class="fa fa-thumbs-o-up"><span class="like-counter<%=post.getPid()%>"> <%=ldao.getLikesByPost(post.getPid())%></span></i></a>
          		</div>
			</div>
	</div>
	<%SqlConnector.close();%>