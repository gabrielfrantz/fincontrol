package entity;

public class ContaCorrente {

    private String seq_conta;
    private String seq_banco;
    private String cod_agencia;
    private String num_cc;
    private String ind_tipo_cc;
    private String cod_usuario;

    public String getSeq_conta() {
        return seq_conta;
    }

    public void setSeq_conta(String seq_conta) {
        this.seq_conta = seq_conta;
    }

    public String getSeq_banco() {
        return seq_banco;
    }

    public void setSeq_banco(String seq_banco) {
        this.seq_banco = seq_banco;
    }

    public String getCod_agencia() {
        return cod_agencia;
    }

    public void setCod_agencia(String cod_agencia) {
        this.cod_agencia = cod_agencia;
    }

    public String getNum_cc() {
        return num_cc;
    }

    public void setNum_cc(String num_cc) {
        this.num_cc = num_cc;
    }

    public String getInd_tipo_cc() {
        return ind_tipo_cc;
    }

    public void setInd_tipo_cc(String ind_tipo_cc) {
        this.ind_tipo_cc = ind_tipo_cc;
    }

    public String getCod_usuario() {
        return cod_usuario;
    }

    public void setCod_usuario(String cod_usuario) {
        this.cod_usuario = cod_usuario;
    }

}
