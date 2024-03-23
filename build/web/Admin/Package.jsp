<%-- 
    Document   : Package
    Created on : 10 Feb, 2024, 1:01:06 AM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package</title>
    </head>
 
    <body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/PackageUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Package name</td>
                    <td><input type="text" name="pname"></td>
                </tr>
                <tr>
                    <td>package details</td>
                    <td><input type="text" name="pdetails"</td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"></td></td>
                </tr>
                <tr>
                    <td>package amount</td>
                    <td><input type="text" name="pamount"></td>
                </tr>
                <tr>
                    <td>package days</td>
                    <td><input type="text" name="pdays"></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                   <select name="sel_place" id="sel_place">
                            <option value="">Select Place</option>
                            <%
                                String pselQry="select * from  tbl_place";
                                ResultSet rsp=con.selectCommand(pselQry);
                                while(rsp.next())
                                {
                                    %>
                                    <option value="<%=rsp.getString("place_id")%>"><%=rsp.getString("place_name")%></option>
                                    <%
                                }
                                %>
                   </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  name="btn_submit" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
