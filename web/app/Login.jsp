<%-- 
    Document   : Login
    Created on : Feb 2, 2017, 1:33:02 PM
    Author     : tito
--%>
<%
if(request.getSession().getAttribute("usr")!=null){
response.sendRedirect("index.jsp");

}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="resources/css/bootstrap.css" rel="stylesheet"/>
        <link  rel="stylesheet" href="resources/css/style.css"/>
        <title>awebarts</title>
    </head>
    <body>
        <div class="container">
            <div class="contents logincont">
                <div class="register">
                    <form action="" method="POST">
                        <h2>Register New User</h2>
                        <input class="input-lg" type="text" placeholder="Enter your name"/>
                        <input class="input-lg" type="email" placeholder="Enter your email"/>
                        <input class="input-lg" type="text" placeholder="Enter your user name"/>
                        <input class="input-lg" type="password"/>
                        <input class="btn-lg btn-success" type="submit" value="Register"/>
                    </form>
                </div> 
                <div class="login">
                    <form action="../login" method="POST">
                        <h2>Login</h2>
                        <input class="input-lg" name="usrname" type="text" placeholder="Enter your user name"/>
                        <input class="input-lg" name="password" type="password"/>
                        <input class="btn-lg btn-primary" type="submit" value="Login"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
