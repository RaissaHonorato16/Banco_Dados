-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
	idCliente  int NOT NULL PRIMARY KEY,
	endereco   varchar(30)  NOT NULL, 
	telefone   varchar(15)  NOT NULL,  
	nome       varchar(50)  NOT NULL,  
	email      varchar(100)  NOT NULL,  
);

CREATE TABLE PRODUTO (
	idProduto  int NOT NULL PRIMARY KEY,
	estoque    numeric  NOT NULL, 
	nome       varchar(50)  NOT NULL, 
	descricao  varchar(100)  NOT NULL,  
	preco      decimal(9,2)  NOT NULL,
);

CREATE TABLE PEDIDO (
	idPedido     int  NOT NULL PRIMARY KEY,
	idCliente    int  NOT NULL, -- chave estrangeira
	dataPedido   date  NOT NULL,
	status       varchar(20)  NOT NULL,
	FOREIGN KEY(idCliente) REFERENCES CLIENTE (idCliente)
);

CREATE TABLE ITEM_PEDIDO (
	idItemPedido  int  NOT NULL PRIMARY KEY,
	idPedido     int  NOT NULL,  -- chave estrangeira
	idProduto int  NOT NULL, -- chave estrangeira
	preco decimal(9,2)  NOT NULL,
	quantidade  int  NOT NULL,
	FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido),
	FOREIGN KEY(idProduto) REFERENCES PRODUTO (idProduto)
);

CREATE TABLE FATURA (
	idFatura int  NOT NULL PRIMARY KEY,
	idPedido int  NOT NULL, -- chave estrangeira
	dataFatura date  NOT NULL,
	valorTotal decimal(9,2)  NOT NULL,
	FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido)
);

