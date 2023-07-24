package test;

import database.ConexaoBD;
import database.ContaCorrenteDB;
import entity.ContaCorrente;
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
public class ContaCorrenteTest {

    ContaCorrenteDB regra;
    ContaCorrente cc;

    @Before
    public void start() {
        regra = new ContaCorrenteDB();
        cc = new ContaCorrente();
        cc.setSeq_conta("999999999");
        cc.setSeq_banco("1");
        cc.setCod_usuario("3");
        cc.setCod_agencia("879");
        cc.setNum_cc("87940564X");
        cc.setInd_tipo_cc("1");
    }

    @Test
    public void test1consultaTableContaCorrenteTest() {
        assertEquals(true, consultaTableContaCorrente());
    }

    @Test
    public void test2consultaTableTipoContaTest() {
        assertEquals(true, consultaTableTipoConta());
    }

    @Test
    public void test3insertContaCorrenteTest() {
        assertEquals(true, regra.Inserir(cc));
    }

    @Test
    public void test4consultaInsertContaCorrenteTest() {
        assertEquals(true, regra.ConsultaInserir(cc));
    }

    @Test
    public void test5updateContaCorrenteTest() {
        cc.setCod_agencia("6701");
        cc.setNum_cc("046413201X");
        cc.setInd_tipo_cc("2");
        assertEquals(true, regra.Alterar(cc));
    }

    @Test
    public void test6consultaUpdateContaCorrenteTest() {
        assertEquals(true, regra.ConsultaAlterar(cc));
    }

    @Test
    public void test7deleteContaCorrenteTest() {
        assertEquals(true, regra.Excluir(cc));
    }

    @Test
    public void test8consultaExclusaoLogicaContaCorrenteTest() {
        assertEquals(true, regra.ConsultaExclusaoLogica(cc));
    }

    @Test
    public void test9clearContaCorrenteTest() {
        assertEquals(true, regra.ExcluirDefinitivo(cc));
    }

    @Test
    public void test10consultaExclusaoDefinitivaContaCorrenteTest() {
        assertEquals(false, regra.ConsultaExclusaoDefinitiva(cc));
    }

    public boolean consultaTableContaCorrente() {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'conta_corrente'");
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

    public boolean consultaTableTipoConta() {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            ResultSet rs = st.executeQuery("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'tipo_conta'");
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
