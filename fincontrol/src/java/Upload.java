
import database.UsuarioDB;
import entity.Usuario;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

@WebServlet("/upload")
public class Upload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Upload() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        /*Obtem o caminho relatorio da pasta img*/
        String path = request.getServletContext().getRealPath("img") + File.separator;

        File files = new File(path);
        response.setContentType("image/jpeg");

        /*Mostra o arquivo que está na pasta img onde foi realizado o upload*/
        for (String file : files.list()) {
            if (file.equals(String.valueOf(session.getAttribute("cod_usuario")) + ".jpg")) {
                File f = new File(path + file);
                BufferedImage bi = ImageIO.read(f);
                OutputStream out = response.getOutputStream();
                ImageIO.write(bi, "jpg", out);
                out.close();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File file;
        final int MAX_FILE_SIZE = 5000 * 1024;                 // Maior arquivo permitido
        final int MAX_MEMO_SIZE = 5000 * 1024;                 // Reseva de memoria para manter o arquivo
        final String OUT_FILE_DIR = request.getServletContext().getRealPath("img");

        HttpSession session = request.getSession(false);
        ServletContext context = request.getServletContext();
        String filePath = context.getInitParameter("file-upload");
        // Qual o tipo do form ???
        String contentType = request.getContentType();
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(MAX_MEMO_SIZE);
            factory.setRepository(new File(OUT_FILE_DIR));
            UsuarioDB regra = new UsuarioDB();
            Usuario u = new Usuario();

            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(MAX_FILE_SIZE);

            try {
                List fileItems = upload.parseRequest(request);
                Iterator i = fileItems.iterator();
                while (i.hasNext()) {
                    // System.out.println("next");
                    FileItem fi = (FileItem) i.next();
                    // System.out.println("fildname: " + fi.getFieldName());
                    // System.out.println("name: " + fi.getName());
                    // System.out.println("string: " + fi.getString());
                    if (fi.getFieldName().equals("cod")) {
                        u.setCod_usuario(fi.getString());
                    }
                    if (fi.getFieldName().equals("nom_identificacao")) {
                        u.setNom_identificacao(fi.getString());
                    }
                    if (fi.getFieldName().equals("nom_usuario")) {
                        u.setNom_usuario(fi.getString());
                    }
                    if (fi.getFieldName().equals("des_email")) {
                        u.setDes_email(fi.getString());
                    }
                    if (!fi.isFormField()) {
                        String fileName = fi.getName();
                        if (!fileName.isEmpty()) {
                            //String fieldName = fi.getFieldName();                    
                            //boolean isInMemory = fi.isInMemory();
                            //long sizeInBytes = fi.getSize();

                            if (fileName.lastIndexOf("\\") >= 0) { // o diretório termina em \
                                file = new File(OUT_FILE_DIR + File.separator + session.getAttribute("cod_usuario") + ".jpg");
                                //System.out.println(OUT_FILE_DIR + File.separator + session.getAttribute("cod_usuario") + ".jpg");
                            } else {
                                file = new File(OUT_FILE_DIR + File.separator + session.getAttribute("cod_usuario") + ".jpg");
                                //System.out.println(OUT_FILE_DIR + File.separator + session.getAttribute("cod_usuario") + ".jpg");
                            }

                            fi.write(file);
                            request.setAttribute("message", "Arquivo carregado com sucesso");
                        }
                    }
                }
                regra.Alterar(u);
            } catch (Exception e) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + e);
            }
            request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
        }
        /*
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        //Identifica se o formulario é do tipo multipart/form-data
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                //Faz o parse do request
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                //Escreve a o arquivo na pasta img
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        item.write(new File(request.getServletContext().getRealPath("img") + File.separator + session.getAttribute("cod_usuario") + ".jpg"));
                    }
                }

                request.setAttribute("message", "Arquivo carregado com sucesso");
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
            }

        } else {
            request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }*/

    }

    public String getSrcImage(HttpServletRequest request) throws ServletException, IOException {
        byte[] fileContent = FileUtils.readFileToByteArray(new File(request.getServletContext().getRealPath("img") + File.separator + "default.jpg"));
        String encodedString = Base64.getEncoder().encodeToString(fileContent);
        String src = "data:image/jpeg;base64," + encodedString;
        try {
            HttpSession session = request.getSession(false);
            String filePath = request.getServletContext().getRealPath("img") + File.separator;
            File file = new File(filePath);
            File files[] = file.listFiles();
            int i = 0;
            for (int j = files.length; i < j; i++) {
                File arquivo = files[i];
                if (arquivo.getName().equals(session.getAttribute("cod_usuario") + ".jpg")) {

                    fileContent = FileUtils.readFileToByteArray(new File(filePath + "\\" + arquivo.getName()));
                    encodedString = Base64.getEncoder().encodeToString(fileContent);

                    src = "data:image/jpeg;base64," + encodedString;

                }
                System.out.println(arquivo.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return src;
    }
}
