<%@include file="Head.jsp" %>
<%-- 
    Document   : ViewMore
    Created on : 29 Feb, 2024, 12:19:45 AM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View More</title>
    </head>
    <body>
        <%
            String SelQry = "select * from tbl_package p inner join tbl_place s on p.place_id=s.place_id inner join tbl_district d on d.district_id=s.district_id where package_id='" + request.getParameter("id") + "'";
            ResultSet rs = con.selectCommand(SelQry);
            rs.next();


        %>

        <table border="1" align="center">
            <tr>
                <td>photo</td>
                <td><img src='../Assets/Files/Package/<%=rs.getString("package_photo")%>' width='150' height='150'></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("package_name")%></td>
            </tr>
            <tr>
                <td>Details</td>
                <td><%=rs.getString("package_details")%></td>
            </tr>
            <tr>
                <td>Days</td>
                <td><%=rs.getString("package_days")%></td>
            </tr>
            <tr>
                <td>District</td>
                <td><%=rs.getString("district_name")%></td>
            </tr>
            <tr>
                <td>Place</td>
                <td><%=rs.getString("place_name")%></td>    
            </tr>
            <tr>
                <td>Amount</td>
                <td><%=rs.getString("package_amount")%></td>
            </tr>
        </table>

        <%
            if (request.getParameter("btn_submit") != null) {
                String insQry = "insert into tbl_booking(booking_date,booking_fordate,user_id,booking_leadcount,booking_amount,package_id,booking_status,transportation_id)"
                        + "values(curdate(),'" + request.getParameter("fdate") + "','" + session.getAttribute("uid") + "','" + request.getParameter("bcount") + "','" + request.getParameter("bamount") + "','" + request.getParameter("id") + "',0,'" + request.getParameter("sel_type") + "')";
                if (con.executeCommand(insQry)) {
                    String selId = "select max(booking_id) as id from tbl_booking";
                    ResultSet rss = con.selectCommand(selId);
                    if (rss.next()) {
                        String id = rss.getString("id");
                        response.sendRedirect("Payment.jsp?id=" + id);
                    }
                }

            }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Booking Lead Count</td>
                    <td><input type="number" name="bcount" onkeyup="updateAmount(this.value)" onchange="updateAmount(this.value)"></td>
                </tr>
                <tr>
                    <td>Booking amount</td>
                    <td><input type="text" readonly=""  id="txt_amount" name="bamount"></td>
                </tr>
                <tr>
                    <td>For Date</td>
                    <td><input type="date" name="fdate"></td>
                </tr>
                <tr>
                    <td>Transportation</td>
                    <td>
                        <select name="sel_type" id ="sel_type">
                            <option value="">select Transportation</option>

                            <%
                                String DselQry = "select * from tbl_transportation t inner join tbl_transportationtype tt on tt.type_id=t.type_id where package_id='" + request.getParameter("id") + "'";
                                ResultSet rsd = con.selectCommand(DselQry);
                                while (rsd.next()) {
                            %>
                            <option value="<%=rsd.getString("type_id")%>"><%=rsd.getString("type_name")%></option>
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
        </form>
        <script>
            function updateAmount(count)
            {
                var amount = <%=rs.getString("package_amount")%>
                document.getElementById("txt_amount").value = amount * count;
            }
        </script>
    </body>
</html>
<%@include file="Foot.jsp" %>