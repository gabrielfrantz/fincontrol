package entity;

import java.sql.Date;

public class Bem {
    
    private String cod_bem;
    private String nom_bem;
    private String des_bem;
    private String des_discriminacao;
    private String ind_tipo;
    private String ind_fisico;
    private Date dta_aquisicao;

    public String getCod_bem() {
        return cod_bem;
    }

    public void setCod_bem(String cod_bem) {
        this.cod_bem = cod_bem;
    }

    public String getNom_bem() {
        return nom_bem;
    }

    public void setNom_bem(String nom_bem) {
        this.nom_bem = nom_bem;
    }

    public String getDes_bem() {
        return des_bem;
    }

    public void setDes_bem(String des_bem) {
        this.des_bem = des_bem;
    }

    public String getDes_discriminacao() {
        return des_discriminacao;
    }

    public void setDes_discriminacao(String des_discriminacao) {
        this.des_discriminacao = des_discriminacao;
    }

    public String getInd_tipo() {
        return ind_tipo;
    }

    public void setInd_tipo(String ind_tipo) {
        this.ind_tipo = ind_tipo;
    }

    public String getInd_fisico() {
        return ind_fisico;
    }

    public void setInd_fisico(String ind_fisico) {
        this.ind_fisico = ind_fisico;
    }

    public Date getDta_aquisicao() {
        return dta_aquisicao;
    }

    public void setDta_aquisicao(Date dta_aquisicao) {
        this.dta_aquisicao = dta_aquisicao;
    }
    
    
}
