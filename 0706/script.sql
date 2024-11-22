-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.





	CREATE TABLE Fornecedor  (
	codigoForn int PRIMARY KEY, not null 
	nome  varchar(50) not null ,
	endereço varchar(50) not null, 
	cidade  varchar(30) not null ,
	estado char(2), not null ,
	telefone varchar(15) not null, 
	);

	CREATE TABLE Ordem_Compra (
	codigoOC int PRIMARY KEY not null, 
	nomeResponsavel varchar(50) not null, 
	data date not null, 
	valorTotal decimal(9,2) not null, 
	codigoForn int not null, 
	FOREIGN KEY(codigoForn) REFERENCES Fornecedor  (codigoForn)  
	);

	CREATE TABLE Material (
	codigoMaterial int PRIMARY KEY not null,
	valorTotal decimal(9,2) not null,
	descrição varchar(100) not null, 
	valorUnitario decimal9,2) not null, --chave estrangeira
	quantidade  int, not null 
	);

	CREATE TABLE ItemCompra (
	codigoIC int PRIMARY KEY not null,
	codigoMaterial int not null, --chave estrangeira
	codigoOC int not null, --chave estrangeira
	FOREIGN KEY(codigoMaterial) REFERENCES Material (codigoMaterial), 
	FOREIGN KEY(codigoOC) REFERENCES Ordem_Compra (codigoOC), 
	);

