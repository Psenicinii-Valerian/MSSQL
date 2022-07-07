--DATABASE ANGAJAT

CREATE TABLE RAION
(
	RAION_ID int primary key identity(1,1),
	DENUMIRE varchar(30),
)

CREATE TABLE LOCALITATE
(
	LOCALITATE_ID int primary key identity(1,1),
	RAION_ID int foreign key references RAION(RAION_ID),
	DENUMIRE varchar(30),
)

CREATE TABLE STRADA
(
	STRADA_ID int primary key identity(1,1),
	DENUMIRE varchar(30),
)

CREATE TABLE LOC_STR
(
	LOC_STR_ID int primary key identity(1,1),
	LOCALITATE_ID int foreign key references LOCALITATE(LOCALITATE_ID),
	STRADA_ID int foreign key references STRADA(STRADA_ID),
)

CREATE TABLE ANGAJAT
(
	ANGAJAT_ID int primary key identity(1,1),
	LOC_STR_ID int foreign key references LOC_STR(LOC_STR_ID),
	NUME varchar(20),
	PRENUME varchar(20),
	DATA_NAST datetime,
	GEN bit,
	IDNP varchar(13),
	BLOC varchar(5),
	NR varchar (5),
)

CREATE TABLE FUNCTIE
(
	FUNCTIE_ID int primary key identity(1,1),
	DENUMIRE_FUNCTIE varchar(20),
)

CREATE TABLE DEPARTAMENT
(
	DEPARTAMENT_ID int primary key identity(1,1),
	DENUMIRE_DEPART varchar(20),
)

CREATE TABLE ANGAJARE
(
	ANGAJARE_ID int primary key identity(1,1),
	ANGAJAT_ID int foreign key references ANGAJAT(ANGAJAT_ID),
	FUNCTIE_ID int foreign key references FUNCTIE(FUNCTIE_ID),
	DEPARTAMENT_ID int foreign key references DEPARTAMENT(DEPARTAMENT_ID),
	SALARIU decimal(8,2),
	CONTRACTE varchar(50),
	BONUS_SALARIU decimal(5,2),
	PENALITATI_SALARIU decimal(5,2),
	DATA_ANGAJARII datetime,
	DATA_ELIBERARII datetime,
)