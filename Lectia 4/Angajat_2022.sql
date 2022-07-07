--POPULARE DATABASE ANGAJAT--

INSERT INTO RAION(DENUMIRE)
VALUES  ('TELENESTI'),
		('CRIULENI'),
		('DROCHIA'),
		('FLORESTI'),
		('TARACLIA'),
		('ORHEI'),
		('NISPORENI'),
		('SOROCA'),
		('BRICENI'),
	    ('CAHUL')

INSERT INTO STRADA(DENUMIRE)
VALUES (''),
	   ('Stefan Cel Mare'),
	   ('Ion Creanga'),
	   ('Belinski'),
	   ('Ioan Livescu'),
	   ('Vasile Lupu'),
	   ('Columna'),
	   ('Veronica Micle'),
	   ('Vasile Alecsandri'),
	   ('Pushkin'),
	   ('Pavel Botu'),
	   ('Vasile Dokuceaev'),
	   ('Vlad Tepes'),
	   ('Alexei Sciusev'),
	   ('Alexei Mateevici')

INSERT INTO FUNCTIE (DENUMIRE_FUNCTIE)
VALUES  ('PRESEDINTE'),
		('VICEPRESEDINTE'),
		('DIRECTOR'),
		('DIRECTOR ADJUNCT'),
		('DIRECTOR FINANCIAR'),
		('ECONOMIST'),
		('INGINER'),
		('PROGRAMATOR'),
		('SEF'),
		('INGINE SOFTWARE'),
		('IT PROJECT MANAGER'),
		('DIGITAL MARKETING MANAGER'),
		('GRAPHIC DESIGNER'),
		('HR MANAGER'),
		('ANALIST FINANCIAR'),
		('DERIDICATOARE'),
		('BODYGUARD'),
		('SOFER'),
		('INCASATOR'),
		('CASIER'),
		('CONTABIL'),
		('ADMINISTRATOR BD'),
		('ADMINISTRATOR APLICATII'),
		('SPECIALIST AML'),
		('LACATUS'),
		('MECANIC-SEF'),
		('SEFA DJUNCT'),
		('JURISCONSULT'),
		('OFITER BANCAR'),
		('ANALIST'),
		('MANAGER RELATII CU CLIENTI MASS MARKET'),
		('MANAGER RELATII CU CLIENTI IMM'),
		('MANAGER RELATII CU CLIENTI PREMIUM'),
		('OFITER SECURITATE INFORMATIONALA'),
		('SPECIALIST CONTROL RISC'),
		('JURISCONSULT'),
		('OFITER BANCAR'),
		('ANALIST'),
		('MANAGER RELATII CU CLIENTI MASS MARKET'),
		('MANAGER RELATII CU CLIENTI IMM'),
		('MANAGER RELATII CU CLIENTI PREMIUM'),
		('OFITER SECURITATE INFORMATIONALA'),
		('SPECIALIST CONTROL RISC')

INSERT INTO DEPARTAMENT(DENUMIRE_DEPART)
VALUES  ('IT'),
		('AUDIT INTERN'),
		('CONFORMITATE'),
		('RISCURI BANCARE'),
		('HR'),
		('LOGISTICA'),
		('LEGALITATE'),
		('CARDURI BANCARE'),
		('CONTABILITATE SI RAPORTARE'),
		('CREDITE PROBLEMATICE'),
		('SECURITATEA INFORMATIEI'),
		('SECURITATE'),
		('CORPORATE'),
		('PLANIFICARE SI CONTROL'),
		('MARKETING'),
		('STRATEGIE SI BI'),
		('PRODUSE BANCARE'),
		('RETEA SI CANALE ALTERNATIVE'),
		('OPERATIUNI'),
		('ANTICAMERA'),
		('HR'),
		('LEGALITATE'),
		('CONTABILITATE SI RAPORTARE'),
		('CREDITE PROBLEMATICE'),
		('SECURITATEA INFORMATIEI'),
		('SECURITATE'),
		('CORPORATE'),
		('PLANIFICARE SI CONTROL'),
		('MARKETING'),
		('STRATEGIE SI BI'),
		('PRODUSE BANCARE'),
		('RETEA SI CANALE ALTERNATIVE'),
		('TREZORERIE')


