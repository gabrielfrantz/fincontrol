<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page import="support.Utils"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload</title>
    <%
     Utils u = new Utils();
     out.print(u.importar());
    %>
    <style>
        .center {
            width: 700px;
            overflow: auto;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -350px;
            margin-top: -300px;
        }
    </style>
</head>

<html>
    <head>
        <title>Exemplo de Upload</title>
    </head>
    <body>
        <h1>Arquivo a ser upado:</h1>
        <form action = "processaupload.jsp" method = "POST" enctype = "multipart/form-data">
            <br/><input type = "file" name = "file" size = "50" />
            <br/><input type = "submit" value = "Upload File" />
        </form>
    </body>
</html>