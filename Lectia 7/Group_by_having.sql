--FUNCTIA DE RAND + FUNCTIA DE GRUP--

--PENTRU FIECARE PRET DE PC SA SE DETERMINE NUMARUL DE REPETARI--	
SELECT DISTINCT PRET FROM PC

SELECT RAM, HDD
FROM PC 
GROUP BY RAM, HDD

SELECT DISTINCT RAM, HDD 
FROM PC

SELECT PRET, COUNT(*) AS NR
FROM PC
GROUP BY PRET

--REGULA: IN SITUATIA IN CARE INTR-UN SELECT SE UTILIEZEAZA O FUNCTIE
--DE RAND SI UNA DE GRUP, ESTE OBLIGATOR DE UTILIZAT FUNCTIA GROUP BY--

--PENTRU FIECARE RAM SI HDD SA SE DETERMINE NR DE PIESE--
SELECT RAM, HDD, COUNT(*) AS NRR
FROM PC
GROUP BY RAM, HDD

--PENTRU FIECARE PRODUCATOR SA SE DETERMINE NR DE PRODUSE--
SELECT PRODUCATOR, COUNT(*) AS NR_PRODUSE
FROM PRODUSE
GROUP BY PRODUCATOR

--PENTRU FIECARE PRODUCATOR SA SE DETERMINE NR TOTAL DE PRODUSE SI NR
--UNICAL DE TIPURI DE PRODUSE--
SELECT PRODUCATOR, COUNT(DISTINCT TIP) AS NR_TIP,
	   COUNT(*) AS NR_PRODUSE
FROM PRODUSE
GROUP BY PRODUCATOR

SELECT DISTINCT TIP
FROM PRODUSE

--PENTRU FIECARE DIMENSIUNE A ECRANULUI LAPTOPULUI SA SE DETERMINE
--CANTITATEA DE LAPTOPURI SI SUMA TOTALA A COSTULUI--
SELECT 
		ECRAN, 
		COUNT(LAPTOP_ID) AS CANTITATEA_LAPTOPURI,
		SUM(PRET) AS SARCINA_ECRAN
FROM LAPTOPURI
GROUP BY ECRAN

--PENTRU FIECARE TIP DE IMPRIMANTA SA SE DETERMINE NUMARUL DE 
--MODELE TOTAL, NR DE MODELE UNICALE, PRETUL MAXIM SI PRETUL MINIM
SELECT
		TIP, 
		COUNT(*) AS TOTAL_MODELE,
		COUNT(DISTINCT MODEL_ID) AS MODELE_UNICALE,
		MAX(PRET) AS PRETUL_MAXIM,
		MIN(PRET) AS PRETUL_MINIM
FROM IMPRIMANTE
GROUP BY TIP

--PENTRU FIECARE VITEZA A LAPTOPURILOR SA SE DETERMINE MEDIA 
--ARITMETICA A PRETULUI, SUMA DINTRE PRETUL MINIMAL SI CEL MAXIMAL
SELECT 
		VITEZA, AVG(PRET) AS MEDIA_PRETURI,
		MAX(PRET) + MIN(PRET) AS SUMA_MAX_MIN
FROM LAPTOPURI
GROUP BY VITEZA

--STUDIUL HAVING--
--HAVING-UL SE UTILIEZEAZA DOAR DUPA APARITIA LUI GROUP BY SI ARE 
--SCOPUL DE A FILTRA INFORMATIA DUPA FUNCTIA DE GRUP--

/*
	SELECT CIMPURI
	FROM TABELE
	WHERE CONDITII_PU_FUNCTII_DE_RIND
	GROUP BY GRUPARE_FUNCTII_DE_RIND
	HAVING CONDITII_PENTRU_FUNCTII_DE_GRUP
*/

--SA SE DETERMINE PRODUCATORII CARE PRODUC CEL PUTIN 2 TIPURI 
--DE PRODUSE--
SELECT 
		PRODUCATOR, COUNT(DISTINCT(TIP)) AS NRR
FROM PRODUSE
GROUP BY PRODUCATOR
	HAVING COUNT(DISTINCT(TIP))>0

--SA SE DETERMINE TOATE PC-URILE LA CARE VALOAREA DISCULUI DUR ESTE
--REPETITIVA--
SELECT
		MODEL_ID AS PC,
	    COUNT(DISTINCT HDD) AS HDD_REP
FROM PC
GROUP BY MODEL_ID
	HAVING COUNT(DISTINCT HDD)>1

--SA SE DETERMINE PC-URILE LA CARE VALOAREA VITEZEI ESTE UNICALA--
SELECT 
		MODEL_ID AS PC,
		COUNT(DISTINCT VITEZA) AS VITEZA_UNICALA
FROM PC
GROUP BY MODEL_ID
	HAVING COUNT(DISTINCT VITEZA)=1
