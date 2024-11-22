-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
idCliente int PRIMARY KEY,
endereco varchar(30),
telefone varchar(15),
nome varchar(50),
email varchar(100)
)

CREATE TABLE PRODUTO (
idProduto int PRIMARY KEY,
estoque numeric,
nome varchar(50),
descricao varchar(100),
preco decimal(9,2)
)

CREATE TABLE PEDIDO (
idPedido int PRIMARY KEY,
idCliente int,
dataPedido date,
status varchar(20),
FOREIGN KEY(idCliente) REFERENCES CLIENTE (idCliente)
)

CREATE TABLE ITEM_PEDIDO (
idItemPedido int PRIMARY KEY,
idPedido int,
idProduto int,
preco decimal(9,2),
quantidade  int,
FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido),
FOREIGN KEY(idProduto) REFERENCES PRODUTO (idProduto)
)

CREATE TABLE FATURA (
idFatura int PRIMARY KEY,
idPedido int,
dataFatura date,
valorTotal decimal(9,2),
FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido)
)

