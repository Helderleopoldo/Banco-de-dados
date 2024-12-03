USE  oficina_mecanica;

SHOW TABLES;

SELECT now() as TIMESTAMP;

DESC Veiculo;
INSERT INTO Veiculo(placa, modelo, marca, ano, cliente_id) VALUES ('MBA 2598','Corsa', 'Chevrolet', 2006, 1),
('MBA 4598','Celta', 'Chevrolet', 2006, 2),('MFU 1234','Captiva', 'Chevrolet', 2008, 3),
('MCA 2554','Meriva', 'Chevrolet', 2006, 4),('MBA 3562','Corsa', 'Chevrolet', 2016, 1);

INSERT INTO Veiculo(placa, modelo, marca, ano, cliente_id) VALUES ('MCH 3658','Strada', 'Fiat', 2006, 6);
SELECT * FROM Veiculo;

DESC Contato;
INSERT INTO Contato (tipo, id_cliente) VALUES ('Email',3);
SELECT * FROM Contato;

DESC Cliente;
INSERT INTO Cliente(nome_cliente,cpf_cliente) VALUES('Helder Rosa Leopoldo', 04573422935);
INSERT INTO Cliente(nome_cliente,cpf_cliente) VALUES('Camila Orácio Leopoldo',1234567891),
('Gabriel Orácio Leopoldo',6544567891),('Paulo Orácio Leopoldo',1234565481),('Jose Orácio Leopoldo',8464567891);

SELECT * FROM Telefone;
DESC Telefone;
INSERT INTO Telefone(numero, contato_id) VALUES('(48)99176-9512',4);

SELECT * FROM Email;
DESC Email;
INSERT INTO Email(email, contato_id) VALUES('carlaleopoldo@gmail.com',2),('camilaleopoldo@gmail.com',3),
('joseleopoldo@gmail.com',4),('gabrielleopoldo@gmail.com',2);

SELECT * FROM Equipe;
DESC Equipe;
INSERT INTO Equipe(nome, descricao) VALUES('Mecânicos','Realizam serviços mecânicos, troca de peças e ajustes.'),
('Eletrônicos','Realizam serviços elétricos, troca de peças e calibração.'),
('Balconistas','Realizam atendimentos de clientes, venda de peças e cobranças.');

SELECT * FROM Balconista;
DESC Balconista;
INSERT INTO Balconista(nome_balconista, especialidade, id_equipe) VALUES('Carla','Atender clientes.',3);

DESC Peca;
SELECT * FROM Peca;
INSERT INTO Peca(nome_peca, descricao, quantidade, preco) VALUES('Correia','Dentada 8M-150',30, 150.00);

SELECT * FROM Cliente;


SELECT TABLE_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'fk_id_equipe';

ALTER TABLE Mecanico DROP FOREIGN KEY fk_id_equipe;
ALTER TABLE Mecanico ADD CONSTRAINT fk_id_equipe_mecanico FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe) ON DELETE SET NULL;

DESC Contato;

SELECT DISTINCT tipo FROM Contato;

SELECT nome_cliente, cpf_cliente 
FROM Cliente;

-- Consulta de clientes cadastrados com emails e telefones e seus veiculos
SELECT c.nome_cliente AS Nome, c.cpf_cliente AS CPF, e.email AS Email, t.numero AS Telefone, 
v.placa AS Placa, v.modelo AS Modelo, v.marca AS Marca, v.ano AS Ano
FROM Cliente c
-- Relaciona Cliente com Contato para e-mails
JOIN Contato ce ON c.id_cliente = ce.id_cliente AND ce.tipo = 'email'
JOIN Email e ON ce.id_contato = e.contato_id
-- Relaciona Cliente com Contato para telefones
JOIN Contato ct ON c.id_cliente = ct.id_cliente AND ct.tipo = 'telefone'
JOIN Telefone t ON ct.id_contato = t.contato_id
-- Relaciona Cliente com Veiculos
JOIN Veiculo v ON c.id_cliente = v.cliente_id
WHERE c.id_cliente = 1;

-- Consulta de clientes e veiculos cadastrados na oficina
SELECT c.nome_cliente AS Nome, c.cpf_cliente AS CPF, 
v.placa AS Placa, v.modelo AS Modelo, v.marca AS Marca, v.ano AS Ano
FROM Cliente c
-- Relaciona Cliente com Veiculos
JOIN Veiculo v ON c.id_cliente = v.cliente_id;





