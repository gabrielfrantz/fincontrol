<%@page import="support.Utils"%>
<%@page import="java.sql.*"%>
<%@page import="database.*"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>Matrix Template - The Ultimate Multipurpose admin template</title>
        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="assets/extra-libs/multicheck/multicheck.css">
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
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
            Utils u = new Utils();
            out.print(u.menu(request));
        %>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Tabela Teste</h4>
                        <div class="ml-auto text-right">
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"></h5>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered">
                                        <a href="cadastroBanco.jsp?oper=I&seq=0" class="btn btn-success">Novo</a><br><br>
                                        <thead>
                                            <tr>
                                                <th class="cabecalho">Código do Banco</th>
                                                <th class="cabecalho">Nome</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <%
                                            ConexaoBD conexao = new ConexaoBD();
                                            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                                            ResultSet rs = st.executeQuery("SELECT * FROM banco WHERE ind_ativo = 'S' ORDER BY cod_banco");
                                            while (rs.next()) {
                                        %>
                                        <tbody>
                                            <tr>
                                                <td align="center"><%=rs.getString("cod_banco")%></td>
                                                <td align="center"><%=rs.getString("nom_banco")%></td>
                                                <td align="center">
                                                    <a href="cadastroBanco.jsp?oper=A&seq=<%=rs.getString("seq_banco")%>&cod_banco=<%=rs.getString("cod_banco")%>&nom_banco=<%=rs.getString("nom_banco")%>" class="btn btn-warning">Editar</a>
                                                </td>
                                                <td align="center">
                                                    <a href="banco_DB.jsp?oper=E&seq=<%=rs.getString("seq_banco")%>" class="btn btn-danger">Excluir</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <%
                                            }
                                        %>
                                        <tfoot>
                                            <tr>
                                                <th class="cabecalho">Código do Banco</th>
                                                <th class="cabecalho">Nome</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>