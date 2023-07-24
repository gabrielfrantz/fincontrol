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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>Listagem</title>
        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="assets/extra-libs/multicheck/multicheck.css">
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="dist/css/style.min.css" rel="stylesheet">
        <link href="dist/css/glyphicon.css" rel="stylesheet">
        <script src="assets/libs/sweetalert/sweetalert.min.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>

    <style>    
        .cabecalho {
            text-align: center
        }
    </style>

    <body>
                <script type="text/javascript">
            function alert_it(numero) {
                Swal.fire({
                    title: 'Você tem certeza que deseja excluir esse registro?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Excluir',
                    cancelButtonText: 'Cancelar',
                    closeOnConfirm: false,
                    closeOnCancel: false
                }).then((result) => {
                    if (result.value) {
                        window.location.href = 'banco_DB.jsp?oper=E&seq='+numero;
                    }
                })
            }
        </script>
        
        <%
            Utils u = new Utils();
            out.print(u.menu(request));
        %>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Listagem de Bancos</h4>
                        <div class="ml-auto text-right">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"></h5>
                        <div class="table-responsive">
                            <table id="zero_config" class="table table-striped table-bordered">
                                <a href="cadastroBanco.jsp?oper=I&seq=0" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Novo</a> 
                                <thead>
                                    <tr>
                                        <th class="cabecalho">Código do Banco</th>
                                        <th class="cabecalho">Nome</th>
                                        <th class="cabecalho">Ações</th>
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
                                            <a href="cadastroBanco.jsp?oper=A&seq=<%=rs.getString("seq_banco")%>&cod_banco=<%=rs.getString("cod_banco")%>&nom_banco=<%=rs.getString("nom_banco")%>" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                                            <a class="btn btn-danger" href='javascript:;' onclick = "alert_it(<%=rs.getString("seq_banco")%>)"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>