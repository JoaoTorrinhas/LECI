CREATE SCHEMA COMPANY;
GO

CREATE TABLE COMPANY.EMPLOYEE(
	Fname 		VARCHAR(15) 	NOT NULL,
	Minit 		CHAR(1),
	Lname 		VARCHAR(20) 	NOT NULL,
	Ssn   		DECIMAL(9,0) 	NOT NULL, 
	Bdate 		DATE, 
	Address		VARCHAR(60), 
	Sex			CHAR(1), 
	Salary		DECIMAL(11,2), 
	Super_ssn	DECIMAL(9,0), 
	Dno 		INT 			NOT NULL,
	CONSTRAINT PK_EMPLOYEE PRIMARY KEY(Ssn),
	CONSTRAINT FK_EMPLOYEE FOREIGN KEY(Super_ssn) REFERENCES COMPANY.EMPLOYEE(Ssn) 
)

INSERT INTO COMPANY.EMPLOYEE VALUES ('Paula', 'A', 'Sousa', 183623612, '20010811', 'Rua da FRENTE', 'F', 1450.00, NULL, 3);
INSERT INTO COMPANY.EMPLOYEE VALUES ('Carlos', 'D', 'Gomes', 21312332, '20000101', 'Rua XPTO', 'M', 1200.00, NULL, 1);
INSERT INTO COMPANY.EMPLOYEE VALUES ('Juliana', 'A', 'Amaral', 321233765, '19800811', 'Rua BZZZZ', 'F', 1350.00, NULL, 3);
INSERT INTO COMPANY.EMPLOYEE VALUES ('Maria', 'I', 'Pereira', 342343434, '20010501', 'Rua JANOTA', 'F', 1250.00, 21312332, 2);
INSERT INTO COMPANY.EMPLOYEE VALUES ('Joao', 'G', 'Costa', 41124234, '20010101', 'Rua YGZ', 'M', 1300.00, 21312332, 2);
INSERT INTO COMPANY.EMPLOYEE VALUES ('Ana', 'L', 'Silva', 12652121, '19900303', 'Rua ZIG ZAG', 'F', 1400.00, 21312332, 2);

CREATE TABLE COMPANY.DEPARTMENT (
	Dname 			VARCHAR(25)	NOT NULL,
	Dnumber 		INT 		NOT NULL,
	Mgr_ssn 		DECIMAL(9,0),
	Mgr_start_date 	DATE,
	CONSTRAINT PK_DEPARTMENT PRIMARY KEY(Dnumber),
	CONSTRAINT FK_DEPARTMENT FOREIGN KEY(Mgr_ssn) REFERENCES company.employee(Ssn)
);

INSERT INTO company.department VALUES ('Investigacao', 1, 21312332, '20100802');
INSERT INTO company.department VALUES ('Comercial', 2, 321233765, '20130516');
INSERT INTO company.department VALUES ('Logistica', 3, 41124234, '20130516');
INSERT INTO company.department VALUES ('Recursos Humanos', 4, 12652121, '20140402');
INSERT INTO company.department VALUES ('Desporto', 5, NULL, NULL);

ALTER TABLE COMPANY.EMPLOYEE ADD CONSTRAINT FK2_EMPLOYEE FOREIGN KEY(Dno) REFERENCES COMPANY.DEPARTMENT(Dnumber);

CREATE TABLE COMPANY.DEPEDENT (
	Essn 			DECIMAL(9,0) 	NOT NULL,
	Dependent_name 	VARCHAR(100)	NOT NULL,
	Sex 			CHAR(1),
	Bdate 			DATE,
	Relationship	VARCHAR(20)		NOT NULL,
	CONSTRAINT PKS_DEPENDENT PRIMARY KEY(Essn, Dependent_name),
	CONSTRAINT FK_DEPENDENT FOREIGN KEY(Essn) REFERENCES company.employee(Ssn)
);