DELETE DEPARTAMENT

INSERT INTO DEPARTAMENT(DENUMIRE_DEPART)
VALUES  ('IT'),
		('AUDIT INTERN'),
		('CONFORMITATE'),
		('RISCURI BANCARE'),
		('HR'),
		('LOGISTICA'),
		('LEGALITATE'),
		('CARDURI BANCARE'),
		('CONTABILITATE SI RAPORTARE'),
		('CREDITE PROBLEMATICE'),
		('SECURITATEA INFORMATIEI'),
		('SECURITATE'),
		('CORPORATE'),
		('PLANIFICARE SI CONTROL'),
		('MARKETING'),
		('STRATEGIE SI BI'),
		('PRODUSE BANCARE'),
		('RETEA SI CANALE ALTERNATIVE'),
		('OPERATIUNI'),
		('ANTICAMERA'),
		('HR'),
		('LEGALITATE'),
		('CONTABILITATE SI RAPORTARE'),
		('CREDITE PROBLEMATICE'),
		('SECURITATEA INFORMATIEI'),
		('SECURITATE'),
		('CORPORATE'),
		('PLANIFICARE SI CONTROL'),
		('MARKETING'),
		('STRATEGIE SI BI'),
		('PRODUSE BANCARE'),
		('RETEA SI CANALE ALTERNATIVE'),
		('TREZORERIE')

UPDATE DEPARTAMENT SET DEPARTAMENT_ID=DEPARTAMENT_ID-33

INSERT INTO LOCALITATE(DENUMIRE, RAION_ID)
VALUES  ('or.TELENESTI', 1),
		('s.TINTARENI', 1),
		('s.BANESTI', 1),
		('s.BRINZENII NOI',  1),
		('or.CRIULENI', 2),
		('s.PASCNI', 2),
		('s.RATUS', 2),
		('or.DROCHIA', 3),
		('s.CHETROSU', 3),
		('or.FLORESTI', 4),
		('or.GHINDESTI', 4),
		('or.TARACLIA', 5),
		('s.ALUATU', 5),
		('or.ORHEI', 6),
		('s.PELIVAN', 6),
		('or.NISPORENI', 7),
		('s.GROZETI', 7),
		('or.SOROCA', 8),
		('s.COSAUTI', 8),
		('or.BRICENI', 9),
		('s.BULBOACA', 9)

INSERT INTO LOC_STR(LOCALITATE_ID,STRADA_ID)
VALUES  (1, 1),
		(5, 12),
		(7, 11),
		(2, 15),
		(3, 2),
		(4, 3),
		(10, 5),
		(9, 10),
		(12, 9),
		(10, 8),
		(6, 6),
		(5, 14),
		(3, 8),
		(3, 9),
		(7, 15),
		(10, 10),
		(4, 13),
		(17, 13),
		(18, 1),
		(12, 2),
		(18, 2),
		(18, 3),
		(14, 14),
		(4, 8),
		(1, 8),
		(2, 9),
		(2, 10),
		(7, 3),
		(7, 4),
		(7, 7)

