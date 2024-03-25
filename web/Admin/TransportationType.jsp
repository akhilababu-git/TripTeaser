
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>

    </head>

    <%

        if (request.getParameter("btn_submit") != null) {

            String insQry = "insert into tbl_transportation(package_id,type_id)values('" + request.getParameter("id") + "','" + request.getParameter("sel_type") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("TransportationType.jsp?id="+request.getParameter("id"));//Its for Page Refresh

        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_transportation where transportation_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("TransportationType.jsp?id="+request.getParameter("id"));
        }


    %>
    <%@include file="Head.jsp" %>
    <body>
        <form method="post">
            <table border="1" align="center" >
                <tr>
                    <td>Type</td>
                    <td><select name="sel_type">
                            <option value="">----Select----</option>
                            <%                                String selQry = "select * from tbl_transportationtype ";
                                ResultSet rss = con.selectCommand(selQry);
                                while (rss.next()) {


                            %>
                            <option value="<%=rss.getString("type_id")%>"><%=rss.getString("type_name")%></option>

                            <%                      }


                            %>

                        </select>
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
                    Sl.no
                </td>
                <td>
                    Package
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
                String selQryt = "select * from tbl_transportation d inner join tbl_transportationtype s on s.type_id=d.type_id inner join tbl_package p on p.package_id=d.package_id where p.package_id='"+request.getParameter("id")+"'";
                ResultSet rst = con.selectCommand(selQryt);
                while (rst.next()) {
                    i++;
            %>
            <tr>    
                <td><%=i%></td>
                <td><%=rst.getString("type_name")%></td>
                <td><%=rst.getString("package_name")%></td>
                <td> 
                    <a href="TransportationType.jsp?del=<%=rst.getString("transportation_id")%>&id=<%=request.getParameter("id")%>">Delete</a>
                </td> 
            </tr>
            <%                      }


            %>
        </table>
    </body>
</html>
<%@include file="Foot.jsp" %>           