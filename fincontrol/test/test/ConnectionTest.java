package test;

import database.ConexaoBD;
import java.sql.Connection;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;

public class ConnectionTest {

    Connection conexao = null;//testa a conexão

    @Test
    public void connectionTest() {
        assertNotEquals(conexao, ConexaoBD.getInstance().getConnection());
    }

}
