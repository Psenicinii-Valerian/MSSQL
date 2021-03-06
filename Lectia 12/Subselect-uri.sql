--SA SE UNIFICE SALARIUL, DEPARTAMENTUL SI FUNCTIA ANGAJATILOR--
SELECT ' SALARY ' AS TIP, SALARIU FROM ANGAJAT AN INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
UNION
SELECT DENUMIRE_DEPART, 1 FROM DEPARTAMENT D INNER JOIN ANGAJARE A ON D.DEPARTAMENT_ID = A.DEPARTAMENT_ID
UNION 
SELECT DENUMIRE_FUNCTIE, 2 FROM FUNCTIE F INNER JOIN ANGAJARE A ON F.FUNCTIE_ID = A.FUNCTIE_ID
ORDER BY SALARIU

--STUDIUL CASE--
/*
	1) CASE - alegerea unei variante din cele mai multe posibile--
	SINTAXA 1:
	(case nume_camp when conditie then rezultat when conditie 2 then rezultat 2... 
	else rezultat_n end)
*/

USE ANGAJAT
SELECT *, CONCAT( IIF( DAY( LEN( CONVERT (VARCHAR(2), DATA_NAST) ) ) = 1, 
		  CONCAT( '0', DAY(DATA_NAST) ), DAY(DATA_NAST) ), '',
			
		  (CASE MONTH(DATA_NAST) WHEN 12 THEN ' DECEMBRIE ' WHEN 8 THEN ' AUGUST ' WHEN 1 THEN ' IANUARIE ' 
		   ELSE ' - ' END), ', ', YEAR(DATA_NAST) ) AS DATA1,

		   CONVERT(VARCHAR(50),DATA_NAST,106 ) AS DATA2
FROM ANGAJAT


SELECT *, CONCAT( IIF( DAY(DATA_NAST) < 10, CONCAT( '0', DAY(DATA_NAST) ), CONVERT( VARCHAR(2), DAY(DATA_NAST) ) ) ,' ',

		  (CASE MONTH(DATA_NAST) WHEN 12 THEN ' DECEMBRIE ' WHEN 8 THEN ' AUGUST ' WHEN 1 THEN ' IANUARIE ' 
		   ELSE ' - ' END), ', ', YEAR(DATA_NAST) ) AS DATA1,

		   CONVERT( VARCHAR(50), DATA_NAST, 106 ) AS DATA2
FROM ANGAJAT

--2) CASE - INLOCUIREA LUI IF--
--(CASE WHEN CONDITIE THEN REZULTAT WHEN CONDITIE THEN REZULTAT ... END)--

SELECT *, (CASE WHEN GEN=1 THEN 'MASCULIN' ELSE 'FEMININ' END) FROM ANGAJAT

--SUBINTEROGARI--

/*
	1) Daca subselectul apare in calitate de camp afisabil, inseamna ca subselectul este alcuit dintr-un singur camp cu 
	   o singura valoare. De obieci, se utilieaza functiile de grup.
	2) Daca subselectul apare in calitate de tabela, inseamna ca subselectul este alcatuit din mai multe campuri cu 
	   mai multe valori. Acest subselect se numeste tabela virtuala.
	3) Daca subselectul apare in where, putem avea 2 cazuri:
	   -Returneaza o singura valoare cu un singur camp. Se prelucreaza cu operatorii de comparare
	   -Returneaza mai multe valori cu un singur camp. Se prelucreaza cu operaorii logici: all, any, in
*/

--SA SE DETERMINE PC-UL CEL MAI SCUMP--

USE DEPOZIT
SELECT * FROM PC WHERE PRET = (SELECT MAX(PRET) FROM PC)

--SA SE DETERMINE PENTRU FIECARE MODEL DE PC - NUMARUL DE PRODUSE--

--METODA 1--
SELECT MODEL_ID, COUNT(*) AS NR_PRODUSE FROM PC GROUP BY MODEL_ID

--METODA 2--
SELECT PC.MODEL_ID, 
	(SELECT COUNT(*) FROM PC P WHERE P.MODEL_ID = PC.MODEL_ID) AS  NR_PRODUSE 
FROM PC GROUP BY PC.MODEL_ID

