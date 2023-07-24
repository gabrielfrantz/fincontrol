<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("Login");
    session.removeAttribute("Falha");

    response.sendRedirect("index.jsp");
%>
