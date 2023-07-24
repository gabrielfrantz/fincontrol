package test;

import database.ConexaoBD;
import database.UsuarioDB;
import entity.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserTest {

    UsuarioDB regra;
    Usuario u;

    @Before
    public void Start() {
        regra = new UsuarioDB();
        u = new Usuario();
        u.setCod_usuario("999999999");
        u.setNom_usuario("usertesté");
        u.setNom_identificacao("User Test");
        u.setDes_email("usertest@gmail.com");
        u.setDes_senha("1234");
    }

    @Test
    public void test1consultaTableUsuarioTest() {
        assertEquals(true, consultaTableUsuario());
    }

    @Test
    public void test2insertUsuarioTest() {
        assertEquals(true, regra.Inserir(u));
    }

    @Test
    public void test3consultaInsertUsuarioTest() {
        assertEquals(true, regra.ConsultaInserir(u));
    }

    @Test
    public void test4updateUsuarioTest() {
        u.setNom_usuario("usertest2");
        u.setNom_identificacao("User Test 2");
        u.setDes_email("usertest2@gmail.com");
        assertEquals(true, regra.Alterar(u));
    }

    @Test
    public void test5consultaUpdateUsuarioTest() {
        assertEquals(true, regra.ConsultaAlterar(u));
    }

    @Test
    public void test6deleteUsuarioTest() {
        assertEquals(true, regra.Excluir(u));
    }

    @Test
    public void test7consultaExclusaoLogicaUsuarioTest() {
        assertEquals(true, regra.ConsultaExclusaoLogica(u));
    }

    @Test
    public void test8clearUsuarioTest() {
        assertEquals(true, regra.ExcluirDefinitivo(u));
    }

    @Test
    public void test9consultaExclusaoDefinitivaUsuarioTest() {
        assertEquals(false, regra.ConsultaExclusaoDefinitiva(u));
    }

    public boolean consultaTableUsuario() {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'usuario'");
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
