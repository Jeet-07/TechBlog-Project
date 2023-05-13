<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="com.tech.blog.dao.PostDAO" %>
<%@page import="com.tech.blog.dao.LikeDAO" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.*" %>
<% 
	PostDAO dao=new PostDAO(SqlConnector.getConnection());
	ArrayList<Post> list= null;
	list=dao.getAllPosts();
	String path= request.getServletContext().getRealPath(File.separator);
    LikeDAO ldao=new LikeDAO(SqlConnector.getConnection());
    FileOutputStream os=null;

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>TechBlog Home</title>
        
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 71% 91%, 26% 100%, 0 91%, 0 0);
            }
            
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="NormalNavbar.jsp"%>
        
        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background">
            
            <div class="jumbotron primary-background text-white">
                <h3><br></h3>
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <h3>This is just a project not a real blog.</h3>
                    <% if(user==null){ %>
                    <a href="signup-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Sign Up</a>
                    <a href="login-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                    <% } %>
                    <h3><br></h3>
                </div>
             
            </div>
            
        </div>
        <br>
        
        <!--cards-->
        <div class="container"> 
            <div class="row pt-3">
			<%  int i=0;
				for(Post p:list) {
				i++;
				%>
			    <div class="col-md-4 pt-3">
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
			          	<a href="profile-page.jsp" class="btn btn-primary">Read More...</a>
			          </div>
			        </div>
			    </div>
			<%	if(i==3){
					i=0;%>
				</div><div class="row pt-3">
			<%	}	
				} 
				SqlConnector.close();
				%>
			</div>
        </div>
        
        
        
        
        
        
        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" 
        crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" 
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" 
        crossorigin="anonymous">
        </script>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" 
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" 
        crossorigin="anonymous">
        </script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
    </body>
</html>
