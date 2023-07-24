<%@page import="java.sql.*" %>
<%@page import="database.UsuarioDB" %>
<%@page import="entity.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UsuarioDB regra = new UsuarioDB();
    System.out.println("ALTERAR SENHA");
    regra.AlterarSenha(String.valueOf(session.getAttribute("cod_usuario")), request.getParameter("senha_antiga"), request.getParameter("senha_nova"),
             request.getParameter("repetir_senha"));
    
    response.sendRedirect("editarPerfil.jsp");
%>
