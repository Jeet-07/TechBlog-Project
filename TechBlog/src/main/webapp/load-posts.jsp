<%@page import="com.tech.blog.dao.*"%>
<%@page import="java.io.*"%>
<%@page import="com.tech.blog.helper.SqlConnector"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.entities.User" %>
<%
    User currUser=(User)session.getAttribute("currentUser");
    PostDAO dao=new PostDAO(SqlConnector.getConnection());
    ArrayList<Post> list= null;
    int cid=Integer.parseInt( request.getParameter("cid"));
    if(cid==0){
    	list=dao.getAllPosts();
    }else{
    	list=dao.getAllPostsByCatid(cid);
    }
    if(list.size()==0){
    	out.println("<h3 class='text-center display-3'>No Post Yet.</h3>");
    	return;
    }
    String path= request.getServletContext().getRealPath(File.separator);
    LikeDAO ldao=new LikeDAO(SqlConnector.getConnection());
    FileOutputStream os=null;
%>
<div class="row pt-3">
<%  int i=0;
	for(Post p:list) {
	i++;
	%>
    <div class="col-md-6 pt-3">
        <div class="card">
          <%if(p.getpPic().length!=0){ 
        	  os=new FileOutputStream(new File(path+File.separator+"blog_pics"+File.separator+p.getPid()+".jpg"));
			  os.write(p.getpPic());
			  os.flush();
			  os.close();
        	  %>
          	<img src="blog_pics<%=File.separator+p.getPid()%>.jpg" class="card-img-top" alt="no photo" height="150px">
          <%}else{%>
           	<img src="blog_pics/default.jpg" class="card-img-top" alt="no photo" height="150px">
           <%} %>
          <div class="card-body">
            <h5 class="card-title"><%= p.getpTitle() %></h5>
            <p class="card-text"><%= p.getpContent().substring(0, 75)%>...</p>
          </div>
          <div class="card-footer">
          	<a href="#" onclick="getpost(<%=p.getPid()%>)" class="btn btn-primary">Read More...</a>
          	<a href="#" onclick="dolike(<%=currUser.getId()%>,<%=p.getPid()%>)"class="btn btn-primary"><i class="fa fa-thumbs-o-up"><span class="like-counter<%=p.getPid()%>"> <%=ldao.getLikesByPost(p.getPid())%></span></i></a>
          </div>
        </div>
    </div>
<%	if(i==2){
		i=0;%>
	</div><div class="row pt-3">
<%	}	
	} 
	SqlConnector.close();
	%>
</div>
