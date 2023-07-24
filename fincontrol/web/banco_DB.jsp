<%@page import="java.sql.*" %>
<%@page import="database.BancoDB" %>
<%@page import="entity.Banco" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDB regra = new BancoDB();
    Banco b = new Banco();

    String oper = request.getParameter("oper");
    b.setSeq_banco(request.getParameter("seq"));
    b.setNom_banco(request.getParameter("nom_banco"));
    b.setCod_banco(request.getParameter("cod_banco"));

    if (oper.equals("A")) {
        regra.Alterar(b);
    } else if (oper.equals("I")) {
        regra.Inserir(b);
    } else if (oper.equals("E")) {
        regra.Excluir(b);
    }

    response.sendRedirect("listaBanco.jsp");
%>
