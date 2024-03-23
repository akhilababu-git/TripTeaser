<%--
    Document   : Editprofile
    Created on : 11 Jan, 2024, 11:25:31 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
    </head>
    <body>
        <%

            if (request.getParameter("btn_update") != null);
            {

                String Name = request.getParameter("Name");
                String contact = request.getParameter("Contact");
                String email = request.getParameter("Email");
                String Address = request.getParameter("Address");
                String upQry = "update tbl_user set user_name='" + Name + "', user_contact='" + contact + "',user_email='" + email + "', user_address='" + Address + "' where user_id='" + session.getAttribute("uid") + "'";
                if (con.executeCommand(upQry)) {
        %>
        <script>
            alert("updated");
            Window.location = "MyProfile.jsp";
        </script>
        <%
                }
            }
            String selQry = "select * from tbl_user where user_id='" + session.getAttribute("uid") + "'";
            ResultSet rs = con.selectCommand(selQry);
            rs.next();
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="Name" value="<%=rs.getString("user_name")%>"</td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="Contact" value="<%=rs.getString("user_contact")%>"</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="Email"value="<%=rs.getString("user_email")%>"</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea cols="45" rows="5" name="Address"><%=rs.getString("user_address")%></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_update" value="Update"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