INSERT INTO ANGAJAT(NUME, PRENUME, DATA_NAST, GEN, IDNP, BLOC, NR, LOC_STR_ID)
VALUES  ('Ciotu', 'Ion', '2000-12-10', 1, '1234567825412', '10', '12', 1),
		('Moraru', 'Ionela', '1990-12-20', 0, '1234567825413', '10/3', '2', 2),
		('Ursu', 'Marius', '1995-10-23', 1, '1234567825414', '', '3', 3  ),
		('Rusu', 'Robert', '1998-12-17', 1, '1234567825415', '', '4', 4),
		('Manole', 'Madalina', '2000-12-12', 0, '1234567825416', '5', '13', 5),
		('Cebotari', 'Dumitru', '1995-12-20', 1, '1234567825417', '', '6', 12),
		('Myers', 'Frank', '2001-06-30', 1, '1234567825418', '2', '13', 7),
		('Covali', 'Alina', '1998-01-13', 0, '1234567825419', '14', '12', 8),
		('Cretu', 'Ruxanda', '1999-09-08', 0, '1234567825420', '15', '14', 9),
		('Ungureanu', 'Tudor', '1997-08-07', 1, '1234567825421', '', '10',9),
		('Macovei', 'Elisa', '1999-09-19', 0, '1234567825422', '', '11',12),
		('Sandu', 'Ilinca', '1994-03-04', 0, '1234567825423', '12', '14', 12),
		('Buruiana', 'Gabriel', '1995-05-05', 1, '1234567825424', '2', '15', 13),
		('Cotorobai', 'Ovidiu', '1999-08-01', 1, '1234567825425', '','',14),
		('Popov', 'Daniel', '1996-08-07', 1, '1234567825426', '','',15),
		('Frunza', 'Marius', '1994-01-31', 1, '1234567825427', '', '16',1),
		('Covali', 'Cornel', '2000-08-11', 1, '1234567825428', '6', '6', 17),
		('Harea', 'Cristian', '2002-08-22', 1, '1234567825429', '7', '10', 18),
		('Popov', 'Ion', '1997-06-04', 1, '1234567825430', '', '19', 11),
		('Serious', 'Sam', '2000-05-21', 1, '1234567825431', '17', '12', 20),
		('Clima', 'Vladislav', '1992-09-25', 1, '1234567825432', '19', '16', 21),
		('Bivol', 'Alexandru', '2004-12-28', 1, '1234567825433', '', '22', 19),
		('Cotorobai', 'Mia', '1997-03-03', 0, '1234567825434', '5', '110', 23),
		('Climova', 'Florentina', '1996-11-11', 0, '1234567825435', '', '24',12),
		('Rusu', 'Alexandra', '1999-12-12', 0, '1234567825436', '17', '19', 25),
		('Esanu', 'Maria', '1995-10-15', 0, '1234567825437', '', '26', 2),
		('Bivol', 'Maxim', '1998-07-17', 1, '1234567825438', '13', '123', 27),
		('Pislaru', 'Emanuel', '2001-09-13', 1, '1234567825439', '', '28', 3),
		('Calinescu', 'George', '1993-04-17', 1, '1234567825440', '', '29', 4),
		('Alba', 'Cristina', '2001-06-06', 0, '1234567825441', '13', '161A', 30),
		('Stratan', 'Eugenia', '2007-03-30', 0, '1234567825442', '', '30', 29),
		('Popova', 'Eugenia', '1998-10-10', 0, '1234567825443', '', '30', 18),
		('Lemnaru', 'Ion', '1997-11-17', 1, '1234567825444', '1', '14', 28),
		('Cazacu', 'Octavian', '1998-09-09', 1, '1234567825445', '', '4', 20),
		('Popa', 'Vlad', '2000-03-20', 1, '1234567825446', '14', '121', 15),
		('Plop', 'Vlada', '1996-12-29', 0, '1234567825447', '', '2', 6),
		('Cotofana', 'Sergiu', '2001-09-07', 1, '1234567825448', '3', '156', 22),
		('Smith', 'Will', '1994-04-01', 1, '1234567825449', '', '20', 12),
		('Mardari', 'Elisaveta', '1999-07-09', 0, '1234567825450', '13', '98', 2),
		('ELISEI', 'MARTINIUC', '1990-12-04', 1, '1234567825451', '','', 1)

UPDATE ANGAJAT SET ANGAJAT_ID=ANGAJAT_ID-26

