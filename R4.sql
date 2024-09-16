-- Tabela de Estados
CREATE TABLE estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de Tipos de Telefone
CREATE TABLE tipos_telefone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Tabela de Clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(50),
    razao_social VARCHAR(100) NOT NULL,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES estados(id)
);

-- Tabela de Telefones
CREATE TABLE telefones (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    id_cliente INT,
    id_tipo INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_tipo) REFERENCES tipos_telefone(id)
);

-- insertes de dados para a busca -----------------------------------------------------------------------------------------
-- Estados
INSERT INTO estados (sigla, nome) VALUES ('SP', 'São Paulo');
INSERT INTO estados (sigla, nome) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO estados (sigla, nome) VALUES ('MG', 'Minas Gerais');

-- Tipos de Telefone
INSERT INTO tipos_telefone (name) VALUES ('Residencial');
INSERT INTO tipos_telefone (name) VALUES ('Comercial');
INSERT INTO tipos_telefone (name) VALUES ('Celular');

-- Clientes
INSERT INTO clientes (cnpj, razao_social, id_estado) VALUES ('12.345.678/0001-90', 'Empresa A Ltda', 1);
INSERT INTO clientes (cnpj, razao_social, id_estado) VALUES ('98.765.432/0001-10', 'Empresa B Ltda', 2);
INSERT INTO clientes (cnpj, razao_social, id_estado) VALUES ('11.222.333/0001-55', 'Empresa C Ltda', 3);

-- Telefones
INSERT INTO telefones (numero, id_cliente, id_tipo) VALUES ('(11) 1234-5678', 1, 1);
INSERT INTO telefones (numero, id_cliente, id_tipo) VALUES ('(21) 8765-4321', 2, 2);
INSERT INTO telefones (numero, id_cliente, id_tipo) VALUES ('(31) 98765-4321', 3, 3);



-- query de busca -----------------------------------------------------------------------------------------------------

SELECT 
    c.id, 
    c.razao_social, 
    t.numero AS telefone
FROM 
    clientes c
JOIN 
    estados e ON c.id_estado = e.id
JOIN 
    telefones t ON c.id = t.id_cliente
WHERE 
    e.sigla = 'SP';
