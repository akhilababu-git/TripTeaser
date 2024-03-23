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
            String SelQry = "select * from tbl_package p inner join tbl_place s on p.place_id=s.place_id inner join tbl_district d on d.district_id=s.district_id where package_id='"+request.getParameter("id")+"'";
            ResultSet rs = con.selectCommand(SelQry);
            rs.next();


        %>

        <table border="1" align="center">
            <tr>
                <td>photo</td>
                <td><img src='../Assets/Files/Package/<%=rs.getString("package_photo")%>'width='150' height='150'></td>
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
                String insQry = "insert into tbl_booking(booking_date,booking_fordate,user_id,booking_leadcount,booking_amount,package_id,booking_status)"
                        + "values(curdate(),'" + request.getParameter("fdate") + "','" + session.getAttribute("uid") + "','" + request.getParameter("bcount") + "','" + request.getParameter("bamount") + "','" + request.getParameter("id") + "',0)";
//                out.println(insQry);
                con.executeCommand(insQry);
                response.sendRedirect("ViewMore.jsp?id="+request.getParameter("id"));
            }
        %>
    <form method="post">
        <table border="1" align="center">
            <tr>
                <td>Booking leadcount</td>
                <td><input type="text" name="bcount"></td>
            </tr>
            <tr>
                <td>Booking amount</td>
                <td><input type="text" name="bamount"></td>
            </tr>
            <tr>
                <td>For Date</td>
                <td><input type="date" name="fdate"></td>
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
