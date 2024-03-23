<%-- 
    Document   : Login
    Created on : 11 Jan, 2024, 11:01:06 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            if(request.getParameter("btn_login")!= null)
            {
                String email=request.getParameter("Email");
                String password=request.getParameter("Password");
                String selQry="select * from tbl_user where user_email='"+email+"'and user_password='"+password+"'";
                ResultSet rs=con.selectCommand(selQry);
                if(rs.next())
                {
                    session.setAttribute("uid",rs.getString("user_id"));
                    session.setAttribute("uname",rs.getString("user_name"));
                    response.sendRedirect("../User/Homepage.jsp");
                }
            else
            {
                %>
            <script>
                alert("invalid user");
            </script>
            <%
            }
            }
            %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="Email"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="Password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_login" value="Login"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
