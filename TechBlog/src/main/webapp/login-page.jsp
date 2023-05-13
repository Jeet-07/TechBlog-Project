<%-- 
    Document   : login-page
    Created on : 21-Feb-2023, 3:40:00 am
    Author     : Manjeet
--%>
<%@page import="com.tech.blog.entities.*" %>
<%  User userx = (User)session.getAttribute("currentUser");
    if(userx!=null){
    	response.sendRedirect("profile-page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 71% 91%, 26% 100%, 0 91%, 0 0);
            }
            
        </style>
        
        
        
    </head>
    <body>
        <%@include file="NormalNavbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background" style="padding-bottom:100px;">
            
            <div class="container" style="padding-top:80px;">
                <div class="row" >
                    <div class="col-md-4 offset-md-4" >
                        <div class="card" >
                            <div class="card-header text-center text-white primary-background" >
	                            <span class="fa fa-user fa-3x text-white"></span>
	                            <br>Login<br>   
                            </div>
                            <div class="card-body">
                                
                                <%
                                   Message msg= (Message)session.getAttribute("msg");
                                   if(msg!=null){
                                %>
                                <div class="alert <%=msg.getCssclass() %>" role="alert">
  									<%= msg.getContent() %>
							    </div> 
							    <%
							       session.removeAttribute("msg");
                                   }
							    %>
                                 
                                <form id="loginform" action="LoginServlet" method="post">
                                  <div class="form-group">
                                    <label for="emailadd">Email address</label>
                                    <input name="email" required type="email" class="form-control" id="emailadd"  placeholder="Enter email">
                                  </div>
                                  <div class="form-group">
                                    <label for="pass">Password</label>
                                    <input name="password" required type="password" class="form-control" id="pass" placeholder="Password">
                                  </div>
                                  <br>
                                  <div class="container text-center text-white">
                                    <button type="submit" class="btn btn-primary primary-background">Submit</button>
                                  </div>
                                  
                                </form>
                            </div>
                        </div>                                           
                    </div>
                </div>
            </div>
        </main>
        
        
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
       <!-- <script>
            $(document).ready(function(){
                console.log("loaded...");
                $('#loginform').on('submit',function(event){
                   event.preventDefault();
                   
                   let form=new FormData(this);
                   $.ajax({
                      type:"post",
                      url:"LoginServlet",
                      data:form,
                      success:function(response){
                          if(response.trim()==="error"){
                              swal({title: "Oops!",text: "Check your Email or Password.",icon: "error"});
                          }else{
                              window.location.href= response.trim();
                          }
                      },
                      error:function(response){
                          console.log("error arha hai kuch servlet nhi acces horha");
                          console.log(response);
                      },
                      processData:false,
                      contentType:false
                   });
                });
            });

        </script>-->
    </body>
</html>