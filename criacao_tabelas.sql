CREATE TABLE cliente (
    id_cliente   INT NOT NULL,
    nome         VARCHAR(60) NOT NULL,
    documento    VARCHAR(15) NOT NULL,
    email        VARCHAR(30) NOT NULL,
    sexo         CHAR(1),
    usuario      VARCHAR(30) NOT NULL,
    senha        VARCHAR(30) NOT NULL,
    CONSTRAINT pk_id_cliente PRIMARY KEY ( id_cliente )
);


CREATE TABLE telefone (
    id_telefone   INT NOT NULL,
    tipo          VARCHAR(10),
    numero        VARCHAR(30) NOT NULL,
    id_cliente_fk NOT NULL,
    CONSTRAINT pk_id_telefone PRIMARY KEY ( id_telefone ),
    CONSTRAINT fk_id_cliente1 FOREIGN KEY ( id_cliente_fk )
        REFERENCES cliente ( id_cliente )
);

CREATE TABLE endereco (
    id_endereco     INT NOT NULL,
    rua             VARCHAR(60) NOT NULL,
    numero          VARCHAR(60) NOT NULL,
    bairro          VARCHAR(60) NOT NULL,
    cidade          VARCHAR(60) NOT NULL,
    uf              CHAR(2) NOT NULL,
    complemento     VARCHAR(60),
    id_cliente_fk   INT NOT NULL,
    CONSTRAINT pk_id_endereco PRIMARY KEY ( id_endereco ),
    CONSTRAINT fk_id_cliente2 FOREIGN KEY ( id_cliente_fk )
        REFERENCES cliente ( id_cliente )
);

CREATE TABLE produto (
    id_produto      INT NOT NULL,
    quantidade      INT NOT NULL,
    nome            VARCHAR(10) NOT NULL,
    id_cliente_fk   INT NOT NULL,
    CONSTRAINT pk_id_produto PRIMARY KEY ( id_produto ),
    CONSTRAINT fk_id_cliente3 FOREIGN KEY ( id_cliente_fk )
        REFERENCES cliente ( id_cliente )
);

CREATE TABLE status (
    id_status   INT NOT NULL,
    status      VARCHAR(60) NOT NULL,
    CONSTRAINT pk_id_status PRIMARY KEY ( id_status )
);

CREATE TABLE oferta (
    id_oferta       INT NOT NULL,
    valor           NUMBER NOT NULL,
    id_comprador    INT,
    data_compra     TIMESTAMP,
    data_oferta     TIMESTAMP NOT NULL,
    id_status_fk    INT NOT NULL,
    id_produto_fk   INT NOT NULL,
    CONSTRAINT pk_id_oferta PRIMARY KEY ( id_oferta ),
    CONSTRAINT fk_status FOREIGN KEY ( id_status_fk )
        REFERENCES status ( id_status ),
    CONSTRAINT fk_produto FOREIGN KEY ( id_produto_fk )
        REFERENCES produto ( id_produto )
);