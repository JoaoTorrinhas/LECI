USE P1G9;
GO

CREATE SCHEMA RENT_A_CAR;
GO

CREATE TABLE RENT_A_CAR.VEHICLE(
	Matricula	NVARCHAR(8),
	Model		NVARCHAR(30),
	Ano			int,
	Codigo_Veiculo int,
	CONSTRAINT PK_VEHICLE PRIMARY KEY(Matricula),
	CONSTRAINT FK_VEHICLE_CATEGORY FOREIGN KEY (Codigo_Veiculo) REFERENCES RENT_A_CAR.TipoVeiculo(CodigoTipoVeiculo),
);

CREATE TABLE RENT_A_CAR.TipoVeiculo(
	CodigoTipoVeiculo	int,
	AC					BIT,
	designacao			NVARCHAR(30),
	CONSTRAINT PK_TipoVeiculo PRIMARY KEY(CodigoTipoVeiculo),

);

CREATE TABLE RENT_A_CAR.CLIENTE(
	NIF				int,
	num_carta		int,
	endereço		NVARCHAR(60),
	nome			NVARCHAR(30),

	CONSTRAINT PK_CLIENTE PRIMARY KEY(NIF),
);

CREATE TABLE RENT_A_CAR.BALCAO(
	numero		int,
	nome		NVARCHAR(30),
	endereco	NVARCHAR(60),

	CONSTRAINT PK_BALCAO PRIMARY KEY(numero),
);

CREATE TABLE RENT_A_CAR.ALUGUER(
	numero		int,
	duracao		int,
	alu_data	date,
	cliente_NIF	int,
	numero_balcao	int,
	matricula_veic	NVARCHAR(8),

	CONSTRAINT PK_ALUGUER PRIMARY KEY(numero),
	CONSTRAINT FK_ALUGUER_NIF FOREIGN KEY (cliente_NIF) REFERENCES RENT_A_CAR.CLIENTE(NIF),
	CONSTRAINT FK_ALUGUER_numeroBalcao FOREIGN KEY (numero_balcao) REFERENCES RENT_A_CAR.BALCAO(numero),
	CONSTRAINT FK_ALUGUER_matriculaVeiculo FOREIGN KEY (matricula_veic) REFERENCES RENT_A_CAR.VEHICLE(Matricula),

);

CREATE TABLE RENT_A_CAR.SIMILARIDADE(
	codigo1		int,
	codigo2		int,

	CONSTRAINT PKS_SIMILARIDADE PRIMARY KEY(codigo1,codigo2),
	CONSTRAINT FK1_SIMILARIDADE FOREIGN KEY (codigo1) REFERENCES RENT_A_CAR.TipoVeiculo(CodigoTipoVeiculo),
	CONSTRAINT FK2_SIMILARIDADE FOREIGN KEY (codigo2) REFERENCES RENT_A_CAR.TipoVeiculo(CodigoTipoVeiculo),
);

CREATE TABLE RENT_A_CAR.LIGEIRO(
	codigoTipo	int,
	combustivel	NVARCHAR(30),
	portas		int,
	numLugares	int,

	CONSTRAINT PK_LIGEIRO PRIMARY KEY(codigoTipo),
	CONSTRAINT FK_LIGEIRO FOREIGN KEY(codigoTipo) REFERENCES RENT_A_CAR.TipoVeiculo(CodigoTipoVeiculo),
);

CREATE TABLE RENT_A_CAR.PESADO(
	codigoTipo		int,
	peso			int,
	passageiros		int,
	
	CONSTRAINT PK_PESADO PRIMARY KEY(codigoTipo),
	CONSTRAINT FK_PESADO FOREIGN KEY(codigoTipo) REFERENCES RENT_A_CAR.TipoVeiculo(CodigoTipoVeiculo),
);


DROP TABLE RENT_A_CAR.VEHICLE;

