<%@include file="Head.jsp" %>
<%-- 
    Document   : Place
    Created on : 15 Dec, 2023, 2:13:36 PM
    Author     : anjan
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <%
        if (request.getParameter("btn_submit") != null) {
            String insQry = "insert into tbl_place(place_name,district_id,state_id)values('" + request.getParameter("txt_place") + "','" + request.getParameter("sel_district") + "','" + request.getParameter("sel_state") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("Place.jsp");
        }
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_place where place_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Place.jsp");
        }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>State</td>
                    <td><select name="sel_state" id="sel_state" onchange="getdistrict(this.value)">
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
                    <td><select  name="sel_district" id="sel_district">
                     <option value="">Select district</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input required="" type="text" id="txt_place" name="txt_place"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Submit"></td>
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
                    Place
                </td>
                <td>
                    Action
                </td>
            </tr>
            <%                                                int i = 0;
                String selQryP = "select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id inner join tbl_state s on p.state_id=s.state_id";
                ResultSet rsP = con.selectCommand(selQryP);
                while (rsP.next()) {

                    i++;

            %>
            <tr>    
                <td ><%=i%></td>
                <td ><%=rsP.getString("state_name")%></td>
                <td ><%=rsP.getString("district_name")%></td>
                <td ><%=rsP.getString("place_name")%></td>
                <td > 
                    <a href="Place.jsp?del=<%=rsP.getString("place_id")%>" >Delete</a>

                </td> 
            </tr>
            <%                      }


            %>
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
    </body>
</html>
<%@include file="Foot.jsp" %>