INSERT INTO COMPANY.DEPEDENT VALUES (21312332, 'Joana Costa', 'F', '20080401', 'Filho');
INSERT INTO COMPANY.DEPEDENT VALUES (21312332, 'Maria Costa', 'F', '19901005', 'Neto');
INSERT INTO COMPANY.DEPEDENT VALUES (21312332, 'Rui Costa', 'M', '20000804', 'Neto');
INSERT INTO COMPANY.DEPEDENT VALUES (321233765, 'Filho Lindo', 'M', '20010222', 'Filho');
INSERT INTO COMPANY.DEPEDENT VALUES (342343434, 'Rosa Lima', 'F', '20060311', 'Filho');
INSERT INTO COMPANY.DEPEDENT VALUES (41124234, 'Ana Sousa', 'F', '20070413', 'Neto');
INSERT INTO COMPANY.DEPEDENT VALUES (41124234, 'Gaspar Pinto', 'M', '20060208', 'Sobrinho');

CREATE TABLE COMPANY.DEPT_LOCATION (
	Dnumber		INT 		NOT NULL,
	Dlocation 	VARCHAR(60)	NOT NULL,
	CONSTRAINT PK_DEPT_LOCATION PRIMARY KEY(Dnumber, Dlocation),
	CONSTRAINT FK_DEPT_LOCATION FOREIGN KEY(Dnumber) REFERENCES COMPANY.DEPARTMENT(Dnumber)
);

INSERT INTO COMPANY.DEPT_LOCATION VALUES (2, 'Aveiro');
INSERT INTO COMPANY.DEPT_LOCATION VALUES (3, 'Coimbra');

CREATE TABLE COMPANY.PROJECT (
	Pname 		VARCHAR(20)	NOT NULL,
	Pnumber 	INT 		NOT NULL,
	Plocation 	VARCHAR(60),
	Dnum 		INT 		NOT NULL,
	CONSTRAINT PK_PROJECT PRIMARY KEY(Pnumber),
	CONSTRAINT FK_PROJECT FOREIGN KEY(Dnum) REFERENCES COMPANY.DEPARTMENT(Dnumber)
);

INSERT INTO COMPANY.PROJECT VALUES ('Aveiro Digital', 1, 'Aveiro', 3);
INSERT INTO COMPANY.PROJECT VALUES ('BD Open Day', 2, 'Espinho', 2);
INSERT INTO COMPANY.PROJECT VALUES ('Dicoogle', 3, 'Aveiro', 3);
INSERT INTO COMPANY.PROJECT VALUES ('GOPACS', 4, 'Aveiro', 3);


CREATE TABLE COMPANY.WORKS_ON (
	Essn 	DECIMAL(9,0)	NOT NULL,
	Pno 	INT 			NOT NULL,
	Hourss	DECIMAL(6,1),
	CONSTRAINT PK_WORKS_ON PRIMARY KEY(Essn, Pno),
	CONSTRAINT FK1_WORKS_ON FOREIGN KEY(Essn) REFERENCES COMPANY.EMPLOYEE(Ssn),
	CONSTRAINT FK2_WORKS_ON FOREIGN KEY(Pno) REFERENCES COMPANY.PROJECT(Pnumber)
);

INSERT INTO COMPANY.WORKS_ON VALUES (183623612, 1, 20.0);
INSERT INTO COMPANY.WORKS_ON VALUES (183623612, 3, 10.0);
INSERT INTO COMPANY.WORKS_ON VALUES (21312332, 1, 20.0);
INSERT INTO COMPANY.WORKS_ON VALUES (321233765, 1, 25.0);
INSERT INTO COMPANY.WORKS_ON VALUES (342343434, 1, 20.0);
INSERT INTO COMPANY.WORKS_ON VALUES (342343434, 4, 25.0);
INSERT INTO COMPANY.WORKS_ON VALUES (41124234, 2, 20.0);
INSERT INTO COMPANY.WORKS_ON VALUES (41124234, 3, 30.0);

--a)
-- π Pname, Pnumber, Fname , Minit, Lname, Ssn (project ⨝ Pnumber = Pno (employee ⨝ Ssn = Essn works_on))
SELECT Pname, Pnumber, Plocation, Dnum, Fname, Minit, Lname, Ssn FROM (company.project JOIN (company.employee JOIN company.works_on ON Ssn=Essn) ON Pnumber = Pno);

