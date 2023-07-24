<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page language="java"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.output.*"%>

<%
    File file;
    final int MAX_FILE_SIZE = 5000 * 1024;                 // Maior arquivo permitido
    final int MAX_MEMO_SIZE = 5000 * 1024;                 // Reseva de memoria para manter o arquivo
    final String OUT_FILE_DIR = "C:\\temp\\tempo";         // Diretório temporário

    //ServletContext context = pageContext.getServletContext();
    String filePath = "C:\\temp";//context.getInitParameter("file-upload");

    // Qual o tipo do form ???
    String contentType = request.getContentType();

    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MAX_MEMO_SIZE);
        factory.setRepository(new File(OUT_FILE_DIR));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(MAX_FILE_SIZE);

        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {

                    String fileName = fi.getName();
                    //String fieldName = fi.getFieldName();                    
                    //boolean isInMemory = fi.isInMemory();
                    //long sizeInBytes = fi.getSize();

                    if (fileName.lastIndexOf("\\") >= 0) { // o diretório termina em \
                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                        System.out.println(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        System.out.println(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }

                    fi.write(file);
                    out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            System.out.println(e);
        }
    } else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
    
    

    response.sendRedirect("visualizarUpload.jsp");
%>