<%-- 
    Document   : errorpage
    Created on : 22-Feb-2023, 6:55:20 am
    Author     : Manjeet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
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
        
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid"/>
            <h2>Something Went Wrong...</h2>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-2">Go Back To Home</a>
        </div>
    </body>
</html>