--b)
--π employee.Fname, employee.Minit, employee.Lname ((employee) ⨝ employee.Super_ssn=man.Ssn (ρ man (σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' (employee))))
--ou
--carlos = σ Fname = 'Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes'
--	employee
--	emp = ρ c (carlos)
--	employee ⨝ employee.Super_ssn = c.Ssn emp

SELECT e.Fname, e.Minit, e.Lname
FROM company.employee AS e JOIN 
	(SELECT  * 
		FROM company.employee
		WHERE Fname = 'Carlos' AND Minit='D' AND Lname='Gomes') 
	AS man ON e.Super_ssn = man.Ssn; 

--c)
--γ Pname; sum(Hours) -> total (works_on ⨝ Pno = Pnumber project)
SELECT Pname, SUM(Hourss) AS total FROM company.project JOIN company.works_on ON Pnumber=Pno GROUP BY Pname;

--d)
--π Fname, Minit, Lname (σ Hours > 20 ((σ Dno = 3 employee) ⨝ Ssn = Essn works_on ⨝ Pno = Pnumber (σ Pname = 'Aveiro Digital' project)))
SELECT Fname, Minit, Lname FROM (company.employee JOIN company.works_on ON Ssn=Essn AND Dno=3) JOIN company.project ON Pno=Pnumber AND Pname='Aveiro Digital' WHERE Hourss > 20;	
 
--e)
--π Fname, Minit, Lname employee - π Fname, Minit, Lname (employee ⨝ Ssn = Essn works_on)
(SELECT Fname, Minit, Lname FROM company.employee) EXCEPT (SELECT Fname, Minit, Lname FROM (company.EMPLOYEE JOIN company.WORKS_ON ON Ssn = Essn));

--f)
--γ Dname; avg(Salary) -> avgFemaleSalary (σ Sex = 'F' (employee ⨝ Dno=Dnumber department))
SELECT Dname, AVG(Salary) AS avgFemaleSalary FROM company.employee JOIN company.department ON Dno=Dnumber WHERE Sex='F' GROUP BY Dname;

--g)
--σ numDependents > 2 (γ Fname, Minit, Lname; count(Essn)-> numDependents (employee ⨝ Ssn = Essn dependent))
SELECT Fname,Minit,Lname FROM (SELECT Fname, Minit, Lname, COUNT(Essn) AS numDependents FROM COMPANY.EMPLOYEE JOIN COMPANY.DEPEDENT ON Ssn=Essn GROUP BY Fname,Minit,Lname) AS tabela WHERE tabela.numDependents > 2;

--h) 
--π Fname, Minit, Lname (employee ⨝ Ssn = Mgr_ssn department) - π Fname, Minit, Lname ((employee ⨝ Ssn = Mgr_ssn department) ⨝ Ssn = Essn dependent)(SELECT Fname, Minit, Lname FROM COMPANY.EMPLOYEE JOIN COMPANY.DEPARTMENT ON Ssn=Mgr_ssn) EXCEPT 
(SELECT Fname, Minit, Lname FROM (COMPANY.EMPLOYEE JOIN COMPANY.DEPARTMENT ON Ssn=Mgr_ssn) JOIN COMPANY.DEPEDENT ON Ssn=Essn);

--i)
--π Fname, Minit, Lname, Address
-- Pessoas que trabalham em pelo menos um proj em Aveiro
--((employee ⨝ Ssn = Essn (π Pname, Pnumber, Plocation, Essn (σ Plocation = 'Aveiro' project ⨯ works_on)))
 --				⨝ Dno = Dnumber
-- Departamentos sem localização em aveiro
--(department - π Dname, Dnumber,Mgr_ssn,Mgr_start_date (σ Dlocation = 'Aveiro' (department ⨝ dept_location))))

--ou

-- π Ssn, Fname, Minit, Lname, Address ((((employee) ⨝Ssn=Essn (works_on)) ⨝ Pno=Pnumber (σ Plocation='Aveiro' ((project)))) ⨝Dno=Dnumber  (σ Dlocation!='Aveiro' ((department) ⟕ (dept_location))))
SELECT DISTINCT Ssn, Fname, Minit, Lname, Address
FROM company.employee 
	JOIN company.works_on ON Ssn=Essn
	JOIN company.project ON Pno=Pnumber AND Plocation='Aveiro'
	JOIN (SELECT company.department.*
		  FROM (company.department LEFT OUTER JOIN company.dept_location 
		  ON company.department.Dnumber=company.dept_location.Dnumber)
		  WHERE Dlocation!='Aveiro' OR Dlocation IS NULL
		 ) AS deps ON Dno=Dnumber;