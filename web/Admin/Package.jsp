
<%@include file="Head.jsp" %>
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
                    <td><input type="text" name="pdetails"></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"></td>
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
                                String pselQry = "select * from  tbl_place";
                                ResultSet rsp = con.selectCommand(pselQry);
                                while (rsp.next()) {
                            %>
                            <option value="<%=rsp.getString("place_id")%>"><%=rsp.getString("place_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  name="btn_submit" value="Submit">
                    </td>
                </tr>
            </table>
                        <br><br><br>
            <table>
                <tr>
                    <td>Sl.no</td>
                    <td>Package</td>
                    <td>Amount</td>
                    <td>Days</td>
                    <td>Action</td>
                </tr>
                <%
                                if(request.getParameter("del")!=null)
                                {
                                   String del = "delete from tbl_package where package_id='"+request.getParameter("del")+"'"; 
                                   if(con.executeCommand(del))
                                   {
                                       response.sendRedirect("Package.jsp");
                                   }
                                }
                                
                    int i = 0;
                    String sel = "select * from tbl_package";
                    ResultSet rs = con.selectCommand(sel);
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("package_name")%></td>
                    <td><%=rs.getString("package_amount")%></td>
                    <td><%=rs.getString("package_days")%></td>
                    <td>
                        <a href="Package.jsp?del=<%=rs.getString("package_id")%>">Delete</a>
                        <a href="TransportationType.jsp?id=<%=rs.getString("package_id")%>">Transportation</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>

<%@include file="Foot.jsp" %>