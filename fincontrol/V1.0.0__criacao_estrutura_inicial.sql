DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS movimentacao;
DROP TABLE IF EXISTS precificacao;
DROP TABLE IF EXISTS taxa_moeda;
DROP TABLE IF EXISTS renda;
DROP TABLE IF EXISTS despesa;
DROP TABLE IF EXISTS tipo_periodo;
DROP TABLE IF EXISTS moeda;
DROP TABLE IF EXISTS conta_corrente;
DROP TABLE IF EXISTS banco;
DROP TABLE IF EXISTS bem;

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  cod_usuario SERIAL NOT NULL,
  nom_usuario VARCHAR(45) NOT NULL,
  nom_identificacao VARCHAR(45) NOT NULL,
  des_senha VARCHAR(45) NOT NULL,
  ind_ativo CHAR(1) NOT NULL DEFAULT 'S',
  des_email VARCHAR(60),
  PRIMARY KEY (cod_usuario));

-- -----------------------------------------------------
-- Table bem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bem (
  cod_bem SERIAL NOT NULL,
  nom_bem VARCHAR(45) NOT NULL,
  des_bem VARCHAR(45) NOT NULL,
  ind_tipo CHAR(1) NOT NULL,
  ind_fisico CHAR(1) NOT NULL,
  des_discriminacao VARCHAR(500) NULL,
  dta_aquisicao DATE NULL,
  cod_usuario INT NOT NULL, 
  PRIMARY KEY (cod_bem),
  CONSTRAINT fk_bem_usuario
  FOREIGN KEY (cod_usuario)
  REFERENCES usuario (cod_usuario));

-- -----------------------------------------------------
-- Table moeda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS moeda (
  cod_moeda SERIAL NOT NULL,
  nom_moeda VARCHAR(10) NOT NULL,
  des_moeda VARCHAR(45) NOT NULL,
  ind_ativo CHAR(1) NOT NULL,
  PRIMARY KEY (cod_moeda));

-- -----------------------------------------------------
-- Table movimentacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS movimentacao (
  seq_mvto SERIAL NOT NULL,
  cod_bem INT NULL,
  des_discriminacao VARCHAR(500) NULL,
  ind_dc CHAR(1) NOT NULL,
  ind_op CHAR(1) NOT NULL,
  dta_mvto TIMESTAMP NOT NULL,
  cod_moeda INT NULL,
  vlr_mvto DECIMAL(18,2) NULL,
  seq_conta INT NULL,
  cod_usuario INT NOT NULL, 
  PRIMARY KEY (seq_mvto),
  CONSTRAINT fk_movimentacao_bem FOREIGN KEY (cod_bem) REFERENCES bem (cod_bem),
  CONSTRAINT fk_movimentacao_moeda FOREIGN KEY (cod_moeda) REFERENCES moeda (cod_moeda),
  CONSTRAINT fk_movimentacao_usuario FOREIGN KEY (cod_usuario) REFERENCES usuario (cod_usuario));

-- -----------------------------------------------------
-- Table banco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS banco (
  seq_banco SERIAL NOT NULL,
  nom_banco VARCHAR(50) NOT NULL,
  cod_banco INT NOT NULL,
  ind_ativo CHAR(1) NOT NULL,
  PRIMARY KEY (seq_banco));

INSERT INTO usuario (nom_usuario, nom_identificacao, des_senha, ind_ativo, des_email) VALUES ('Administrador', 'admin', MD5('123'), 'S', 'admin@gmail.com');
INSERT INTO usuario (nom_usuario, nom_identificacao, des_senha, ind_ativo, des_email) VALUES ('Teste', 'teste', MD5('123'), 'S', 'teste@gmail.com');

INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('BANCO DO BRASIL S/A', 1, 'S');
INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('BANCO DO ESTADO DO RIO GRANDE DO SUL S/A', 41, 'S');
INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('CAIXA ECONOMICA FEDERAL', 104, 'S');
INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('BANCO BRADESCO S/A', 237, 'S');
INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('BANCO COOPERATIVO SICREDI S.A.', 748, 'S');
INSERT INTO banco (nom_banco, cod_banco, ind_ativo) VALUES ('BANCO COOPERATIVO DO BRASIL S/A', 756, 'S');

-- -----------------------------------------------------
-- Table conta_corrente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conta_corrente (
  seq_conta SERIAL NOT NULL,
  seq_banco INT NOT NULL,
  cod_agencia INT NOT NULL,
  num_cc VARCHAR(20) NOT NULL,
  ind_tipo_cc INT NOT NULL, -- 1: Corrente | 2: Poupança | 3: CPF | 4: Conta Pagamento
  cod_usuario INT NOT NULL,
  PRIMARY KEY (seq_conta),
  CONSTRAINT fk_conta_corrente_banco FOREIGN KEY (seq_banco) REFERENCES banco (seq_banco),
  CONSTRAINT fk_contacorrente_usuario FOREIGN KEY (cod_usuario) REFERENCES usuario (cod_usuario));
	
ALTER TABLE conta_corrente ADD ind_ativo VARCHAR(1) DEFAULT('N') NOT NULL;

INSERT INTO conta_corrente (seq_conta,seq_banco,cod_agencia,num_cc,ind_tipo_cc,cod_usuario,ind_ativo) VALUES (1, 1, 6542, 2198054, 1, 2, 'S');

-- -----------------------------------------------------
-- Table tipo_conta
-- -----------------------------------------------------
CREATE TABLE tipo_conta (
seq_tipo integer primary key,
des_tipo varchar(50) not null,
ind_ativo varchar(1) not null default('S'));

INSERT INTO tipo_conta (seq_tipo,des_tipo,ind_ativo) VALUES (1, 'Conta corrente', 'S');
INSERT INTO tipo_conta (seq_tipo,des_tipo,ind_ativo) VALUES (2, 'Poupança', 'S');
INSERT INTO tipo_conta (seq_tipo,des_tipo,ind_ativo) VALUES (3, 'CPF', 'S');

INSERT INTO moeda (nom_moeda, des_moeda, ind_ativo) VALUES ('REAL', 'MOEDA BRASILEIRA', 'S');