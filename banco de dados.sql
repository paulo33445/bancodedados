CREATE DATABASE Projeto_php;

USE Projeto_php;

CREATE TABLE funcionario (
    ID_Funcionario INT NOT NULL AUTO_INCREMENT,
    nome_Funcionario VARCHAR(50) NOT NULL,
    nasc_Funcionario DATE NOT NULL,
    data_Funcionario DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cpf_Funcionario CHAR(14) NOT NULL UNIQUE,
    logradouro_Funcionario VARCHAR(50) NOT NULL,
    numero_Funcionario INT NOT NULL,
    comp_funcionario VARCHAR(20) NULL,
    cep_Funcionario CHAR(10) NOT NULL,
    bairro_Funcionario VARCHAR(50) NOT NULL,
    cidade_Funcionario VARCHAR(50) NOT NULL,
    uf_Funcionario CHAR(2) NOT NULL,
    telefone1_Funcionario CHAR(16) NOT NULL,
    telefone2_Funcionario CHAR(16) NULL,
    telefone3_Funcionario CHAR(16) NULL,
    telefone4_Funcionario CHAR(16) NULL,
    obs_Funcionario VARCHAR(200) NULL,
    status_Funcionario VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
    PRIMARY KEY (ID_Funcionario)
);
select*from funcionario
insert into funcionario 
(
nome_Funcionario, nasc_Funcionario,cpf_Funcionario,logradouro_Funcionario,numero_Funcionario, comp_funcionario, cep_Funcionario,bairro_Funcionario,
cidade_Funcionario, uf_Funcionario,telefone1_Funcionario, status_Funcionario
)
values
(
'pedro','22:05:2000','444.555.666.77','ria','2','asd','07050','jardim','sao paulo','asdf','93080.0522','Ativo'
)

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    login_usuario VARCHAR(30) NOT NULL UNIQUE,
    senha_usuario VARCHAR(30) NOT NULL,
    data_usuario DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    obs_usuario VARCHAR(255) NULL,
    status_usuario VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_usuario)
);

select*from usuario

insert into usuario 
(
nome_usuario,login_usuario,senha_usuario, status_usuario
)
values 
(
'paulo','admim','123','Ativo'
) 


CREATE TABLE produto (
    ID_Produto INT NOT NULL AUTO_INCREMENT,
    nome_Produto VARCHAR(30) NOT NULL UNIQUE,
    data_Produto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    qtde_Produto INT NOT NULL,
    Vcusto_Produto DECIMAL(10, 2) NOT NULL,
    Vvenda_Produto DECIMAL(10, 2) NOT NULL,
    obs_Produto VARCHAR(200) NULL,
    status_Produto VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID_Produto)
);

select*from produto
insert into produto
(
nome_produto,qtde_produto,Vcusto_produto,Vvenda_produto,status_produto
) 
values 
(
'pao','12','10','10','Ativo'
) 

CREATE TABLE movimentacao (
    id_mov INT NOT NULL AUTO_INCREMENT,
    id_Produto_mov INT NOT NULL,
    id_Funcionario_mov INT NOT NULL,
    qtde_mov INT NOT NULL,
    data_mov DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_mov VARCHAR(30) NOT NULL,
    obs_mov VARCHAR(200) NULL,
    status_mov VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_mov),
    CONSTRAINT fk_produto_mov FOREIGN KEY (id_Produto_mov) REFERENCES produto (ID_Produto),
    CONSTRAINT fk_funcionario_mov FOREIGN KEY (id_Funcionario_mov) REFERENCES funcionario (ID_Funcionario)
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT NOT NULL AUTO_INCREMENT,
    nome_Fornecedor VARCHAR(255) NOT NULL UNIQUE,
    nasc_Fornecedor DATE NOT NULL,
    data_Fornecedor DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cnpj_Fornecedor CHAR(18) NOT NULL UNIQUE,
    logradouro_Fornecedor VARCHAR(255) NOT NULL,
    numero_Fornecedor INT NOT NULL,
    cep_Fornecedor CHAR(10) NOT NULL,
    bairro_Fornecedor VARCHAR(255) NOT NULL,
    cidade_Fornecedor VARCHAR(255) NOT NULL,
    uf_Fornecedor CHAR(2) NOT NULL,
    telefone1_Fornecedor CHAR(15) NOT NULL,
    telefone2_Fornecedor CHAR(15) NULL,
    telefone3_Fornecedor CHAR(15) NULL,
    telefone4_Fornecedor CHAR(15) NULL,
    contato_Fornecedor CHAR(255) NOT NULL,
    obs_Fornecedor VARCHAR(200) NULL,
    status_Fornecedor VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_Fornecedor)
);
select*from produto
insert into fornecedor
(
nome_fornecedor, nasc_fornecedor,cnpj_fornecedor,logradouro_fornecedor,numero_fornecedor,  cep_fornecedor,bairro_fornecedor,
cidade_fornecedor, uf_fornecedor,telefone1_fornecedor, status_fornecedor
)
values
(
'pedro','22:05:2000','444.555.666.77','ria','2','07050','jardim','sao paulo','asdf','93080.0522','Ativo'
)

CREATE TABLE LocalEstoque (
    id_LocalEstoque INT NOT NULL AUTO_INCREMENT,
    nome_LocalEstoque VARCHAR(255) NOT NULL,
    data_LocalEstoque DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    obs_LocalEstoque VARCHAR(200) NULL,
    status_LocalEstoque VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_LocalEstoque)
);

CREATE TABLE ItemEstoque (
    id_ItemEstoque INT NOT NULL AUTO_INCREMENT,
    id_produto_ItemEstoque INT NOT NULL,
    id_localEstoque_ItemEstoque INT NOT NULL,
    data_ItemEstoque DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    obs_os VARCHAR(200) NULL,
    status_os VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ItemEstoque),
    CONSTRAINT fk_produto_ItemEstoque FOREIGN KEY (id_produto_ItemEstoque) REFERENCES produto (ID_Produto),
    CONSTRAINT fk_localEstoque_ItemEstoque FOREIGN KEY (id_localEstoque_ItemEstoque) REFERENCES LocalEstoque (id_LocalEstoque)
);

CREATE TABLE OS (
    id_os INT NOT NULL AUTO_INCREMENT,
    id_produto_os INT NOT NULL,
    data_os DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    qtde_os INT NOT NULL,
    obs_os VARCHAR(200) NULL,
    status_os VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_os),
    CONSTRAINT fk_produto_os FOREIGN KEY (id_produto_os) REFERENCES produto (ID_Produto)
);
