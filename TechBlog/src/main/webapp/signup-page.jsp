<%-- 
    Document   : signup
    Created on : 21-Feb-2023, 5:33:28 am
    Author     : Manjeet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registration</title>
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
        
        <%@include file="NormalNavbar.jsp" %>
        <% Message msg = (Message)session.getAttribute("msg");%>
        <main class="d-flex primary-background banner-background" style="padding-bottom:100px;" >
            
            <div class="container" style="padding-top:20px;">
                <div class="row" >
                    <div class="col-md-6 offset-md-3">
                        <div class="card" >
                            <div class="card-header text-center text-white primary-background" >
                                <span class="fa fa-user-plus fa-3x text-white"></span>
                                <br>Sign Up<br>
                            </div>
                            <div class="card-body">
                                
                                <%
                                   if(msg!=null && msg.getType().equals("csserror")){
                                %>
                                <div class="alert <%=msg.getCssclass() %>" role="alert">
  									<%= msg.getContent() %>
							    </div> 
							    <%
							       session.removeAttribute("msg");
                                   }
							    %>
                                
                                <form id="signupform" action="SignupServlet" method="post" >
                                  <div class="form-group">
                                    <label for="fullname">Name</label>
                                    <input name="name" required type="text" class="form-control" id="fullname" placeholder="Enter Your FullName">
                                  </div>
                                  <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="email" required type="email" class="form-control" id="email"  placeholder="Enter email">
                                   
                                  </div>
                                  <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" required type="password" class="form-control" id="password" placeholder="Password">
                                  </div>
                                   <div class="form-group">
                                    <label for="gender" >Select Gender : </label><br>
                                    <input required type="radio" id="gender" name="gender" value="Male"> Male
                                    <input required type="radio" id="gender" name="gender" value="Female"> Female 
                                  </div>
                                  <div class="form-group">
                                      <textarea class="form-control "name="about" id="about" rows="3" placeholder="Enter something about yourself."></textarea>
                                  </div>
                                  <div class="form-check">
                                    <input name="check" required type="checkbox" class="form-check-input" id="terms">
                                    <label class="form-check-label" for="terms">I agree with terms and conditions.</label>
                                  </div>
                                  <button type="submit" class="btn btn-primary primary-background">Submit</button>
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
        <script>
        $(document).ready(function(){
        	
        	<% if(msg!=null && msg.getType().equals("jssuccess")){
        		session.removeAttribute("msg"); %>
        	    
        	swal({title: "Registered Succesfully!",text: "Go to login page.",icon: "success"})
            .then((value) => {
                window.location="login-page.jsp";
              });
        	
        	<% }else if(msg!=null && msg.getType().equals("jserror")){ 
        		session.removeAttribute("msg"); %>
        	    
        		swal({title: "Oops!",text: "Something went wrong please try again in some time.",icon: "error"});    
        	
        	<% } %>
        });
        
        
        </script>
        
        
        
        <!-- <script>
            $(document).ready(function(){
                console.log("loaded...");
                
                $('#signupform').on('submit',function(event){
                    event.preventDefault();
                    
                    let form= new FormData(this);
                    
                    //send data to servlet
                    $.ajax({
                        type:'POST',
                        url:'SignupServlet',
                        data: form,
                        success:function(response){
//                            console.log(response.toString());
                             
                            if(response.trim()==="done"){
                                swal({title: "Registered Succesfully!",text: "Go to login page.",icon: "success"})
                                .then((value) => {
                                    window.location="login-page.jsp";
                                  });
                            }else{
                               swal({title: "Oops!",text: "Something went wrong please try again in some time.",icon: "error"}); 
                            }
                        },
                        error:function(response){
                            console.log("error agya bhai");
                            console.log(response);
                        },
                        processData:false,
                        contentType:false
                    });
                    
                });
            });
        </script> -->
        
        
    </body>
</html>