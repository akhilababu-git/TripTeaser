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
    </head>
    <body>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>Date</td>
                <td>Package</td>
                <td>Amount</td>
                <td>Status</td>
            </tr>
            <%
                int i = 0;
                String SelQry = "select * from tbl_booking b inner join tbl_package p on p.package_id=b.package_id inner join tbl_transportationtype tt on tt.type_id=b.transportation_id where user_id='" + session.getAttribute("uid") + "' and booking_status>0";
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
                        out.println("Payment Completed Waiting for Response");
                    } else if (rs.getString("booking_status").equals("2")) {
                        out.println("Request Canceled Amount will credit to your account in 4-5 working days");
                    } else if (rs.getString("booking_status").equals("3")) {
                        out.println("Request Accepetd Out Staff will contact you");
                    }

                    %></td>
            </tr>

            <%                }
            %>
        </table>
    </body>
</html>
<%@include file="Foot.jsp" %>




