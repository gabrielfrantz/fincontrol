package test;

import database.BancoDB;
import database.ConexaoBD;
import entity.Banco;
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
public class BancoTest {

    BancoDB regra;
    Banco b;

    @Before
    public void start() {
        regra = new BancoDB();
        b = new Banco();
        b.setSeq_banco("999999999");
        b.setCod_banco("999");
        b.setNom_banco("TESTE - NÃO UTILIZAR");
    }

    @Test
    public void test1consultaTableBancoTest() {
        assertEquals(true, consultaTableBanco());
    }

    @Test
    public void test2insertBancoTest() {
        assertEquals(true, regra.Inserir(b));
    }

    @Test
    public void test3consultaInsertBancoTest() {
        assertEquals(true, regra.ConsultaInserir(b));
    }

    @Test
    public void test4updateBancoTest() {
        b.setCod_banco("789");
        b.setNom_banco("TESTE 2 - NÃO UTILIZAR");
        assertEquals(true, regra.Alterar(b));
    }

    @Test
    public void test5consultaUpdateBancoTest() {
        assertEquals(true, regra.ConsultaAlterar(b));
    }

    @Test
    public void test6deleteBancoTest() {
        assertEquals(true, regra.Excluir(b));
    }

    @Test
    public void test7consultaExclusaoLogicaBancoTest() {
        assertEquals(true, regra.ConsultaExclusaoLogica(b));
    }

    @Test
    public void test8clearBancoTest() {
        assertEquals(true, regra.ExcluirDefinitivo(b));
    }

    @Test
    public void test9consultaExclusaoDefinitivaBancoTest() {
        assertEquals(false, regra.ConsultaExclusaoDefinitiva(b));
    }

    public boolean consultaTableBanco() {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'banco'");
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
