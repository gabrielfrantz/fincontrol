<!DOCTYPE html>
<html dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>Login</title>
        <!-- Custom CSS -->
        <link href="dist/css/style.min.css" rel="stylesheet">
        <link href="dist/css/glyphicon.css" rel="stylesheet">
        <link href="dist/css/sweetalert.min.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>

    <body>
        <%
            String chave = (String) session.getAttribute("Login");
            if (chave == null) {
        %>
        <div class="main-wrapper">
            <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
                <div class="auth-box bg-dark border-top border-secondary">
                    <div id="loginform">
                        <div class="text-center p-t-20 p-b-20">
                            <span class="db"><img src="assets/images/logo.png" alt="logo" /></span>
                        </div>
                        <!-- Form -->
                        <form class="form-horizontal m-t-20" id="loginform" action="validaLogin.jsp" method="POST">
                            <div class="row p-b-30">
                                <div class="col-12">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                        </div>
                                        <input type="text" class="form-control form-control-lg" name="nom_usuario" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required="">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                        </div>
                                        <input type="password" class="form-control form-control-lg" name="des_senha" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" required="">
                                    </div>
                                    <%
                                        String falha = (String) session.getAttribute("Falha");
                                        if (falha != null) {
                                    %>
                                    <div class="alert alert-danger" role="alert">
                                        <%=falha%>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="row border-top border-secondary">
                                <div class="col-12">
                                    <div class="form-group">
                                        <div class="p-t-20">
                                            <button class="btn btn-block btn-lg btn-success" type="submit">Login</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/libs/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
        <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    </body>
    <%
        } else {
            response.sendRedirect("main.jsp");
        }
    %>
</html>