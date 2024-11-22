-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
	NumeroID           int PRIMARY KEY NOT NULL, --CHAVE ESTRANGEIRA
	Nome               Varchar(100) NOT NULL,
	DataCadastro       Date NOT NULL,
	Endereco           Varchar(100) NOT NULL,
	Status             Varchar(15) NOT NULL,
	E-mail             Varchar(100) NOT NULL,
	Telefone           Varchar(15) NOT NULL
);

CREATE TABLE PESSOA FISICA (
	NumeroID           int PRIMARY KEY NOT NULL,-- CHAVE ESTRANGEIRA
	EstadoCivil        Varchar(10) NOT NULL,
	Profissao          Varchar(50) NULL,
	Sexo               Char NOT NULL,
	DataNasc           Date NOT NULL,
	CPF                Varchar(15) NOT NULL,
	FaixaRenda         Varchar(9,2) NULL,
	RG                 Varchar(15) NOT NULL,
	Habilitacao        Varchar(15) NOT NULL,
	FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
);

CREATE TABLE PESSOA JURIDICA (
	NumeroID            int PRIMARY KEY NOT NULL, -- CHAVE ESTRANGEIRA
	RazaoSocial         Varchar(100) NOT NULL,
	RamoAtividade       Varchar(50) NULL,
	CNPJ                Varchar(15) NOT NULL,
	InscrincaoEstadual  Varchar(15) NOT NULL,
	Contato_Responsavel Varchar(100) NULL,
	FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
);

CREATE TABLE VEICULO (
	NumeroRegistro     int PRIMARY KEY NOT NULL,
	IDCliente          int NOT NULL, -- CHAVE ESTRANGEIRA
	Modelo             Varchar(20) NOT NULL,
	AnoFabricacao      int NOT NULL,
	Tipo               Varchar(20) NOT NULL,
	Placa              varchar(10) NOT NULL,
	Marca              Varchar(20) NOT NULL,
	FOREIGN KEY(NumeroID) REFERENCES CLIENTE (NumeroID)
);

CREATE TABLE ACIDENTE  (
	NumeroID           int PRIMARY KEY NOT NULL,
	NumeroVeiculo      int NOT NULL, --CHAVE ESTRANGEIRA
	Data               Date NOT NULL,
	Hora               Time NOT NULL,
	Local              Varchar(100), NOT NULL
	Descrincao         Varchar(200) NOT NULL,
	FOREIGN KEY(NumeroRegistro) REFERENCES VEICULO (NumeroRegistro)
);

CREATE TABLE APOLICE (
	Numero             int PRIMARY KEY NOT NULL,
	NumeroVeiculo      int NOT NULL,-- CHAVE ESTRANGEIRA
	Valor              Decimal(9,2) NOT NULL,
	Descrincao         Varchar(100) NOT NULL,
	FOREIGN KEY(NumeroRegistro) REFERENCES VEICULO (NumeroRegistro)
);

