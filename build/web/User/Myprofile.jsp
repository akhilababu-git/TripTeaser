<%-- 
    Document   : Myprofile
    Created on : 11 Jan, 2024, 11:15:24 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
    </head>
    <body>
        <%
           String selQry="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";   
           ResultSet rs=con.selectCommand(selQry);
           rs.next();
           %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("user_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("user_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("user_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("user_address")%></td>
                </tr>
            </table>
        </form>
       
    </body>
</html>
