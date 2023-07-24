package support;

import java.io.File;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;

public class Utils {

    public String importar() {
        return ""
                + " <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\"\n"
                + "              integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n"
                + "        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>";
    }

    public String menu(HttpServletRequest request) {
        return "<script src=\"assets/libs/jquery/dist/jquery.min.js\"></script>\n"
                + "        <!-- Bootstrap tether Core JavaScript -->\n"
                + "        <script src=\"assets/libs/popper.js/dist/umd/popper.min.js\"></script>\n"
                + "        <script src=\"assets/libs/bootstrap/dist/js/bootstrap.min.js\"></script>\n"
                + "        <script src=\"assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js\"></script>\n"
                + "        <script src=\"assets/extra-libs/sparkline/sparkline.js\"></script>\n"
                + "        <!--Wave Effects -->\n"
                + "        <script src=\"dist/js/waves.js\"></script>\n"
                + "        <!--Menu sidebar -->\n"
                + "        <script src=\"dist/js/sidebarmenu.js\"></script>\n"
                + "        <!--Custom JavaScript -->\n"
                + "        <script src=\"dist/js/custom.min.js\"></script>\n"
                + "        <!--This page JavaScript -->\n"
                + "        <!-- <script src=\"dist/js/pages/dashboards/dashboard1.js\"></script> -->\n"
                + "        <!-- Charts js Files -->\n"
                + "        <script src=\"assets/libs/flot/excanvas.js\"></script>\n"
                + "        <script src=\"assets/libs/flot/jquery.flot.js\"></script>\n"
                + "        <script src=\"assets/libs/flot/jquery.flot.pie.js\"></script>\n"
                + "        <script src=\"assets/libs/flot/jquery.flot.time.js\"></script>\n"
                + "        <script src=\"assets/libs/flot/jquery.flot.stack.js\"></script>\n"
                + "        <script src=\"assets/libs/flot/jquery.flot.crosshair.js\"></script>\n"
                + "        <script src=\"assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js\"></script>\n"
                + "        <script src=\"dist/js/pages/chart/chart-page-init.js\"></script>\n"
                + "    <!-- This Page JS -->\n"
                + "    <script src=\"assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js\"></script>\n"
                + "    <script src=\"dist/js/pages/mask/mask.init.js\"></script>\n"
                + "    <script src=\"assets/libs/select2/dist/js/select2.full.min.js\"></script>\n"
                + "    <script src=\"assets/libs/select2/dist/js/select2.min.js\"></script>\n"
                + "    <script src=\"assets/libs/jquery-asColor/dist/jquery-asColor.min.js\"></script>\n"
                + "    <script src=\"assets/libs/jquery-asGradient/dist/jquery-asGradient.js\"></script>\n"
                + "    <script src=\"assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js\"></script>\n"
                + "    <script src=\"assets/libs/jquery-minicolors/jquery.minicolors.min.js\"></script>\n"
                + "    <script src=\"assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js\"></script>\n"
                + "    <script src=\"assets/libs/quill/dist/quill.min.js\"></script>"
                + "        <div id=\"main-wrapper\">\n"
                + "            <header class=\"topbar\" data-navbarbg=\"skin5\">\n"
                + "                <nav class=\"navbar top-navbar navbar-expand-md navbar-dark\">\n"
                + "                    <div class=\"navbar-header\" data-logobg=\"skin5\">\n"
                + "                        <a class=\"nav-toggler waves-effect waves-light d-block d-md-none\" href=\"javascript:void(0)\"><i class=\"ti-menu ti-close\"></i></a>\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <!-- Logo -->\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <a class=\"navbar-brand\" href=\"index.jsp\">\n"
                + "                            <!-- Logo icon -->\n"
                + "                            <b class=\"logo-icon p-l-10\">\n"
                + "                                <!--You can put here icon as well // <i class=\"wi wi-sunset\"></i> //-->\n"
                + "                                <!-- Dark Logo icon -->\n"
                + "                                <img src=\"assets/images/logo-icon.png\" alt=\"homepage\" class=\"light-logo\" />\n"
                + "\n"
                + "                            </b>\n"
                + "                            <!--End Logo icon -->\n"
                + "                            <!-- Logo text -->\n"
                + "                            <span class=\"logo-text\">\n"
                + "                                <!-- dark Logo text -->\n"
                + "                                <img src=\"assets/images/logo-text.png\" alt=\"homepage\" class=\"light-logo\" />\n"
                + "\n"
                + "                            </span>\n"
                + "                            <!-- Logo icon -->\n"
                + "                            <!-- <b class=\"logo-icon\"> -->\n"
                + "                            <!--You can put here icon as well // <i class=\"wi wi-sunset\"></i> //-->\n"
                + "                            <!-- Dark Logo icon -->\n"
                + "                            <!-- <img src=\"assets/images/logo-text.png\" alt=\"homepage\" class=\"light-logo\" /> -->\n"
                + "\n"
                + "                            <!-- </b> -->\n"
                + "                            <!--End Logo icon -->\n"
                + "                        </a>\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <!-- End Logo -->\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <!-- Toggle which is visible on mobile only -->\n"
                + "                        <!-- ============================================================== -->\n"
                + "                        <a class=\"topbartoggler d-block d-md-none waves-effect waves-light\" href=\"javascript:void(0)\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\"><i class=\"ti-more\"></i></a>\n"
                + "                    </div>\n"
                + "                    <!-- ============================================================== -->\n"
                + "                    <!-- End Logo -->\n"
                + "                    <!-- ============================================================== -->\n"
                + "                    <div class=\"navbar-collapse collapse\" id=\"navbarSupportedContent\" data-navbarbg=\"skin5\">\n"
                + "                        <ul class=\"navbar-nav float-left mr-auto\">\n"
                + "                            <li class=\"nav-item d-none d-md-block\"><a class=\"nav-link sidebartoggler waves-effect waves-light\" href=\"javascript:void(0)\" data-sidebartype=\"mini-sidebar\"><i class=\"mdi mdi-menu font-24\"></i></a></li>\n"
                + "                            <li class=\"nav-item search-box\"> <a class=\"nav-link waves-effect waves-dark\" href=\"javascript:void(0)\"><i class=\"ti-search\"></i></a>\n"
                + "                                <form class=\"app-search position-absolute\">\n"
                + "                                    <input type=\"text\" class=\"form-control\" placeholder=\"Search &amp; enter\"> <a class=\"srh-btn\"><i class=\"ti-close\"></i></a>\n"
                + "                                </form>\n"
                + "                            </li>\n"
                + "                        </ul>\n"
                + "                        <ul class=\"navbar-nav float-right\">\n"
                + "                            <li class=\"nav-item dropdown\">\n"
                + "                                <a class=\"nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic\" href=\"\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"><img src=\"" + getSrcImage(request) + "\" alt=\"user\" class=\"rounded-circle\" width=\"31\"></a>\n"
                + "                                <div class=\"dropdown-menu dropdown-menu-right user-dd animated\">\n"
                + "                                    <a class=\"dropdown-item\" href=\"editarPerfil.jsp\"><i class=\"ti-user m-r-5 m-l-5\"></i> Meu perfil</a>\n"
                + "                                    <div class=\"dropdown-divider\"></div>\n"
                + "                                    <a class=\"dropdown-item\" href=\"logout.jsp\"><i class=\"fa fa-power-off m-r-5 m-l-5\"></i> Logout</a>\n"
                + "                                    <div class=\"dropdown-divider\"></div>\n"
                + "                                </div>\n"
                + "                            </li>\n"
                + "                        </ul>\n"
                + "                    </div>\n"
                + "                </nav>\n"
                + "            </header>\n"
                + "            <aside class=\"left-sidebar\" data-sidebarbg=\"skin5\">\n"
                + "                <div class=\"scroll-sidebar\">\n"
                + "                    <nav class=\"sidebar-nav\">\n"
                + "                        <ul id=\"sidebarnav\" class=\"p-t-30\">\n"
                + "                            <li class=\"sidebar-item\"> <a class=\"sidebar-link has-arrow waves-effect waves-dark\" href=\"javascript:void(0)\" aria-expanded=\"false\"><i class=\"mdi mdi-receipt\"></i><span class=\"hide-menu\">Cadastros </span></a>\n"
                + "                                <ul aria-expanded=\"false\" class=\"collapse  first-level\">\n"
                + "                                    <li class=\"sidebar-item\"><a href=\"listaUsuario.jsp\" class=\"sidebar-link\"><i class=\"mdi mdi-note-outline\"></i><span class=\"hide-menu\"> Usuários </span></a></li>\n"
                + "                                    <li class=\"sidebar-item\"><a href=\"listaBanco.jsp\" class=\"sidebar-link\"><i class=\"mdi mdi-note-plus\"></i><span class=\"hide-menu\"> Bancos </span></a></li>\n"
                + "                                    <li class=\"sidebar-item\"><a href=\"listaConta.jsp\" class=\"sidebar-link\"><i class=\"mdi mdi-note-plus\"></i><span class=\"hide-menu\"> Contas </span></a></li>\n"
                + "                                </ul>\n"
                + "                            </li>\n"
                + "                        </ul>\n"
                + "                    </nav>\n"
                + "                </div>\n"
                + "            </aside>\n";
    }

    public String getImgPerfil(HttpServletRequest request) {
        return "<img src=\"" + getSrcImage(request) + "\" alt=\"user\" class=\"rounded-circle\" width=\"64\">";
    }

    public String getSrcImage(HttpServletRequest request) {
        String src = "";
        String filePath = request.getServletContext().getRealPath("img") + File.separator;
        File file = new File(filePath);
        HttpSession session = request.getSession(false);
        try {
            byte[] fileContent = FileUtils.readFileToByteArray(new File(request.getServletContext().getRealPath("img") + File.separator + "default.jpg"));
            String encodedString = Base64.getEncoder().encodeToString(fileContent);
            src = "data:image/jpg;base64," + encodedString;

            File files[] = file.listFiles();
            int i = 0;
            for (int j = files.length; i < j; i++) {
                File arquivo = files[i];
                if (arquivo.getName().equals(String.valueOf(session.getAttribute("cod_usuario")) + ".jpg")) {
                    fileContent = FileUtils.readFileToByteArray(new File(filePath + "\\" + arquivo.getName()));
                    encodedString = Base64.getEncoder().encodeToString(fileContent);

                    src = "data:image/jpg;base64," + encodedString;
                }
                System.out.println(arquivo.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return src;
    }
    
    

}
