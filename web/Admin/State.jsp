<%@include file="Head.jsp" %>
<%-- 
    Document   : State
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
        <title>state</title>
    </head>
    <%
        if(request.getParameter("btn_submit")!=null)
        {
            String insQry="insert into tbl_state(state_name)values('"+request.getParameter("txt_state")+"')";
            con.executeCommand(insQry);
            response.sendRedirect("State.jsp");
        }
        if(request.getParameter("del")!=null)
        {
            String delQry="delete from tbl_state where state_id='"+request.getParameter("del")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("State.jsp");
        }
        %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>State</td>
                    <td><input required="" type="text" id="txt_state" name="txt_state"></td>
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
                    State
                </td>
                <td>
                    Action
                </td>
            </tr>
            <%
        int i=0;
        String selQry="select * from tbl_state";
        ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {

                    i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%=rs.getString("state_name")%></td>
            <td>
                <a href="State.jsp?del=<%=rs.getString("state_id")%>" >Delete</a>
            </td>
                    
        </tr>
        <%
                }
                %>
        </table>
        
    </body>
</html>
<%@include file="Foot.jsp" %>