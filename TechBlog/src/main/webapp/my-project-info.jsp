<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>About this project</title>
        
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
    
    <!-- banner -->
    <div class="container-fluid p-0 m-0 banner-background">
            
            <div class="jumbotron primary-background text-white pb-10" style="padding-bottom:20px;">
                <h3><br></h3>
                <div class="container">
                    <h3 class="display-3">Hello Everyone... This is Manjeet here, creator of this TechBlog project.</h3>
                    <p>I have made this project completely for learning purposes. The focus of this project is mainly on backend features but
                    in the process i got to learn frontend also. I have hosted this project on AWS EC2 instance using Tomcat Server. This is based on 
                    MVC architecture. I have used Java for Models, Java Servlets for Controllers, JSP for views and JDBC for connecting with MySql Database Server.  
                    </p><br>
                    <ul class="list-group">
					  <li class="list-group-item active">Technologies Used:</li>
					  <li class="list-group-item">Java, Servlets and Jsp.</li>
					  <li class="list-group-item">JDBC for connecting Java and MySql Database.</li>
					  <li class="list-group-item">MySql Database and Server.</li>
					  <li class="list-group-item">BootStrap and Javascript.</li>
					  <li class="list-group-item">AWS for hosting purpose.</li>
					  <li class="list-group-item">This project uses MVC Architecture Design pattern.</li>
					</ul><br>
                    <table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">Features</th>
					      <th scope="col">Specifications</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">SignUp Module</th>
					      <td>Users can create their profiles and it will be stored in database after which they can login anytime.</td>
					    </tr>
					    <tr>
					      <th scope="row">Login Module</th>
					      <td>After logging in, 1. Users can edit their profiles to update their details.<br>
					                            2. Users can post new blogs.<br>
					                            3. Users can see other people blogs.<br>
					                            4. Users can Like other people blogs. </td>
					    </tr>
					    <tr>
					      <th scope="row">Post Blog Module</th>
					      <td colspan="2">Users can create new blogs which other users will be able to see.</td>
					    </tr>
					    <tr>
					      <th scope="row">Edit Profile Module</th>
					      <td colspan="2">Users can change/update their profile details upload new profile pictures.</td>
					    </tr>
					    <tr>
					      <th scope="row">Like Blog Module</th>
					      <td colspan="2">Users can like the blog of other users, number of likes can be seen by everyone which is updated in realtime.</td>
					    </tr>
					  </tbody>
					</table>
                    <br>
                    <br>
                    <br>
                    <br>
                    
                </div>
             
            </div>
            
        </div>



</body>
</html>