<%-- 
    Document   : Viewpackagesearch
    Created on : 29 Feb, 2024, 11:57:42 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Package Search</title>
    </head>
    <body>
         <%
            String SelQry = "select * from tbl_package p inner join tbl_place s on p.place_id=s.place_id inner join tbl_district d on d.district_id=s.district_id ";
            ResultSet rs = con.selectCommand(SelQry);
            rs.next();


        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Photo</td>
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
            
    </body>
</html>
