<%@page import="com.tech.blog.entities.*" %>
<% User user=(User)session.getAttribute("currentUser");%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs"></span> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="my-project-info.jsp"><span class="fa fa-university"></span> My Project</a>
        </li>
        <% if(user==null){%>
        <li class="nav-item">
          <a class="nav-link text-white" href="login-page.jsp"><span class="fa fa-sign-in text-white"></span> Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="signup-page.jsp"><span class="fa fa-user-plus text-white"></span> Sign Up</a>
        </li>
        <%}else{ %>
        <li class="nav-item">
          <a class="nav-link text-white" href="profile-page.jsp"><span class="fa fa-user text-white"></span> My Profile</a>
        </li>
        
      </ul>
      <ul class="navbar-nav mr-right">
					<li class="nav-item">
						<a class="nav-link text-white" href="LogoutServlet">
							<span class="fa fa-sign-out text-white"></span>
							Log Out
						</a>
					</li>
	  </ul>
	  <%} %>
    </div>
  </div>
</nav>