<%-- 
    Document   : profile-page
    Created on : 23-Feb-2023, 3:26:32 am
    Author     : Manjeet
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.CategoryDao" %>
<%@page import="com.tech.blog.helper.SqlConnector" %>
<%@page errorPage="errorpage.jsp" %>
<% Message msg=(Message)session.getAttribute("updatedProfile");
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
    response.sendRedirect("login-page.jsp");
   }
   ArrayList<Category> list=CategoryDao.getCategories(SqlConnector.getConnection());
   SqlConnector.close();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>TechBlog</title>
        
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
            .card-img-top-post {
				width: 100%;
				height: 40vh;
				object-fit: cover;
			}
            .post-title {
				font-size:30px;
			}
            .post-content {
				font-size:20px;
			}
            .post-code {
				font-size:15px;
			}
        </style>
    </head>
    <body>
    
    <!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs"></span>
				Tech Blog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="my-project-info.jsp">
						<span class="fa fa-university"></span>
							My Project
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-white" href="#!" data-bs-toggle="modal" data-bs-target="#do-post-modal">
							<span class="fa fa-asterisk"></span> 
							Post Something
						</a>
					</li>
					
				</ul>
				
				<!-- right side user name -->
				
				<ul class="navbar-nav mr-right">
				    <li class="nav-item">
						<a class="nav-link text-white" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal">
							<span class="fa fa-user-circle text-white"></span>
							<%=user.getName() %>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-white" href="LogoutServlet">
							<span class="fa fa-sign-out text-white"></span>
							Log Out
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- end of navbar -->
        
    <!-- main body -->
    <div class="container-fluid">
    	<div class="row mt-3">
    		<div class="col-md-4">
    			<div class="list-group">
				  <a href="#" onclick="getposts(0,this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
				    All Posts
				  </a>
				  <%for(Category cat:list){ %>
				  <a href="#" onclick="getposts(<%=cat.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=cat.getName() %></a>
				  <%} %>
				  </div>
    		</div>
    		<div class="col-md-8">
    			<div class="container text-center" id="loader" >
    			<span class="fa fa-spin fa-refresh fa-4x"></span>
    			<h3>Loading...</h3>
    			</div>
    			<div class="container-fluid" id="all-post-container">
    			
    			
    			
    			</div>
    			<div class="container-fluid" id="post-container">
    			
    			
    			
    			</div>
    		</div>
    	</div>    
    </div>
    <!--  end of main body -->
    
        
        
        
        
        
        
        
        
        
        
        
    <!-- profile showcase modal -->
    	
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="modal-label" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white text-center">
	        <h5 class="modal-title " id="modal-label">Tech Blog</h5>
	      </div>
	      <div class="modal-body">
	        <div class="container text-center" >
	           <!--  <img src="pics/------ "  class="img-fluid" style="border-radius:50%; max-width:100px; " ><br><br>-->
	           <div id="profile-pic-div" class="container text-center">
	           	<%if(user.getProfile().length!=0){ %>
	           		<img src="./ProPicServlet"  class="img-fluid" style="border-radius:50%; max-width:100px; " />
	           	<%}else{%>
	           	 	<img src="pics/default.png"  class="img-fluid" style="border-radius:50%; max-width:100px; " />
	           	<%} %>
	           	<div class="container pt-2">
	           	<a id="edit-pic-btn" href="#" onclick="editpic()" class="btn btn-primary">Edit-Profile</a>
	           	<div>
	           	<div id="edit-pic" class="row pt-2">
	           	<div class="col-md-8 offset-md-2 ">
	           	<form enctype="multipart/form-data"action="ProfilePicUpdateServlet" method="post">
	           		<input id="pic-file" name="profile" type="file" class="form-control"><br><input type="submit" class="btn btn-primary">
	           	</form>
	           	</div>
	           	</div>
	           </div>
	           <div class="container text-center pt-2 pb-2">
	           <h5> <%= user.getName()%></h5>
	           </div>
	           <!-- profile details -->
	           <div id="profile-details">
	           <table class="table table-light">
				  <tbody>
				    <tr>
				      <th scope="row"> ID : </th>
				      <td><%=user.getId() %></td>
				    </tr>
				    <tr>
				      <th scope="row"> Email : </th>
				      <td><%=user.getEmail() %></td>
				    </tr>
				    <tr>
				      <th scope="row"> Gender : </th>
				      <td><%=user.getGender() %></td>
				    </tr>
				    <tr>
				      <th scope="row"> About : </th>
				      <td><%=user.getAbout() %></td>
				    </tr>
				    <tr>
				      <th scope="row"> Registered On : </th>
				      <td><%=user.getRdate().toString() %></td>
				    </tr>
				  </tbody>
				</table>
	           </div>
	           </div>
	           </div>
	           <!-- profile details ends here-->
	           
	           <!-- profile details edit -->
	           
	           <div id="profile-edit">
	           
	           <form id="profile-update-form" enctype="multipart/form-data" name="update-profile-form" action="ProfileDetailsUpdateServlet" method="post">
	            
	           	<table class="table table-light">
				  <tbody>
				    <tr>
				      <th scope="row"> ID : </th>
				      <td><%=user.getId() %></td>
				    </tr>
				    <tr>
				      <th scope="row"> Name : </th>
				      <td> <input name="name" required type="text" class="form-control" value="<%=user.getName() %>" ></td>
				    </tr>
				    <tr>
				      <th scope="row"> Email : </th>
				      <td> <input name="email" required type="email" class="form-control" value="<%=user.getEmail() %>" ></td>
				    </tr>
				    <tr>
				      <th scope="row"> Password : </th>
				      <td> <input name="password" required type="password" class="form-control" value="<%=user.getPassword() %>" ></td>
				    </tr>
				    <tr>
				      <th scope="row"> About : </th>
				      <td> <textarea name="about" class="form-control" rows="2" ><%=user.getAbout() %></textarea></td>
				    </tr>				    
				  </tbody>
				</table>
	           
	           <div class="container ">
	           <button id="save-profile" type="submit" class="btn btn-primary">Save</button>
	           </div>
	           
	           </form>
	           
	           
	           
	           </div>
	           
	           <!-- profile details ends here -->
	           
	           
	           
	           
	           
	           
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="profile-edit-button" type="button" class="btn btn-primary">Edit</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- profile showcase modal ends here -->
    
    
    <!-- Post Blog Modal -->
		
	<!-- Modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white">
	        <h5 class="modal-title" id="do-post-modal-title">Create Your Blog</h5>
	      </div>
	      <div class="modal-body">
	        <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
            	<select name="cid" required>
            		<option value="" selected disabled>--- Select Category of your blog ---</option>
            		<% for(Category cat:list){ %>
            		   <option value="<%=cat.getCid() %>"><%=cat.getName() %></option>            		
            		<%}%>
            	</select><br><br>
	        	<input name="title" required type="text" class="form-control" placeholder="Enter title of your blog"><br>        
	        	<textarea required name="content" class="form-control" rows="4" placeholder="Write your content here"></textarea><br>       
	        	<textarea name="code" class="form-control" rows="4" placeholder="Write your program code here if any"></textarea><br>       
	        	Select picture <br><input name="pic" type="file"> <br><br> 
	        	<div class="container text-center">
	            	<button type="submit" class="btn btn-primary">Save</button>
	            </div>     
	        </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button id="close-blog-btn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close Without Save</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <!-- Post Blog Modal ends here -->
    
    
    
    
    
    
    
    
        
        
        
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        <script>
        $(document).ready(function(){
        	
            
            	
            	<% if(msg!=null && msg.isDone()){
            		session.removeAttribute("updatedProfile"); %>
            	    
            		swal({title: "Yayyy!",text: "Profile updated successfully.",icon: "success"});
            	
            	<% }else if(msg!=null && !msg.isDone()){ 
            		session.removeAttribute("updatedProfile"); %>
            	    
            		swal({title: "Oops!",text: "Something went wrong please try again in some time.",icon: "error"});    
            	
            	<% } %>
            
            
            
            $('#edit-pic-btn').hide();
			$('#edit-pic').hide();
        	$("#profile-edit").hide();
        	let edit_status=false;
        	$('#profile-edit-button').click(function(){
        		if(edit_status==false){
        			$('#edit-pic-btn').show();
        			$('#edit-pic').hide();
        			$("#profile-details").hide();
        			$("#profile-edit").show();
        			$("#profile-edit-button").text("Back");
        			edit_status=true;
        		}else{
        			$("#profile-update-form")[0].reset();
        			$("#profile-edit").hide();
        			$("#profile-details").show();
        			$("#profile-edit-button").text("Edit");
        			$('#edit-pic-btn').text("Edit pic");
        			$('#edit-pic-btn').hide();
        			$('#edit-pic').hide();
        			edit_status=false;
        		}
        	});
        	
        });
        </script>
        <script>
	    $(document).ready(function(){  
	    	$('#close-blog-btn').click(function(){
        		$('#add-post-form')[0].reset();
        		$('#edit-pic').hide();
        	});
	    	
        	$("#add-post-form").on('submit',function(event){
	   			event.preventDefault();
	   			let form=new FormData(this);
	   			
	   			$.ajax({
	   				url:"AddPostServlet",
	   				type:"post",
	   				data:form,
	   				success:function(response){
	   					if(response.trim()=="success"){
	   						swal({title: "Yayyy!",text: "Blog added successfully.",icon: "success"}).then((value) => {
	   			                window.location="profile-page.jsp";
	   		              });	
	   					}else{
	   						swal({title: "Oops!",text: "Something went wrong. Try again later.",icon: "error"});
	   					}
	   					 					
	   						   					
	   				},
	   				error:function(response){
	   					swal({title: "Oops!",text: "Something went wrong. Try again later.",icon: "error"});
	   				},
	   				processData:false,
	   				contentType:false
	   				
	   			});
	   		});
	    });
        </script>
        <script>
        function getposts(catid,curr){
        	$('#post-container').hide();
        	$('#loader').show();
			$('#all-post-container').hide();
			$('.c-link').removeClass("active");
        	$.ajax({
	    		url: "load-posts.jsp",
	    		data:{cid:catid},
	    		success:function(data){
	    			$('#loader').hide();
	    			$('#all-post-container').show();
	    			$('#all-post-container').html(data);
	    			$(curr).addClass('active');
	    		}
	    	});
        }
	    $(document).ready(function(){  
	    	getposts(0,$('.c-link')[0]);
	    });
        </script>
        <script>
        
        function getpost(postid){
			$('#all-post-container').hide();
			$('#loader').show();
        	$.ajax({
	    		url: "show-blog.jsp",
	    		data:{pid:postid},
	    		success:function(data){
	    			$('#loader').hide();
	    			$('#post-container').show();
	    			$('#post-container').html(data);
	    		}
	    	});
        }
        </script>
        <script>
        let ok=true;
        function editpic(){
			if(ok){
	        	$('#edit-pic').show();
				$('#edit-pic-btn').text("Cancel");
				ok=false;
			}else{
				$('#edit-pic').hide();
				$('#edit-pic-btn').text("Edit pic");
				ok=true;
			}
        }
        </script>
        <script>
        function dolike(uid,pid){
        	let getclass='.like-counter'+pid;
			$.ajax({
				url:"LikeServlet",
				data:{postid:pid,userid:uid},
				success:function(data){
					if(data.trim()=='inc'){
						let c=$(getclass).html();
						c++;
						$(getclass).html(' '+c);
					}else if(data.trim()=='dec'){
						let c=$(getclass).html();
						c--;
						$(getclass).html(' '+c);
					}
				}
			});
        }
        </script>
    </body>
</html>
