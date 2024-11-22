-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.


CREATE TABLE funcionario (
	matriculaFunc int PRIMARY KEY,
	nome varchar(50),
	dataNasc date ,
	nacionalidade  varchar(30),
	sexo varchar(10),
	estadoCivil varcahr(15),
	RG varchar(15),
	telefone  varchar(15),
	endereco varchar(50),
	dataAdmissao date ,
	CPF varchar(15)
);

CREATE TABLE Dependente  (
	idDependente  int PRIMARY KEY,
	dataNasc date,
	nome  Varchar(50),
	matriculaFunc int, -- chave estrangeira 
	FOREIGN KEY(matriculaFunc) REFERENCES FUNCIONARIO (matriculaFunc)
);


CREATE TABLE cargo (
	idCargo int PRIMARY KEY,
	dataFim date ,
	nomeCargo varchar(50),
	dataInicio date 
	)

CREATE TABLE ocupar (
	idCargo int,       -- chave estrangeira
	matriculaFunc int, -- chave estrangeira 
	PRIMARY KEY(idCargo,matriculaFunc), -- chave primaria estrangeira
	FOREIGN KEY(idCargo) REFERENCES cargo (idCargo),
	FOREIGN KEY(matriculaFunc) REFERENCES funcionario (matriculaFunc)
);
