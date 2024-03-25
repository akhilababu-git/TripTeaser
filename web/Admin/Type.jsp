<%@include file="Head.jsp" %>
<%-- 
    Document   : Type
    Created on : 2 Feb, 2024, 9:17:31 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>type</title>
    </head>
    <%
        if (request.getParameter("btn_submit") != null) {
            String insQry = "insert into tbl_transportationtype(type_name)values('" + request.getParameter("txt_type") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("Type.jsp");
        }
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_transportationtype where type_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Type.jsp");
        }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Type</td>
                    <td><input required="" type="text" id="txt_type" name="txt_type"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  name="btn_submit" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <table border="1" align="center">
            <tr>
                <td>
                    sl.no
                </td>
                <td>
                    Type
                </td>
                <td>
                    Action
                </td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_transportationtype";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {

                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("type_name")%></td>
                <td>
                    <a href="Type.jsp?del=<%=rs.getString("type_id")%>" >Delete</a>
                </td>

            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>

<%@include file="Foot.jsp" %>