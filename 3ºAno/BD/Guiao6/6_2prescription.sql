CREATE SCHEMA prescrition_system;
GO

CREATE TABLE prescrition_system.Medico(
	No_identificacao	INT PRIMARY KEY NOT NULL,
	Especialidade		VARCHAR(30),
	Nome				VARCHAR(50)
);

CREATE TABLE prescrition_system.Paciente(
	No_utente			INT PRIMARY KEY NOT NULL,
	Endereco			VARCHAR(100),
	Nome				VARCHAR(50) NOT NULL,
	Data_nascimento		DATE
);

CREATE TABLE prescrition_system.Farmacia(
	Telefone			DECIMAL(9,0) PRIMARY KEY NOT NULL CHECK(Telefone > 0),
	Endereco			VARCHAR(100),
	Nome				VARCHAR(50) NOT NULL
);

CREATE TABLE prescrition_system.Prescricao(
	No_prescricao		INT PRIMARY KEY NOT NULL,
	Med_id				INT REFERENCES prescrition_system.Medico(No_identificacao) NOT NULL,
	Pac_id				INT REFERENCES prescrition_system.Paciente(No_utente) NOT NULL,
	Farmacia_process	DECIMAL(9,0) REFERENCES prescrition_system.Farmacia(Telefone),
	Data_process		DATE
);

CREATE TABLE prescrition_system.Farmaceutica(
	Registo_farmaceutica	INT PRIMARY KEY NOT NULL,
	Telefone				DECIMAL(9,0) CHECK(Telefone > 0),
	Nome					VARCHAR(50) NOT NULL,
	Endereco				VARCHAR(100)
);

CREATE TABLE prescrition_system.Farmaco(
	Formula					VARCHAR(100),
	Nome_comercial			VARCHAR(30) NOT NULL,
	Registo_farmaceutica	INT REFERENCES prescrition_system.Farmaceutica(Registo_farmaceutica) NOT NULL,
	PRIMARY KEY(Nome_comercial, Registo_farmaceutica)
);

CREATE TABLE prescrition_system.Vende(
	Tel_farmacia			DECIMAL(9,0) REFERENCES prescrition_system.Farmacia(Telefone) NOT NULL,
	Nome_farmaco			VARCHAR(30) NOT NULL,
	Registo_farmaceutica	INT NOT NULL,
	FOREIGN KEY(Nome_farmaco, Registo_farmaceutica) REFERENCES prescrition_system.Farmaco(Nome_comercial, Registo_farmaceutica),
	PRIMARY KEY(Tel_farmacia, Nome_farmaco, Registo_farmaceutica)
);

CREATE TABLE prescrition_system.PrescricoesEnvolvemFarmacos(
	No_prescricao			INT REFERENCES prescrition_system.Prescricao(No_prescricao) NOT NULL,
	Nome_farmaco			VARCHAR(30) NOT NULL,
	Registo_farmaceutica	INT NOT NULL,
	FOREIGN KEY(Nome_farmaco, Registo_farmaceutica) REFERENCES prescrition_system.Farmaco(Nome_comercial, Registo_farmaceutica),
	PRIMARY KEY(No_prescricao, Nome_farmaco, Registo_farmaceutica)
);



-- a) Lista de pacientes que nunca tiveram uma prescrição
SELECT P.No_utente, P.Nome
FROM (prescrition_system.Paciente AS P LEFT OUTER JOIN prescrition_system.Prescricao AS Pr ON P.No_utente=Pr.Pac_id)
WHERE No_prescricao is NULL;

-- b) Número de prescrições por especialidade médica
SELECT M.Especialidade,count(PR.No_prescricao) as num_prescricoes
FROM prescrition_system.Prescricao AS PR JOIN prescrition_system.Medico AS M ON M.No_identificacao=PR.Med_id
GROUP BY M.Especialidade

-- c) Número de prescrições processadas por farmácia
SELECT P.Farmacia_process ,count(P.No_prescricao) as num_processadas_por_farmacias
FROM prescrition_system.Prescricao AS P
WHERE P.Farmacia_process IS NOT NULL	group by P.Farmacia_process;

-- d) Para a farmacêutica com registo número 906, lista dos seus fármacos nunca prescritos
SELECT F.Nome_comercial,F.Registo_farmaceutica
FROM prescrition_system.Farmaco AS F LEFT OUTER JOIN prescrition_system.PrescricoesEnvolvemFarmacos AS P ON F.Nome_comercial=P.Nome_farmaco
WHERE F.Registo_farmaceutica=906 AND P.No_prescricao IS NULL

-- e) Para cada farmácia, o número de fármacos de cada farmacêutica vendidos
SELECT P.Farmacia_process,PF.Registo_farmaceutica,count(PF.Nome_farmaco) as num
FROM
( 
	(SELECT DISTINCT p1.No_prescricao,p1.Farmacia_process
	  FROM prescrition_system.Prescricao as p1
	  WHERE p1.Farmacia_process IS NOT NULL) as P
	JOIN
	prescrition_system.PrescricoesEnvolvemFarmacos AS PF
	ON P.No_prescricao=PF.No_prescricao
)
GROUP BY P.Farmacia_process,PF.Registo_farmaceutica

-- d) Pacientes que tiveram prescrições de médicos diferentes
SELECT P1.Pac_id, P1_Nome
FROM(
	SELECT P.Pac_id,P.Med_id,count(P.Pac_id) as num					
	FROM prescrition_system.Prescricao as P
	GROUP BY P.Pac_id,P.Med_id
) AS P1
GROUP BY P1.Pac_id
HAVING count(P1.Pac_id) > 1

