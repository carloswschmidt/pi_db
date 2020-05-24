INSERT INTO cliente (
    nome,
    documento,
    email,
    sexo,
    usuario,
    senha
) VALUES (
    'Usuario de Teste Um',
    '123456789',
    'teste@email.com',
    'F',
    'usuario1',
    'a123456'
);

INSERT INTO cliente (
    nome,
    documento,
    email,
    usuario,
    senha
) VALUES (
    'Usuario de Teste Dois',
    '123456789',
    'teste2@email.com',
    'usuario2',
    'b123'
);

INSERT INTO cliente (
    nome,
    documento,
    email,
    usuario,
    senha
) VALUES (
    'Usuario de Teste Tres',
    '987654321',
    'teste3@email.com',
    'usuario2',
    'c1234'
);

INSERT INTO cliente (
    nome,
    documento,
    email,
    usuario,
    senha
) VALUES (
    'Usuario de Teste Quatro',
    '123456',
    'teste4@email.com',
    'usuario4',
    '654321'
);

INSERT INTO cliente (
    nome,
    documento,
    email,
    usuario,
    senha
) VALUES (
    'Usuario de Teste 5',
    '123456',
    'teste4@email.com',
    'usuario4',
    '654321'
);

SELECT
    *
FROM
    cliente;

INSERT INTO telefone (
    numero,
    id_cliente_fk
) VALUES (
    '12345-7896',
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Um'
    )
);

INSERT INTO telefone (
    numero,
    id_cliente_fk
) VALUES (
    '74185-1235',
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Tres'
    )
);

SELECT
    *
FROM
    telefone;

INSERT INTO endereco (
    rua,
    numero,
    bairro,
    cidade,
    uf,
    id_cliente_fk
) VALUES (
    'Rua endereco 1',
    2055,
    'Teste',
    'Curitiba',
    'PR',
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Tres'
    )
);

INSERT INTO endereco (
    rua,
    numero,
    bairro,
    cidade,
    uf,
    id_cliente_fk
) VALUES (
    'Rua endereco 2',
    312,
    'Teste2',
    'Curitiba',
    'PR',
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Quatro'
    )
);

INSERT INTO endereco (
    rua,
    numero,
    bairro,
    cidade,
    uf,
    id_cliente_fk
) VALUES (
    'Rua endereco 2',
    312,
    'Teste2',
    'Curitiba',
    'PR',
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Tres'
    )
);

SELECT
    *
FROM
    endereco;

INSERT INTO produto (
    nome,
    quantidade,
    id_cliente_fk
) VALUES (
    'Teste',
    1000,
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Dois'
    )
);

INSERT INTO produto (
    nome,
    quantidade,
    id_cliente_fk
) VALUES (
    'Oleo',
    5,
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste Um'
    )
);

INSERT INTO produto (
    nome,
    quantidade,
    id_cliente_fk
) VALUES (
    'Oleo',
    5,
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario 9 Update 3'
    )
);

INSERT INTO produto (
    nome,
    quantidade,
    id_cliente_fk
) VALUES (
    'Oleo',
    5,
    (
        SELECT
            id_cliente
        FROM
            cliente
        WHERE
            nome = 'Usuario de Teste 10'
    )
);

SELECT
    *
FROM
    produto;

INSERT INTO status ( status ) VALUES ( 'Aberto' );

INSERT INTO status ( status ) VALUES ( 'Fechado' );

SELECT
    *
FROM
    status;

INSERT INTO oferta (
    valor,
    data_oferta,
    id_status_fk,
    id_produto_fk,
    id_oferta
) VALUES (
    20.5,
    current_timestamp,
    (
        SELECT
            id_status
        FROM
            status
        WHERE
            status = 'Aberto'
    ),
    (
        SELECT
            id_produto
        FROM
            produto
        WHERE
            id_cliente_fk = (
                SELECT
                    id_cliente
                FROM
                    cliente
                WHERE
                    nome = 'Usuario de Teste Um'
            )
    ),
    (
        SELECT
            id_produto
        FROM
            produto
        WHERE
            id_cliente_fk = (
                SELECT
                    id_cliente
                FROM
                    cliente
                WHERE
                    nome = 'Usuario de Teste Um'
            )
    )
);

INSERT INTO oferta (
    valor,
    data_oferta,
    id_status_fk,
    id_produto_fk,
    id_oferta
) VALUES (
    20.5,
    current_timestamp,
    (
        SELECT
            id_status
        FROM
            status
        WHERE
            status = 'Aberto'
    ),
    (
        SELECT
            id_produto
        FROM
            produto
        WHERE
            id_cliente_fk = (
                SELECT
                    id_cliente
                FROM
                    cliente
                WHERE
                    nome = 'Usuario de Teste Dois'
            )
    ),
    (
        SELECT
            id_produto
        FROM
            produto
        WHERE
            id_cliente_fk = (
                SELECT
                    id_cliente
                FROM
                    cliente
                WHERE
                    nome = 'Usuario de Teste Dois'
            )
    )
);

SELECT
    *
FROM
    oferta;