INSERT INTO ANGAJARE(ANGAJAT_ID, FUNCTIE_ID, DEPARTAMENT_ID, SALARIU, CONTRACTE, BONUS_SALARIU, PENALITATI_SALARIU, DATA_ANGAJARII, DATA_ELIBERARII)
VALUES 
		(1, 1, 1, 10000, '2348756', 100, 100, '2000-08-01', '2013-08-01'),
		(2, 2, 2, 22000, '34566', 0, 500, '2007-08-01', NULL),
		(2, 4, 8, 5000, '077863', 0, 0, '2010-10-18', NULL),
		(3, 2, 2, 30000, '78932', 1000, 0, '2001-09-02', NULL),
		(4, 3, 9, 10000, '2348756', 0, 0, '2005-08-01', '2013-08-01'),
		(5, 29, 14, 7000, '459762', 200, 50, '2014-08-01', NULL),
		(6, 9, 26, 50000, '24557356', 0, 0, '2020-08-01', NULL),
		(7, 14, 3, 9000, '245723452134', 0, 0, '2000-04-01', NULL),
		(8, 8, 10, 15000, '2356', 1000, 500, '2018-08-01', NULL),
		(9, 17, 16, 30000, '23411236', 0, 0, '2003-08-01', NULL),
		(10, 38, 23, 2000, '235678756', 0, 0, '2009-08-01', NULL),
		(11, 11, 11, 60000, '256721435', 5000, 10000, '2014-08-01', '2022-01-05'),
		(12, 12, 19, 40000, '2355688756', 0, 0, '2010-08-01', NULL),
		(12, 15, 13, 9000, '23948756', 0, 0, '2014-08-01', NULL),
		(13, 7, 14, 80000, '23567653856', 2000, 0, '2019-08-01', NULL),
		(14, 23, 2, 16000, '235666756', 0, 0, '2001-08-01', NULL),
		(15, 15, 15, 12000, '235699756', 0, 0, '2017-08-01', NULL),
		(15, 34, 15, 9000, '23533356', 0, 0, '2019-08-01', NULL),
		(16, 2, 23, 12000, '23455699756', 0, 0, '2004-08-01', NULL),
		(17, 3, 3, 6000, '235333756', 0, 0, '2007-08-01', NULL),
		(18, 18, 18, 12000, '2222699756', 1000, 200, '2003-08-01', NULL),
		(19, 4, 7, 40000, '233339756', 0, 0, '2008-08-01', NULL),
		(20, 7, 15, 12000, '23545756', 0, 0, '2009-08-01', NULL),
		(21, 17, 18, 78000, '235339756', 2000, 500, '2002-09-02', NULL),
		(22, 5, 5, 56000, '234679756', 0, 0, '2007-12-15', NULL),
		(22, 7, 24, 6000, '24479756', 0, 0, '2016-12-03', NULL),
		(23, 14, 19, 9000, '634679886', 0, 0, '2009-11-15', NULL),
		(24, 8, 17, 56000, '934679756', 0, 0, '2014-09-15', NULL),
		(25, 5, 5, 15000, '8934679756', 0, 0, '2006-07-15', NULL),
		(26, 12, 26, 17000, '894679756', 2000, 200, '2014-08-15', NULL),
		(27, 23, 10, 26000, '7894679756', 0, 0, '2002-12-15', NULL),
		(28, 1, 1, 10000, '2348756', 100, 100, '2000-08-01', '2013-08-01'),
		(29, 2, 2, 22000, '34566', 0, 500, '2007-08-01', NULL),
		(29, 4, 8, 5000, '077863', 0, 0, '2010-10-18', NULL),
		(30, 2, 2, 30000, '78932', 1000, 0, '2001-09-02', NULL),
		(31, 3, 9, 10000, '2348756', 0, 0, '2005-08-01', '2013-08-01'),
		(32, 12, 7, 7000, '459762', 200, 50, '2014-08-01', NULL),
		(33, 9, 6, 50000, '24557356', 0, 0, '2020-08-01', NULL),
		(33, 14, 3, 9000, '245723452134', 0, 0, '2000-04-01', NULL),
		(34, 8, 10, 15000, '2356', 1000, 500, '2018-08-01', NULL),
		(35, 17, 7, 30000, '23411236', 0, 0, '2003-08-01', NULL),
		(36, 15, 3, 2000, '235678756', 0, 0, '2009-08-01', NULL),
		(36, 11, 5, 60000, '256721435', 5000, 10000, '2014-08-01', '2022-01-05'),
		(37, 12, 5, 40000, '2355688756', 0, 0, '2010-08-01', NULL),
		(38, 15, 1, 9000, '23948756', 0, 0, '2014-08-01', NULL),
		(39, 7, 9, 80000, '23567653856', 2000, 0, '2019-08-01', NULL),
		(39, 5, 2, 16000, '235666756', 0, 0, '2001-08-01', NULL),
		(15, 6, 11, 12000, '235699756', 0, 0, '2017-08-01', NULL)

DELETE ANGAJARE
UPDATE ANGAJARE SET ANGAJARE_ID=ANGAJARE_ID-6