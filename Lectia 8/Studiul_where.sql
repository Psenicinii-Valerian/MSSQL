--REPETARE--
USE DEPOZIT

--PENTRU FIECARE VITEZA A LAPTOPURILOR CALCULAM MEDIA ARITMETICA--
SELECT VITEZA, AVG(PRET) AS MEDIA_PRET
FROM LAPTOPURI
GROUP BY VITEZA

--DISTINGEM MODELELE UNICALE A HDD--
SELECT HDD, COUNT(HDD) AS HDD_UNICALE
FROM LAPTOPURI
GROUP BY HDD
	HAVING COUNT(HDD)=1

--OBTINETI TOATE PC-URILE LA CARE MODELUL ESTE UNICAL--
SELECT MODEL_ID, COUNT(MODEL_ID) AS PC_UNICALE
FROM PC
GROUP BY MODEL_ID
	HAVING COUNT(MODEL_ID)=1

--STUDIUL WHERE--

/*
	SELECT CAMPURI
	FROM TABELE
	WHERE CONDITII_FUNCTII_DE_RAND
	GROUP BY GRUPARE_FUNCTII_DE_RAND
	HAVING CONDITII_FUNCTII_DE_GRUP
	ORDER BY CAMPURI
*/

--OPERATORII UTILIZATI LA STUDIUL WHERE--
/*
	1) OPERATORI DE COMPARARE (<,>,>=,<=,=,!=)
	2) OPERATORI LOGICI (IN ,BETWEEN, ALL, LIKE)
	3) OPERATORI DE PRELUCRARE A NULL (IS NULL, IS NOT NULL)

	INTRE CONDITIILE UNUI WHERE SE UTILIZEAZA OPERATORUL LOGIC 
	(AND, OR, NOT)
*/

--SA SE DETERMINE PC-URILE CU VITEZA DE 1800 MHZ CU UN PRET MAI MARE--
--DE 6000 LEI--
SELECT * FROM PC WHERE VITEZA=1800 AND PRET>6000 

--SA SE DETERMINE PC-URILE CU UN PRET MAI MARE DE 4000 LEI SI NU MAI--
--SCUMP CA 7000 LEI--
SELECT * FROM PC WHERE PRET>=4000 AND PRET<=7000
SELECT * FROM PC WHERE PRET BETWEEN 4000 AND 7000
--LA BETWEEN VALORILE UTILIZATE SUNT SI EGALE (>=4000 SI <=7000)

--SA SE DETERMINE PC-URILE CU CD DE 12X SI 24 X--
SELECT * FROM PC WHERE CD='12X' OR CD='40X'

--SA SE DETERMINE PC-URILE CU CD DE 12X SI 40 X CU UN PRET <9000 LEI--
SELECT * FROM PC WHERE (CD='12X' OR CD='40X') AND PRET<9000
SELECT * FROM PC WHERE CD IN ('12X', '40X') AND PRET<9000

--SA SE DETERMINE PC CU PRET MAI MARE DE 5000 LEI SAU CU CD DE 40X--
SELECT * FROM PC WHERE PRET>5000 OR CD='40X'
SELECT * FROM PC WHERE PRET IN (5000) OR CD IN('40X')

--SA SE DETERMINE PC CU PRET < DE 5000 LEI SAU CU CD DIFERIT DE 40X--
SELECT * FROM PC WHERE NOT(PRET>5000 OR CD='40X')

--SA SE DETERMINE PC-URILE CU PRETUL PAR--
SELECT * FROM PC WHERE CONVERT(INT, PRET) % 2=0

--SA SE DETERMINE PC-URILE CU CODUL IMPAR--
SELECT * FROM PC WHERE (MODEL_ID % 2)<>0

--STUDIUL LIKE--
SELECT * FROM PRODUSE WHERE TIP LIKE 'L%'
SELECT * FROM PRODUSE WHERE TIP LIKE '%P'
SELECT * FROM PRODUSE WHERE TIP LIKE '%P%P'
SELECT * FROM PRODUSE WHERE TIP LIKE '%P%M%E'

USE ANGAJAT
SELECT * FROM ANGAJAT WHERE NUME LIKE 'B%' AND PRENUME LIKE '%A%'

--SA SE DETERMINE ANGAJARILE ACTIVE--
SELECT * FROM ANGAJARE WHERE DATA_ELIBERARII IS NULL
SELECT * FROM ANGAJARE WHERE DATA_ELIBERARII IS NOT NULL

SELECT DATA_ELIBERARII FROM ANGAJARE WHERE DATA_ELIBERARII  IS NOT NULL

--SA SE DETERMINE TIMPUL DE CAND PERSOANELE ELIBERATE SUNT SOMERI--
SELECT *, DATEDIFF(YEAR, DATA_ELIBERARII, GETDATE()) AS SOMER 
FROM ANGAJARE WHERE (DATA_ELIBERARII IS NOT NULL)

/*
	!!! TESTARE ::
	SELECT NUME, PRENUME FROM ANGAJAT, 
	DATEDIFF(YEAR, DATA_ELIBERARII, GETDATE()) AS SOMER 
	FROM ANGAJARE WHERE (DATA_ELIBERARII IS NOT NULL)

	SELECT [ANGAJAT.]NUME, [ANGAJAT.]PRENUME, [ANGAJARE].DATA_ANGAJARII
	FROM ANGAJAT, ANGAJARE
*/


