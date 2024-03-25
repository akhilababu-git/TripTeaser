
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    if (request.getParameter("btn_login") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_password");
        String selQry = "select * from tbl_user where user_email='" + email + "'and user_password='" + password + "'";

        String selQry1 = "select * from tbl_admin where admin_email='" + email + "'and admin_password='" + password + "'";
        ResultSet rs1 = con.selectCommand(selQry1);

        ResultSet rs = con.selectCommand(selQry);
        if (rs.next()) {
            session.setAttribute("uid", rs.getString("user_id"));
            session.setAttribute("uname", rs.getString("user_name"));
            response.sendRedirect("../User/Homepage.jsp");
        } else if (rs1.next()) {
            session.setAttribute("aid", rs1.getString("admin_id"));
            session.setAttribute("aname", rs1.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } else {
%>
<script>
    alert("invalid user");
</script>
<%
        }
    }
%>

<html>
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../Assets/Template/login/css/style.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(../Assets/Template/login/images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <form class="signin-form" method="post">
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" required name="txt_email">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password" required name="txt_password">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="btn_login" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="../Assets/Template/login/js/jquery.min.js"></script>
        <script src="../Assets/Template/login/js/popper.js"></script>
        <script src="../Assets/Template/login/js/bootstrap.min.js"></script>
        <script src="../Assets/Template/login/js/main.js"></script>

    </body>
</html>