--paciente ⨝ σ num_UU > 1 (γ numUtente; count(numUtente)->num_UU (γ numUtente, numMedico; count(numMedico)-> numPrescricoes prescricao))

SELECT  * FROM prescrition_system.Paciente JOIN (SELECT * FROM (SELECT TABELA1.Pac_id, count(TABELA1.Pac_id) AS num_UU FROM (SELECT Pac_id, Med_id, count(Med_id) AS numPrescricoes FROM prescrition_system.Prescricao GROUP BY Pac_id,Med_id) AS TABELA1 GROUP BY TABELA1.Pac_id) AS TABELA2 WHERE TABELA2.num_UU > 1) AS AUX ON Pac_id=No_utente;



INSERT INTO prescrition_system.Medico(
	No_identificacao,
	Nome,
	Especialidade
)
VALUES
	(101,'Joao Pires Lima', 'Cardiologia'),
	(102,'Manuel Jose Rosa', 'Cardiologia'),
	(103,'Rui Luis Caraca', 'Pneumologia'),
	(104,'Sofia Sousa Silva', 'Radiologia'),
	(105,'Ana Barbosa', 'Neurologia');

SELECT * FROM prescrition_system.Medico;

INSERT INTO prescrition_system.Paciente(
	No_utente,
	Nome,
	Data_nascimento,
	Endereco
)
VALUES
	(1,'Renato Manuel Cavaco','1980-01-03','Rua Nova do Pilar 35'),
	(2,'Paula Vasco Silva','1972-10-30','Rua Direita 43'),
	(3,'Ines Couto Souto','1985-05-12','Rua de Cima 144'),	
	(4,'Rui Moreira Porto','1970-12-12','Rua Zig Zag 235'),
	(5,'Manuel Zeferico Polaco','1990-06-05','Rua da Baira Rio 1135');

SELECT * FROM prescrition_system.Paciente;

INSERT INTO prescrition_system.Farmacia(
	Nome,
	Telefone,
	Endereco
)
VALUES
	('Farmacia BelaVista',221234567,'Avenida Principal 973'),
	('Farmacia Central',234370500,'Avenida da Liberdade 33'),
	('Farmacia Peixoto',234375111,'Largo da Vila 523'),
	('Farmacia Vitalis',229876543,'Rua Visconde Salgado 263');

SELECT * FROM prescrition_system.Farmacia;

INSERT INTO prescrition_system.Farmaceutica(
	Registo_farmaceutica,
	Nome,
	Endereco
)
VALUES
	(905,'Roche','Estrada Nacional 249'),
	(906,'Bayer','Rua da Quinta do Pinheiro 5'),
	(907,'Pfizer','Empreendimento Lagoas Park - Edificio 7'),
	(908,'Merck', 'Alameda Fernão Lopes 12');

SELECT * FROM prescrition_system.Farmaceutica;

INSERT INTO prescrition_system.Farmaco(
	Registo_farmaceutica,
	Nome_comercial,
	Formula
)
VALUES
	(905,'Boa Saude em 3 Dias','XZT9'),
	(906,'Voltaren Spray','PLTZ32'),
	(906,'Xelopironi 350','FRR-34'),
	(906,'Gucolan 1000','VFR-750'),
	(907,'GEROaero Rapid','DDFS-XEN9'),
	(908,'Aspirina 1000','BIOZZ02');

SELECT * FROM prescrition_system.Farmaco;

INSERT INTO prescrition_system.Prescricao(
	No_prescricao,
	Pac_id,
	Med_id,
	Farmacia_process,
	Data_process
)
VALUES
	(10001,1,105,234370500,'2015-03-03'),
	(10002,1,105,NULL,NULL),
	(10003,3,102,234370500,'2015-01-17'),
	(10004,3,101,221234567,'2015-02-09'),
	(10005,3,102,234370500,'2015-01-17'),
	(10006,4,102,229876543,'2015-02-22'),
	(10007,5,103,NULL,NULL),
	(10008,1,103,234370500,'2015-01-02'),
	(10009,3,102,234375111,'2015-02-02');

SELECT * FROM prescrition_system.Prescricao;

INSERT INTO prescrition_system.PrescricoesEnvolvemFarmacos(
	No_prescricao,
	Registo_farmaceutica,
	Nome_farmaco
)
VALUES
	(10001,905,'Boa Saude em 3 Dias'),
	(10002,907,'GEROaero Rapid'),
	(10003,906,'Voltaren Spray'),
	(10003,906,'Xelopironi 350'),
	(10003,908,'Aspirina 1000'),
	(10004,905,'Boa Saude em 3 Dias'),
	(10004,908,'Aspirina 1000'),
	(10005,906,'Voltaren Spray'),
	(10006,905,'Boa Saude em 3 Dias'),
	(10006,906,'Voltaren Spray'),
	(10006,906,'Xelopironi 350'),
	(10006,908,'Aspirina 1000'),
	(10007,906,'Voltaren Spray'),
	(10008,905,'Boa Saude em 3 Dias'),
	(10008,908,'Aspirina 1000'),
	(10009,905,'Boa Saude em 3 Dias'),
	(10009,906,'Voltaren Spray'),
	(10009,908,'Aspirina 1000');

SELECT * FROM prescrition_system.PrescricoesEnvolvemFarmacos;