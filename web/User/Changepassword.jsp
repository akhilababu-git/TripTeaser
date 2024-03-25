<%@include file="Head.jsp" %>
<%-- 
    Document   : Changepassword
    Created on : 11 Jan, 2024, 11:31:59 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
    </head>
    <body>
        <%
            if(request.getParameter("btn_update")!=null)
            {
                String Currentpassword=request.getParameter("Cpassword");
                String Newpassword=request.getParameter("Npassword");
                String repassword=request.getParameter("Rpassword");
                String selQry="select * from tbl_user where user_password='"+Currentpassword+"' and user_id='"+(session.getAttribute("uid"))+"'";
                ResultSet rs=con.selectCommand(selQry);
               if(rs.next())
               {
                   if(repassword.equals(Newpassword))
                           {
                               
                               String upd="update tbl_user set user_password='"+repassword+"' where user_id='"+session.getAttribute("uid")+"'";
                               if(con.executeCommand(upd))
                               {
                                       
                                   %>
    <script>
        alert("Password Update");
        Window.location="Changepassword.jsp";
        </script>
        <%
                           
               }
            }
               else
               {
                   %>
                   <script>
                       alert("password doesnt match");
                       Window.location="Changepassword.jsp";
        </script>
        <%
               }
               
            }
            else
            {
%>
<script>
                       alert("Invalid Password");
                       Window.location="Changepassword.jsp";
        </script>
        <%
            }
        }%>
            
                       
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Current password</td>
                    <td><input type="text" name="Cpassword"></td>
                </tr>
                <tr>
                    <td>New password</td>
                    <td><input type="text" name="Npassword"></td>
                </tr>
                <tr>
                    <td>Re_password</td>
                    <td><input type="text" name="Rpassword"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_update" value="Update"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="Foot.jsp" %>