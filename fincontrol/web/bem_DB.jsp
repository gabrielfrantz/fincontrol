<%@page import="java.sql.*" %>
<%@page import="database.BemDB" %>
<%@page import="entity.Bem" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BemDB regra = new BemDB();
    Bem b = new Bem();

    String oper = request.getParameter("oper");
    b.setCod_bem(request.getParameter("cod"));
    b.setNom_bem(request.getParameter("nom_bem"));
    b.setDes_bem(request.getParameter("des_bem"));
    b.setDes_discriminacao(request.getParameter("des_discriminacao"));
    b.setInd_tipo(request.getParameter("int_tipo"));
    b.setInd_fisico(request.getParameter("ind_fisico"));
    //b.setDta_aquisicao(request.getParameter("dta_aquisicao")); formatar data

    if (oper.equals("A")) {
        regra.Alterar(b);
    } else if (oper.equals("I")) {
        regra.Inserir(b);
    } else if (oper.equals("E")) {
        regra.Excluir(b);
    }

    response.sendRedirect("listaBem.jsp");
%>