package database;

import entity.Bem;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BemDB {

    public boolean Inserir(Bem b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            if (b.getCod_bem().equals("0")) {
                ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(cod_bem), 0) + 1 cod FROM bem");
                if (rs.next()) {
                    b.setCod_bem(rs.getString("cod"));
                } else {
                    b.setCod_bem("1");
                }
            }
            st.execute("INSERT INTO usuario (cod_bem,nom_bem,des_bem,des_discriminacao,ind_tipo,ind_fisico,dta_aquisicao,cod_usuario) "
                    + " VALUES (" + b.getCod_bem() + ",'" + b.getNom_bem() + "','" + b.getDes_bem() + "','" + b.getDes_discriminacao() + "','" + b.getInd_tipo() + "','" + b.getInd_fisico() + "','" + b.getDta_aquisicao() + "',1)");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Alterar(Bem b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("UPDATE bem "
                    + " SET nom_bem='" + b.getNom_bem() + "',des_bem='" + b.getDes_bem() + "',des_discriminacao='" + b.getDes_discriminacao() + "',ind_tipo=" + b.getInd_tipo() + ",ind_fisico=" + b.getInd_fisico() + ",dta_aquisicao=" + b.getDta_aquisicao()
                    + " WHERE cod_bem=" + b.getCod_bem() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Excluir(Bem b) {
        return ExclusaoLogica(b);
    }

    private boolean ExclusaoLogica(Bem b) { // ver se vai ter o atributo "ind_ativo"
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("UPDATE bem SET ind_ativo ='N' WHERE cod_bem=" + b.getCod_bem() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean ExcluirDefinitivo(Bem b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("DELETE FROM bem WHERE cod_bem=" + b.getCod_bem() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
