--STUDIUL FUNCTIILOR DE RAND--
USE ANGAJAT

--FUNCTII DE RAND PENTRU PRELUCRAREA DATEI--
YEAR(NUME_CAMP) - EXTRAGE ANUL
MONTH(NUME_CAMP) - EXTRAGE LUNA

--PENTRU A MODIFICA O DATA SE POATE DE UTILIZAT--
--FUNCTIA DATEADD(DAY/MONTH/YEAR,NUMARUL_LOR, DATA_LA_CARE_SE_APLICA)--

--PENTRU A SE FACE DIFERENTA DINTRE 2 DATE SE VA UTILIZA--
--FUNCTIA DATEDIFF( DAY/MONTH/YEAR, DATA1, DATA2 )--

SELECT *,
YEAR(DATA_NAST) AS AN, 
MONTH(DATA_NAST) AS LUNA,
DAY(DATA_NAST) AS ZIUA,
CONCAT(DAY(DATA_NAST),'.',MONTH(DATA_NAST),'.',YEAR(DATA_NAST)) AS DATA1,
CONVERT(VARCHAR, DATA_NAST, 104) AS DATA2,
DATEADD(DAY,10,DATA_NAST) AS DATA_NAST_10,
DATEADD(MONTH,-1,DATA_NAST) AS DATA_NAST_1,
DATEADD(YEAR,-45,DATA_NAST) AS DATA_NAST_45,
DATEDIFF(YEAR,DATA_NAST,GETDATE()) AS DIF_ANI,
DATEDIFF(DAY,DATA_NAST,GETDATE()) AS DIF_ZILE
FROM ANGAJAT

--FUNCTII DE GRUP. STUDIUL GROUP BY SI HAVING--
USE DEPOZIT

--APLICAM SUMA--
SELECT SUM(PRET) AS SUMA FROM PC

--CANTITATEA COUNT({NUME_CAMP|*})
SELECT COUNT(*) AS CANTITATE_1, COUNT(MODEL_ID) AS CANTITATE_2 FROM PC
SELECT * FROM PC

--SA SE DETERMINE NUMARUL DE PRODUCATORI--
SELECT COUNT(*), COUNT(PRODUCATOR) FROM PRODUSE,
SELECT * FROM PRODUSE

--SA SE DETERMINE NUMARUL DE PRODUCATORI UNICALI--
SELECT COUNT(*) AS TOTAL, COUNT(DISTINCT PRODUCATOR) AS DIFERITI FROM PRODUSE,

--DISTINCT SE IA IN FUNCTIE DE TOATE CAMPURILE CE LE VEDE DUPA EL
SELECT DISTINCT PRODUCATOR, TIP FROM PRODUSE

--MIN/MAX--
SELECT MIN(PRET) AS MINIM, MAX(PRET) AS MAXIM FROM LAPTOPURI

--AVG() - MEDIA ARITMETICA--
SELECT AVG(PRET) AS MEDIA_PRET, AVG(HDD) AS MEDIA_HDD FROM LAPTOPURI

--ROUND(NUME_CAMP,CIFRE_DUPA_VIRGULA)
SELECT  ROUND(AVG(PRET),2) AS ROUND_MEDIA_PRET, 
	    ROUND(AVG(HDD),2) AS ROUND_MEDIA_HDD, 
		CAST(AVG(PRET) AS DECIMAL(9,2)) AS CAST_DECIMAL_PRET,
		CAST(AVG(HDD) AS DECIMAL(4,0)) AS CAST_DECIMAL_HDD,
		CONVERT(DECIMAL(18,2), AVG(PRET)) AS CONVERT_DECIMAL_PRET,
		CONVERT(DECIMAL(18,1), AVG(HDD)) AS CONVERT_DECIMAL_PRET,
		SUM(HDD)/COUNT(*) AS MEDIA2
FROM LAPTOPURI

--SARCINA IN CLASA--

USE ANGAJAT
SELECT
	MAX(YEAR(DATA_NAST)) + MIN(DAY(DATA_NAST)) AS SARCINA_2
FROM ANGAJAT 

USE DEPOZIT
SELECT
		ROUND(COUNT(*) - MAX(HDD) - MIN(RAM) + AVG(PRET) + SUM(ECRAN),2) AS SARCINA_GROUPBY
FROM LAPTOPURI

	
