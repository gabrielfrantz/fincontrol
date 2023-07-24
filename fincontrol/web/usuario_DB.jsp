<%@page import="java.sql.*" %>
<%@page import="database.UsuarioDB" %>
<%@page import="entity.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    UsuarioDB regra = new UsuarioDB();
    Usuario u = new Usuario();

    String oper = request.getParameter("oper");
    u.setCod_usuario(request.getParameter("cod"));
    u.setNom_usuario(request.getParameter("nom_usuario"));
    u.setNom_identificacao(request.getParameter("nom_identificacao"));
    u.setDes_email(request.getParameter("des_email"));
    u.setDes_senha(request.getParameter("des_senha"));

    if (oper.equals("A")) {
        regra.Alterar(u);
    } else if (oper.equals("I")) {
        regra.Inserir(u);
    } else if (oper.equals("E")) {
        regra.Excluir(u);
    }

    response.sendRedirect("listaUsuario.jsp");
%>
