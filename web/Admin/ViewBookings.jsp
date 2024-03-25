

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
        <title>View Bookings</title>
        <%

            if (request.getParameter("aid") != null) {
                String upQry = "update tbl_booking set booking_status='3' where booking_id='" + request.getParameter("aid") + "'";
                if (con.executeCommand(upQry)) {
        %>
        <script>
            alert('Accepted');
            window.location = 'ViewBookings.jsp';
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            window.location = 'ViewBookings.jsp';
        </script>
        <%
                }
            }

            if (request.getParameter("rid") != null) {
                String upQry = "update tbl_booking set booking_status='2' where booking_id='" + request.getParameter("rid") + "'";
                if (con.executeCommand(upQry)) {
        %>
        <script>
            alert('Rejected');
            window.location = 'ViewBookings.jsp';
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            window.location = 'ViewBookings.jsp';
        </script>
        <%
                }
            }


        %>
    </head>
    <body>
        <h2>View Bookings</h2>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>Date</td>
                <td>Package</td>
                <td>Amount</td>
                <td>Status</td>
            </tr>
            <%                int i = 0;
                String SelQry = "select * from tbl_booking b inner join tbl_package p on p.package_id=b.package_id inner join tbl_transportationtype tt on tt.type_id=b.transportation_id inner join tbl_user u on u.user_id=b.user_id where booking_status>0";
                ResultSet rs = con.selectCommand(SelQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("package_name")%></td>
                <td><%=rs.getString("package_amount")%></td>
                <td><%
                    if (rs.getString("booking_status").equals("1")) {
                    %>
                    <a href="ViewBookings.jsp?aid=<%=rs.getString("booking_id")%>">Accept</a>/
                    <a href="ViewBookings.jsp?rid=<%=rs.getString("booking_id")%>">Reject</a>
                    <%
                    } else if (rs.getString("booking_status").equals("2")) {
                        out.println("Rejected");
                    } else if (rs.getString("booking_status").equals("3")) {
                    %>
                    <a href="tel:<%=rs.getString("user_contact")%>">Contact Now</a>
                    <%
                        }

                    %></td>
            </tr>

            <%                }
            %>
        </table>
    </body>
</html>
<%@include file="Foot.jsp" %>