--SA SE DETERMINE PENTRU FIECARE LAPTOP NR DE PIESE SI SUMA TOTALA A PRODUSELOR--

--METODA 1--
SELECT L.MODEL_ID,
	(SELECT COUNT(*) FROM LAPTOPURI LL WHERE LL.MODEL_ID = L.MODEL_ID) AS NR_PIESE,
	(SELECT SUM(PRET) FROM LAPTOPURI LL WHERE LL.MODEL_ID = L.MODEL_ID) AS SUMA_PRET
FROM LAPTOPURI L GROUP BY L.MODEL_ID

--METODA 2--
SELECT MODEL_ID, COUNT(*) AS NR_PIESE, SUM(PRET) AS SUMA_PRET FROM LAPTOPURI GROUP BY MODEL_ID

--SA SE DETERMINE PENTRU FIECARE MODEL DE IMPRIMANTE :
--1) NUMARUL DE PIESE
--2) NUMARUL DE PIESE LASER
--3) NUMARUL DE PIESE MATRIX
--4) SUMA PRETULUI PIESELOR COLOR

SELECT I.MODEL_ID,
	(SELECT COUNT(*) FROM IMPRIMANTE II WHERE II.MODEL_ID = I.MODEL_ID) AS NR_PIESE,
	(SELECT COUNT(*) FROM IMPRIMANTE III WHERE III.TIP = 'LASER' AND III.MODEL_ID = I.MODEL_ID) AS NR_PIESE_LASER,
	(SELECT COUNT(*) FROM IMPRIMANTE CI WHERE CI.TIP LIKE 'MA%' AND CI.MODEL_ID = I.MODEL_ID) AS NR_PIESE_MATRIX,
	(SELECT ISNULL(SUM(PRET),0) FROM IMPRIMANTE SI WHERE SI.COLOR = 'DA' AND SI.MODEL_ID = I.MODEL_ID) AS SUMA_PIESE_COLOR
FROM IMPRIMANTE I GROUP BY I.MODEL_ID

--PENTRU FIECARE TIP DE IMPRIMANTA SA SE DETERMINE SUMA COSTULUI SI NUMARUL DE PIESE--
SELECT I.TIP,
	(SELECT SUM(PRET) FROM IMPRIMANTE TI WHERE TI.TIP = I.TIP) AS SUMA_PRET,
	(SELECT COUNT(*) FROM IMPRIMANTE CI WHERE CI.TIP = I.TIP) AS NR_PIESE
FROM IMPRIMANTE I GROUP BY I.TIP
ORDER BY SUMA_PRET

--PENTRU FIECARE VITEZA A PC-ULUI SA SE DETERMINE NUMARUL DE PIESE AL LAPTOPURILOR CU ACEEASI VITEZA--
SELECT PC.VITEZA,
	(SELECT COUNT(*) FROM LAPTOPURI L WHERE L.VITEZA = PC.VITEZA) AS NR_PIESE
FROM PC GROUP BY PC.VITEZA

SELECT * FROM LAPTOPURI L WHERE L.VITEZA = 1800

--PENTRU FIECARE PRODUCATOR DE PC SA SE DETERMINE :
--1) NUMARUL TOTAL DE PRODUSE 
--2) NUMARUL UNICAL DE PRODUSE
--3) NUMARUL DE PRODUSE CARE AU CD

SELECT P.PRODUCATOR,
	(SELECT COUNT(*) FROM PRODUSE PP INNER JOIN PC ON PC.MODEL_ID = PP.MODEL_ID WHERE PP.PRODUCATOR = P.PRODUCATOR) AS NR_PROD,
	(SELECT COUNT(DISTINCT(PD.MODEL_ID)) FROM PRODUSE PD INNER JOIN PC ON PC.MODEL_ID = PD.MODEL_ID 
		WHERE PD.PRODUCATOR = P.PRODUCATOR) AS PROD_DIST,
	(SELECT COUNT(*) FROM PRODUSE PP INNER JOIN PC ON PC.MODEL_ID = PP.MODEL_ID 
		WHERE CD IS NOT NULL AND PP.PRODUCATOR = P.PRODUCATOR) AS PRODUSE_CU_CD
FROM PRODUSE P
WHERE TIP = 'PC'	
GROUP BY P.PRODUCATOR

