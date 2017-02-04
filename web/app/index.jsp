<%-- 
    Document   : index
    Created on : Feb 2, 2017, 12:11:47 AM
    Author     : tito
--%>

<%@page import="com.awebarts.model.user"%>
<%
  user usr=new user();
  if (request.getSession().getAttribute("usr") == null) {
        response.sendRedirect("Login.jsp");

    } else {
         usr = (user) request.getSession().getAttribute("usr");   
    }
%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="resources/css/bootstrap.css" rel="stylesheet"/>
        <link href="resources/css/style.css" rel="stylesheet"/>

        <title>awebarts</title>
    </head>
    <body>
        <div class="container">
            <header>
                <img src="resources/images/awebarts.png" alt="logo"/>
                <h2>welcome <%= usr.getUsr_name() %> <a class="logout" href="http://localhost:8080/awebarts_EE/logout">log out</a></h2>

            </header>
            <div class="clear"></div>
            <div class="contents">
                <aside>
                    <nav>
                        <a class="btn-danger" href="index.jsp">Main page</a>
                        <a class="btn-danger" href="?page=mainsetting">main setting</a>
                        <a class="btn-danger" href="?page=sections">sections</a>
                        <a class="btn-danger" href="?page=pages">pages</a>
                        <a class="btn-danger" href="?page=comments">comments</a>
                        <a class="btn-danger" href="?page=Library">Library</a>

                    </nav>
                </aside>
                <section id="page">
                    <% if (request.getParameter("page") != null) {
                            String url = request.getParameter("page");
                            if (url.equals("mainsetting")) {  %>
                    <%@include file="mainsetting.jsp" %>
                    <%  } else if (url.equals("sections")) { %>
                    <jsp:include page="sections.jsp"></jsp:include>
                    <% } else if (url.equals("pages")) { %>
                    <jsp:include page="pages.jsp"></jsp:include>
                    <%  } else if (url.equals("comments")) { %>
                    <jsp:include page="comments.jsp"></jsp:include>
                    <% } else if (url.equals("Library")) { %>
                    <jsp:include page="Library.jsp"></jsp:include>
                    <% }
                            } else {%>
                    <jsp:include page="main.jsp"></jsp:include>

                    <%   }%>
                </section>

            </div>
            <div class="clear"></div>
            <footer>
                <p>  Copy right reserved Tawfik elbadry</p>
            </footer>

        </div>  
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery-3.0.0.min.js"></script>
        <script src="resources/js/js.js"></script>
    </body>
</html>

