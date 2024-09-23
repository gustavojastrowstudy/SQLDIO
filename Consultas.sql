CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

CREATE TABLE Veiculos (
    veiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT,
    placa VARCHAR(10),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE Servicos (
    servico_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Ordens_Servico (
    ordem_servico_id INT PRIMARY KEY AUTO_INCREMENT,
    veiculo_id INT,
    data DATE NOT NULL,
    status VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(veiculo_id)
);

CREATE TABLE Servicos_Realizados (
    servico_realizado_id INT PRIMARY KEY AUTO_INCREMENT,
    ordem_servico_id INT,
    servico_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (ordem_servico_id) REFERENCES Ordens_Servico(ordem_servico_id),
    FOREIGN KEY (servico_id) REFERENCES Servicos(servico_id)
);



-- Inserindo clientes
INSERT INTO Clientes (nome, telefone, email, endereco) 
VALUES ('João Silva', '999999999', 'joao@gmail.com', 'Rua A, 123'),
       ('Maria Souza', '988888888', 'maria@hotmail.com', 'Rua B, 456');

-- Inserindo veículos
INSERT INTO Veiculos (modelo, marca, ano, placa, cliente_id)
VALUES ('Civic', 'Honda', 2020, 'ABC1234', 1),
       ('Corolla', 'Toyota', 2019, 'XYZ5678', 2);

-- Inserindo serviços
INSERT INTO Servicos (descricao, preco)
VALUES ('Troca de Óleo', 150.00),
       ('Alinhamento', 120.00);

-- Inserindo ordem de serviço
INSERT INTO Ordens_Servico (veiculo_id, data, status, total)
VALUES (1, '2023-09-20', 'Concluído', 270.00);

-- Inserindo serviços realizados
INSERT INTO Servicos_Realizados (ordem_servico_id, servico_id, quantidade)
VALUES (1, 1, 1),
       (1, 2, 1);



SELECT nome, telefone FROM Clientes;

SELECT * FROM Veiculos WHERE marca = 'Honda';

SELECT 
    os.ordem_servico_id, 
    SUM(sr.quantidade * s.preco) AS total_servico
FROM Ordens_Servico os
JOIN Servicos_Realizados sr ON os.ordem_servico_id = sr.ordem_servico_id
JOIN Servicos s ON sr.servico_id = s.servico_id
GROUP BY os.ordem_servico_id;

SELECT * FROM Ordens_Servico ORDER BY data DESC;

SELECT 
    c.nome, 
    v.modelo, 
    os.data, 
    os.status
FROM Clientes c
JOIN Veiculos v ON c.cliente_id = v.cliente_id
JOIN Ordens_Servico os ON v.veiculo_id = os.veiculo_id
WHERE os.status = 'Concluído';
