<%-- 
    Document   : UserRegistration
    Created on : 5 Jan, 2024, 12:07:45 PM
    Author     : anjan
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">
            <table border="1" center="align">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="Name"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="Email"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="Contact"></td>
                </tr>
                <tr>
                    <td>Address</td>
                   <td><textarea cols="45" rows="5" name="Address" ></textarea></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><select name="sel_state" id="sel_state" >
                            <option value="">Select state</option>
                            <%
                                String selQry = "select * from tbl_state";
                                ResultSet rsd = con.selectCommand(selQry);
                                while (rsd.next()) {
                            %>
                            <option value="<%=rsd.getString("state_id")%>"><%=rsd.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                     <td>District</td>
                    <td><select  name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                     <option value="">Select district</option>
                     <%
                                String dselQry="select * from tbl_district";
                                ResultSet rsl=con.selectCommand(dselQry);
                                while(rsl.next())
                                {
                                    %>
                                    <option  value="<%=rsl.getString("District_id")%>"><%=rsl.getString("District_name")%></option>
                                    <%
                                }
                                %>
                        </select>
                    </td>
                </tr
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="sel_place" id="sel_place">
                            <option value="">Select Place</option>
                            <%
                                String pselQry="select * from  tbl_place";
                                ResultSet rs2=con.selectCommand(pselQry);
                                while(rs2.next())
                                {
                                    %>
                                    <option value="<%=rs2.getString("place_id")%>"><%=rs2.getString("place_name")%></option>
                                    <%      
                                }
                                %>
                    </td>
                    
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" value="Male">Male
                        <input type="radio" name="gender" value="Female">Female</td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"></td>
        
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="Password"></td>
                </tr>
                <tr>
                    <td>Retype Password</td>
                    <td><input type="text" name="Retype Password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_register" value="Register"></td>
                </tr>
            </table>
        </form>
    <script src="../Assets/JQ/jQuery.js"></script>
        <script>
                        function getdistrict(sid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/Ajaxdistrict.jsp?sid=" + sid,
                                success: function(html) {
                                    $("#sel_district").html(html);

                                }
                            });
                        }</script>
        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
                        function getplace(pid)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/Ajaxsplace.jsp?pid=" + pid,
                                success: function(html) {
                                    $("#sel_place").html(html);

                                }
                            });
                        }</script>
    </body>
</html>
