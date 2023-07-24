<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConexaoBD conexao = new ConexaoBD();
  
    Statement st = ConexaoBD.getInstance().getConnection().createStatement();

    String login = request.getParameter("nom_usuario");
    String senha = request.getParameter("des_senha");

    ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE nom_usuario = '" + login + "' AND des_senha = MD5('" + senha + "') AND ind_ativo = 'S'");
    if (rs.next()) {
        session.setAttribute("cod_usuario", rs.getString("cod_usuario"));
        session.setAttribute("Login", login);
        response.sendRedirect("main.jsp");
    } else {
        session.setAttribute("cod_usuario", "0");
        session.setAttribute("Login", null);
        session.setAttribute("Falha", "Usuário e/ou senha inválidos. Verifique!");
        response.sendRedirect("index.jsp");
    }
%>
