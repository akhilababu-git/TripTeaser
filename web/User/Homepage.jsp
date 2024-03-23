<%-- 
    Document   : Homepage
    Created on : 12 Jan, 2024, 1:11:34 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>
    <body>
        <h1>Welcome <%=session.getAttribute("uname")%> </h1>
        <a href="Myprofile.jsp">Myprofile</a>
         <a href="Editprofile.jsp">Editprofile</a>
          <a href="Changepassword.jsp">Changepassword</a>
    </body>
</html>
