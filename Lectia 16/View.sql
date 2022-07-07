--STUDIUL VIEW--
--VIEW - NE PERMITE SA CREAM UN FEL DE TABELE VIRTUALE PENTRU A PRELUCRA DIRECT CAMPURILE ACESTUIA(CA LA TABELE FIZICE)--

--SA SE GASEASCA ANGAJATUL CE PRIMESTE CEL MAI MARE SALARIU--
ALTER FUNCTION EX1()
RETURNS TABLE
AS
	RETURN 
	(
		SELECT CONCAT(NUME, ' ', PRENUME) AS NPP, SUM(SALARIU) AS SUMA FROM ANGAJARE A 
																	   INNER JOIN ANGAJAT AN ON A.ANGAJAT_ID = AN.ANGAJAT_ID
		WHERE DATA_ELIBERARII IS NULL 
		GROUP BY CONCAT(NUME, ' ', PRENUME)
	) 

SELECT * FROM DBO.EX1() WHERE SUMA = (SELECT MAX(SUMA) FROM DBO.EX1() )

--EFECTUAREA PRIN VIEW
CREATE VIEW ANG_SAL AS 
SELECT CONCAT(NUME, ' ', PRENUME) AS NPP, SUM(SALARIU) AS SUMA FROM ANGAJARE A 
															   INNER JOIN ANGAJAT AN ON A.ANGAJAT_ID = AN.ANGAJAT_ID
		WHERE DATA_ELIBERARII IS NULL 
		GROUP BY CONCAT(NUME, ' ', PRENUME)

SELECT * FROM ANG_SAL WHERE SUMA = (SELECT MAX(SUMA) FROM ANG_SAL)

--SA SE GASEASCA PRODUSUL CEL MAI SCUMP, PRIN VIEW--
CREATE VIEW PRODD AS
SELECT TIP,PRODUCATOR,P.MODEL_ID,PRET FROM PC INNER JOIN PRODUSE P ON P.MODEL_ID=PC.MODEL_ID
	UNION
SELECT TIP,PRODUCATOR,P.MODEL_ID,PRET FROM LAPTOPURI L INNER JOIN PRODUSE P ON P.MODEL_ID=L.MODEL_ID
	UNION
SELECT P.TIP,PRODUCATOR,P.MODEL_ID,PRET FROM IMPRIMANTE I INNER JOIN PRODUSE P ON P.MODEL_ID=I.MODEL_ID

SELECT * FROM PRODD WHERE PRET = (SELECT MAX(PRET) FROM PRODD)
