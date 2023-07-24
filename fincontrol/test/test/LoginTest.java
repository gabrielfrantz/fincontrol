package test;

import database.ConexaoBD;
import database.UsuarioDB;
import entity.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LoginTest {

    UsuarioDB regra;
    Usuario u;

    @Before
    public void Start() {
        u = new Usuario();
        u.setCod_usuario("1");
        u.setNom_usuario("Administrador");
        u.setDes_email("admin@gmail.com");
        u.setDes_senha("123");
    }

    @Test
    public void consultaLoginUsuarioTest() {
        assertEquals(true, ConsultaLogin(u));
    }

    public boolean ConsultaLogin(Usuario u) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE (nom_usuario='" + u.getNom_usuario() + "' OR des_email='" + u.getDes_email() +"') AND des_senha=md5('" + u.getDes_senha() + "') AND ind_ativo = 'S'");
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
