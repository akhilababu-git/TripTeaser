<%-- 
    Document   : SearchPackage
    Created on : 22 Feb, 2024, 10:00:48 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Package</title>
    </head>
    <body>    
        <form method="post">
            <table border="1"align ="center">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id ="sel_district" onchange="getplace(this.value)">
                            <option value="">select District</option>
 
                            <%
                                String DselQry = "select * from tbl_district";
                                ResultSet rsd = con.selectCommand(DselQry);
                                while (rsd.next()) {
                            %>
                            <option value="<%=rsd.getString("district_id")%>"><%=rsd.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>place</td>
                    <td>
                        <select name="sel_place" id="sel_place">
                            <option value="">select place</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" value="Submit"></td>
                </tr>
            </table>
        </form>
        <div id="tableData">
            <table align="center">
                <tr>
                    <%
                                if(request.getParameter("btn_submit")!=null)
                                {
                        int i = 0;
                        String pselqry = "select * from tbl_package where place_id='"+request.getParameter("sel_place")+"'";;
                        ResultSet rsp = con.selectCommand(pselqry);
                        while (rsp.next()) {
                            i++;
                    %>
                    <td>
                        <table border="1"align="center" width="200" height="300" style="margin:20px">
                            <tr>
                                <td colspan="2" align='center'><img src='../Assets/Files/Package/<%=rsp.getString("package_photo")%>'width='150' height='150'></td>
                            </tr>
                            <tr>
                                <td>package name</td>
                                <td><%=rsp.getString("package_name")%></td>
                            </tr>
                            <tr>
                                <td>package amount</td>
                                <td><%=rsp.getString("package_amount")%></td>
                            </tr>
                            <tr><td colspan="2" align="center">
                            <a href="ViewMore.jsp?id=<%=rsp.getString("package_id")%>">Book Now</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <%
                            if (i == 4) {
                                out.println("</tr><tr>");
                            }
                        }
                                }
                    %>                        
            </table>
    </body>

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



</html>
