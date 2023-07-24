package entity;

public class Usuario {
    
    private String cod_usuario;
    private String nom_usuario;
    private String nom_identificacao;
    private String des_email;
    private String des_senha;

    public String getCod_usuario() {
        return cod_usuario;
    }

    public void setCod_usuario(String cod_usuario) {
        this.cod_usuario = cod_usuario;
    }

    public String getNom_usuario() {
        return nom_usuario;
    }

    public void setNom_usuario(String nom_usuario) {
        this.nom_usuario = nom_usuario;
    }

    public String getNom_identificacao() {
        return nom_identificacao;
    }

    public void setNom_identificacao(String nom_identificacao) {
        this.nom_identificacao = nom_identificacao;
    }

    public String getDes_email() {
        return des_email;
    }

    public void setDes_email(String des_email) {
        this.des_email = des_email;
    }

    public String getDes_senha() {
        return des_senha;
    }

    public void setDes_senha(String des_senha) {
        this.des_senha = des_senha;
    }
    
}
