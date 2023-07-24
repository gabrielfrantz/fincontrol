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
        <title>Cadastro</title>
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
            Utils u = new Utils();
            out.print(u.menu(request));
        %>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title"></h4>
                        <div class="ml-auto text-right">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <form class="form-horizontal m-t-20" action="conta_DB.jsp">
                                <input type="hidden" name="oper" value="<%=request.getParameter("oper")%>" />
                                <input type="hidden" name="seq" value="<%=request.getParameter("seq")%>" />
                                <div class="card-body">
                                    <h5 class="card-title">Cadastro de Contas</h5>
                                    <div class="form-group row">
                                        <label class="col-sm-3 text-right control-label col-form-label">Banco: </label>
                                        <div class="col-sm-9">
                                            <select id="seq_banco" name="seq_banco" class="select2 form-control m-t-15" style="height: 36px;width: 100%;">
                                                <%
                                                    ConexaoBD conexao = new ConexaoBD();
                                                    Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                                                    ResultSet rs = st.executeQuery("SELECT * FROM banco WHERE ind_ativo = 'S'");
                                                    while (rs.next()) {
                                                        if (rs.getString("seq_banco").equals(request.getParameter("banco"))) {
                                                %>
                                                <option selected value="<%=rs.getString("seq_banco")%>"><%=rs.getString("nom_banco")%></option>
                                                <% } else {%>
                                                <option value="<%=rs.getString("seq_banco")%>"><%=rs.getString("nom_banco")%></option>
                                                <%       }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">Ag�ncia: </label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" name="cod_agencia" value="<%=request.getParameter("cod_agencia") != null ? request.getParameter("cod_agencia") : ""%>" placeholder="Ag�ncia" aria-label="Ag�ncia" aria-describedby="basic-addon1" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">N�mero da Conta: </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="num_cc" value="<%=request.getParameter("num_cc") != null ? request.getParameter("num_cc") : ""%>" placeholder="N�mero da Conta" aria-label="N�mero da Conta" aria-describedby="basic-addon1"  required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 text-right control-label col-form-label">Tipo da Conta: </label>
                                        <div class="col-sm-9">
                                            <select id="ind_tipo_cc" name="ind_tipo_cc" class="select2 form-control m-t-15" style="height: 36px;width: 100%;">
                                                <%
                                                    rs = st.executeQuery("SELECT * FROM tipo_conta WHERE ind_ativo = 'S'");
                                                    while (rs.next()) {
                                                        if (rs.getString("seq_tipo").equals(request.getParameter("tipo"))) {
                                                %>
                                                <option selected value="<%=rs.getString("seq_tipo")%>"><%=rs.getString("des_tipo")%></option>
                                                <% } else {%>
                                                <option value="<%=rs.getString("seq_tipo")%>"><%=rs.getString("des_tipo")%></option>
                                                <%       }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button class="btn btn-success" type="submit">Salvar</button>
                                        <a href ="listaConta.jsp" class="btn btn-danger">Cancelar</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!--<div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Form Elements</h5>
                                <div class="form-group row">
                                    <label class="col-md-3 m-t-15">Single Select</label>
                                    <div class="col-md-9">
                                        <select class="select2 form-control custom-select" style="width: 100%; height:36px;">
                                            <option>Select</option>
                                            <optgroup label="Alaskan/Hawaiian Time Zone">
                                                <option value="AK">Alaska</option>
                                                <option value="HI">Hawaii</option>
                                            </optgroup>
                                            <optgroup label="Pacific Time Zone">
                                                <option value="CA">California</option>
                                                <option value="NV">Nevada</option>
                                                <option value="OR">Oregon</option>
                                                <option value="WA">Washington</option>
                                            </optgroup>
                                            <optgroup label="Mountain Time Zone">
                                                <option value="AZ">Arizona</option>
                                                <option value="CO">Colorado</option>
                                                <option value="ID">Idaho</option>
                                                <option value="MT">Montana</option>
                                                <option value="NE">Nebraska</option>
                                                <option value="NM">New Mexico</option>
                                                <option value="ND">North Dakota</option>
                                                <option value="UT">Utah</option>
                                                <option value="WY">Wyoming</option>
                                            </optgroup>
                                            <optgroup label="Central Time Zone">
                                                <option value="AL">Alabama</option>
                                                <option value="AR">Arkansas</option>
                                                <option value="IL">Illinois</option>
                                                <option value="IA">Iowa</option>
                                                <option value="KS">Kansas</option>
                                                <option value="KY">Kentucky</option>
                                                <option value="LA">Louisiana</option>
                                                <option value="MN">Minnesota</option>
                                                <option value="MS">Mississippi</option>
                                                <option value="MO">Missouri</option>
                                                <option value="OK">Oklahoma</option>
                                                <option value="SD">South Dakota</option>
                                                <option value="TX">Texas</option>
                                                <option value="TN">Tennessee</option>
                                                <option value="WI">Wisconsin</option>
                                            </optgroup>
                                            <optgroup label="Eastern Time Zone">
                                                <option value="CT">Connecticut</option>
                                                <option value="DE">Delaware</option>
                                                <option value="FL">Florida</option>
                                                <option value="GA">Georgia</option>
                                                <option value="IN">Indiana</option>
                                                <option value="ME">Maine</option>
                                                <option value="MD">Maryland</option>
                                                <option value="MA">Massachusetts</option>
                                                <option value="MI">Michigan</option>
                                                <option value="NH">New Hampshire</option>
                                                <option value="NJ">New Jersey</option>
                                                <option value="NY">New York</option>
                                                <option value="NC">North Carolina</option>
                                                <option value="OH">Ohio</option>
                                                <option value="PA">Pennsylvania</option>
                                                <option value="RI">Rhode Island</option>
                                                <option value="SC">South Carolina</option>
                                                <option value="VT">Vermont</option>
                                                <option value="VA">Virginia</option>
                                                <option value="WV">West Virginia</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 m-t-15">Multiple Select</label>
                                    <div class="col-md-9">
                                        <select class="select2 form-control m-t-15" multiple="multiple" style="height: 36px;width: 100%;">
                                            <optgroup label="Alaskan/Hawaiian Time Zone">
                                                <option value="AK">Alaska</option>
                                                <option value="HI">Hawaii</option>
                                            </optgroup>
                                            <optgroup label="Pacific Time Zone">
                                                <option value="CA">California</option>
                                                <option value="NV">Nevada</option>
                                                <option value="OR">Oregon</option>
                                                <option value="WA">Washington</option>
                                            </optgroup>
                                            <optgroup label="Mountain Time Zone">
                                                <option value="AZ">Arizona</option>
                                                <option value="CO">Colorado</option>
                                                <option value="ID">Idaho</option>
                                                <option value="MT">Montana</option>
                                                <option value="NE">Nebraska</option>
                                                <option value="NM" selected>New Mexico</option>
                                                <option value="ND">North Dakota</option>
                                                <option value="UT">Utah</option>
                                                <option value="WY">Wyoming</option>
                                            </optgroup>
                                            <optgroup label="Central Time Zone">
                                                <option value="AL">Alabama</option>
                                                <option value="AR">Arkansas</option>
                                                <option value="IL">Illinois</option>
                                                <option value="IA">Iowa</option>
                                                <option value="KS">Kansas</option>
                                                <option value="KY">Kentucky</option>
                                                <option value="LA">Louisiana</option>
                                                <option value="MN">Minnesota</option>
                                                <option value="MS">Mississippi</option>
                                                <option value="MO">Missouri</option>
                                                <option value="OK">Oklahoma</option>
                                                <option value="SD" selected>South Dakota</option>
                                                <option value="TX">Texas</option>
                                                <option value="TN">Tennessee</option>
                                                <option value="WI">Wisconsin</option>
                                            </optgroup>
                                            <optgroup label="Eastern Time Zone">
                                                <option value="CT">Connecticut</option>
                                                <option value="DE">Delaware</option>
                                                <option value="FL">Florida</option>
                                                <option value="GA">Georgia</option>
                                                <option value="IN">Indiana</option>
                                                <option value="ME">Maine</option>
                                                <option value="MD">Maryland</option>
                                                <option value="MA">Massachusetts</option>
                                                <option value="MI">Michigan</option>
                                                <option value="NH">New Hampshire</option>
                                                <option value="NJ">New Jersey</option>
                                                <option value="NY">New York</option>
                                                <option value="NC">North Carolina</option>
                                                <option value="OH">Ohio</option>
                                                <option value="PA">Pennsylvania</option>
                                                <option value="RI">Rhode Island</option>
                                                <option value="SC">South Carolina</option>
                                                <option value="VT">Vermont</option>
                                                <option value="VA">Virginia</option>
                                                <option value="WV">West Virginia</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Radio Buttons</label>
                                    <div class="col-md-9">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="customControlValidation1" name="radio-stacked" required>
                                            <label class="custom-control-label" for="customControlValidation1">First One</label>
                                        </div>
                                         <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
                                            <label class="custom-control-label" for="customControlValidation2">Second One</label>
                                        </div>
                                         <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
                                            <label class="custom-control-label" for="customControlValidation3">Third One</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">Checkboxes</label>
                                    <div class="col-md-9">
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing1">
                                            <label class="custom-control-label" for="customControlAutosizing1">First One</label>
                                        </div>
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing2">
                                            <label class="custom-control-label" for="customControlAutosizing2">Second One</label>
                                        </div>
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing3">
                                            <label class="custom-control-label" for="customControlAutosizing3">Third One</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3">File Upload</label>
                                    <div class="col-md-9">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="validatedCustomFile" required>
                                            <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                                            <div class="invalid-feedback">Example invalid custom file feedback</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3" for="disabledTextInput">Disabled input</label>
                                    <div class="col-md-9">
                                        <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="border-top">
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>-->
                        <!--<div class="col-md-6">
                        <!--<div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">Form Elements</h5>
                                <div class="form-group m-t-20">
                                    <label>Date Mask <small class="text-muted">dd/mm/yyyy</small></label>
                                    <input type="text" class="form-control date-inputmask" id="date-mask" placeholder="Enter Date">
                                </div>
                                <div class="form-group">
                                    <label>Phone <small class="text-muted">(999) 999-9999</small></label>
                                    <input type="text" class="form-control phone-inputmask" id="phone-mask" placeholder="Enter Phone Number">
                                </div>
                                <div class="form-group">
                                    <label>International Number <small class="text-muted">+19 999 999 999</small></label>
                                    <input type="text" class="form-control international-inputmask" id="international-mask" placeholder="International Phone Number">
                                </div>
                                <div class="form-group">
                                    <label>Phone / xEx <small class="text-muted">(999) 999-9999 / x999999</small></label>
                                    <input type="text" class="form-control xphone-inputmask" id="xphone-mask" placeholder="Enter Phone Number">
                                </div>
                                <div class="form-group">
                                    <label>Purchase Order <small class="text-muted">aaaa 9999-****</small></label>
                                    <input type="text" class="form-control purchase-inputmask" id="purchase-mask" placeholder="Enter Purchase Order">
                                </div>
                            </div>
                        </div>-->
                        <!--<div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Form Elements</h5>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span>Tooltip Input</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <input type="text" data-toggle="tooltip" title="A Tooltip for the input !" class="form-control" id="validationDefault05" placeholder="Hover For tooltip" required>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span>Type Ahead Input</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <input type="text" class="form-control" placeholder="Type here for auto complete.." required>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span>Prepended Input</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">#</span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Prepend" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span>Appended Input</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="5.000" aria-label="Recipient 's username" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2">$</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span class="text-success">Input with Sccess</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <input type="text" class="form-control is-valid" id="validationServer01">
                                        <div class="valid-feedback">
                                            Woohoo!
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <div class="col-lg-4 col-md-12 text-right">
                                        <span class="text-danger">Input with Error</span>
                                    </div>
                                    <div class="col-lg-8 col-md-12">
                                        <input type="text" class="form-control is-invalid" id="validationServer01">
                                        <div class="invalid-feedback">
                                            Please correct the error
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>