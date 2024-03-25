
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

            String insQry = "insert into tbl_district(district_name,state_id)values('" + request.getParameter("txt_district") + "','"+Integer.parseInt(request.getParameter("sel_state"))+"')";
            con.executeCommand(insQry);
            response.sendRedirect("District.jsp");//Its for Page Refresh

        }
        
          if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("District.jsp");
        }


    %>
    <%@include file="Head.jsp" %>
    <body>
        <form method="post">
            <table border="1" align="center" >
                <tr>
                    <td>State</td>
                    <td><select name="sel_state">
                            <option value="">----Select----</option>
                            <%
                                String selQry = "select * from tbl_state ";
                                ResultSet rss = con.selectCommand(selQry);
                                while (rss.next()) {


                            %>
                            <option value="<%=rss.getString("state_id")%>"><%=rss.getString("state_name")%></option>

                            <%                      }


                            %>

                        </select>
                </tr>
                    <td>District</td>
                    <td>            
                        <input required="" type="text" id="txt_district" name="txt_district">
                    </td>
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
                    State
                </td>
                <td>
                    District
                </td>
                <td>
                    Action
                </td>
            </tr>
            <%                                                int i = 0;
                String selQryt = "select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id ";
                ResultSet rst = con.selectCommand(selQryt);
                while (rst.next()) {

                    i++;

            %>
            <tr>    
                <td ><%=i%></td>
                <td ><%=rst.getString("state_name")%></td>
                <td><%=rst.getString("district_name")%></td>
                <td > 
                    <a href="District.jsp?del=<%=rst.getString("district_id")%>" >Delete</a>

                </td> 
            </tr>
            <%                      }


            %>
        </table>
    </body>
</html>
<%@include file="Foot.jsp" %>           