<%-- 
    Document   : uploadImgPerfil
    Created on : 09/04/2020, 10:30:46
    Author     : rafaelsiebeneichler
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.ConexaoBD"%>
<%@page import="support.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>Editar Perfil - FinControl</title>
        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="assets/libs/select2/dist/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/libs/jquery-minicolors/jquery.minicolors.css">
        <link rel="stylesheet" type="text/css" href="assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/libs/quill/dist/quill.snow.css">
        <link href="dist/css/style.min.css" rel="stylesheet">
        <link href="dist/css/glyphicon.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
        <%
            String cod = String.valueOf(session.getAttribute("cod_usuario"));
            String nome = "";
            String iden = "";
            String email = "";
            System.out.println("cod user: " + cod);
            ConexaoBD conexao = new ConexaoBD();
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE cod_usuario = " + cod);
            if (rs.next()) {
                nome = rs.getString("nom_usuario");
                iden = rs.getString("nom_identificacao");
                email = rs.getString("des_email");
            }
            System.out.println("nome: " + nome);
            System.out.println("iden: " + iden);
            System.out.println("email: " + email);

            Utils u = new Utils();
            out.print(u.menu(request));%>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Editar Perfil</h4>
                        <div class="ml-auto text-right">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">                
                <div class="row">                    
                    <div class="col-md-6">
                        <div class="card">
                            <form action="upload" method="post" enctype="multipart/form-data" class="form-horizontal m-t-20">
                                <input type="hidden" name="cod" value="<%=cod%>" />
                                <div class="card-body">
                                    <h5 class="card-title">Dados:</h5>
                                    <div class="form-group row">                                        
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Foto: </label>
                                        <div class="col-sm-9">
                                            <%out.write(u.getImgPerfil(request));%>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="file" name="file" id="file"/> 
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Usuário: </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="nom_usuario" value="<%=nome%>" placeholder="Username"  aria-label="Username"  aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Nome: </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="nom_identificacao" value="<%=iden%>" placeholder="Nome" aria-label="Nome" aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">E-mail: </label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" name="des_email" value="<%=email%>" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1"  required="required">
                                        </div>
                                    </div>

                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button class="btn btn-success" type="submit">Salvar</button>
                                        <a href ="index.jsp" class="btn btn-danger">Cancelar</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="card">
                            <form class="form-horizontal m-t-20" action="alterasenha_DB.jsp">
                                <div class="card-body">
                                    <h5 class="card-title">Alterar senha:</h5>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Senha antiga:</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="senha_antiga" placeholder="Senha antiga"  aria-label="Senha antiga"  aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Nova senha:</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="senha_nova" placeholder="Nova senha"  aria-label="Nova senha"  aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Repetir senha:</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="repetir_senha" placeholder="Repetir senha"  aria-label="Repetir senha"  aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button class="btn btn-success" type="submit">Alterar</button>                                      
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            
        </div>
    </div>
</body>
</html>
