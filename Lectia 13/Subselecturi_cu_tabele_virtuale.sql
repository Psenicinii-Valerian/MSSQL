--SUBSELECTURI CU TABELE VIRTUALE--

--SA SE DETERMINE PRODUSUL CEL MAI SCUMP--

--1 METODA--
SELECT TEMP.* FROM
	(
		SELECT 'PC' AS TIP, PRET, MODEL_ID FROM PC
		UNION 
		SELECT 'LAPTOP' AS TIP, PRET, MODEL_ID FROM LAPTOPURI WHERE MODEL_ID IS NOT NULL
		UNION
		SELECT 'IMPRIMANTE' AS TIP, PRET, MODEL_ID FROM IMPRIMANTE
	) TEMP

WHERE TEMP.PRET =

(
	SELECT MAX(T.PRET) FROM
	(
		SELECT 'PC' AS TIP, PRET, MODEL_ID FROM PC
		UNION 
		SELECT 'LAPTOP' AS TIP, PRET, MODEL_ID FROM LAPTOPURI WHERE MODEL_ID IS NOT NULL
		UNION
		SELECT 'IMPRIMANTE' AS TIP, PRET, MODEL_ID FROM IMPRIMANTE
	) T
)

--2 METODA--

--STUDIUL WITH--
WITH TEMP(TIP, PRET, MODEL) AS
(
	SELECT 'PC' AS TIP, PRET, MODEL_ID FROM PC
	UNION 
	SELECT 'LAPTOP' AS TIP, PRET, MODEL_ID FROM LAPTOPURI WHERE MODEL_ID IS NOT NULL
	UNION
	SELECT 'IMPRIMANTE' AS TIP, PRET, MODEL_ID FROM IMPRIMANTE
)

SELECT * FROM TEMP WHERE PRET = (SELECT MAX(PRET) FROM TEMP)


--1) PENTRU FIECARE ANGAJAT SA SE DETERMINE SALARIUL TOTAL--

SELECT AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME) AS NPP,
	(SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
	 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
FROM ANGAJAT AN
GROUP BY AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME)
	HAVING (SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
		    DATA_ELIBERARII IS NULL) IS NOT NULL

--2) SA SE DETERMINE ANGAJATUL CE PRIMESTE CEL MAI MARE SALARIU--

SELECT TEMP.* FROM 
(
	SELECT AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME) AS NPP,
		(SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
		 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
	FROM ANGAJAT AN
	GROUP BY AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME)
		HAVING (SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
				DATA_ELIBERARII IS NULL) IS NOT NULL
) TEMP
    
WHERE TEMP.SALARIU_TOTAL = 
     
(
	SELECT MAX(TT.SALARIU_TOTAL) FROM 
	(
		SELECT AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME) AS NPP,
			(SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
			 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
		FROM ANGAJAT AN
		GROUP BY AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME)
			HAVING (SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
					DATA_ELIBERARII IS NULL) IS NOT NULL
	) TT
)

--2 METODA--
WITH TEMP AS
(
	SELECT AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME) AS NPP,
		(SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
		 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
	FROM ANGAJAT AN
	GROUP BY AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME)
		HAVING (SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
				DATA_ELIBERARII IS NULL) IS NOT NULL
)

SELECT * FROM TEMP WHERE TEMP.SALARIU_TOTAL = (SELECT MAX(SALARIU_TOTAL) FROM TEMP)

--REPETARE EX 1) ALTA METODA--
WITH TEMP AS
(
	SELECT SUM(SALARIU) AS SUMA_SALARIU FROM ANGAJARE A WHERE DATA_ELIBERARII IS NULL
)

SELECT AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME) AS NPP, TEMP.SUMA_SALARIU,
	(SELECT ISNULL(SUM(SALARIU),0) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND
	 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
FROM ANGAJAT AN, TEMP
GROUP BY AN.ANGAJAT_ID, CONCAT(NUME,' ',PRENUME), TEMP.SUMA_SALARIU
	HAVING TEMP.SUMA_SALARIU IS NOT NULL

--SA SE GASEASCA FUNCTIILE CELE MAI RAU PLATITE--
WITH TEMP AS
(
	SELECT FUNCTIE_ID, DENUMIRE_FUNCTIE,
		(SELECT SUM(SALARIU) FROM ANGAJARE A WHERE A.FUNCTIE_ID = F.FUNCTIE_ID AND
		 DATA_ELIBERARII IS NULL) AS SALARIU_TOTAL
	FROM FUNCTIE F
)

SELECT * FROM TEMP WHERE TEMP.SALARIU_TOTAL = (SELECT MIN(SALARIU_TOTAL) FROM TEMP WHERE SALARIU_TOTAL IS NOT NULL)

--SA SE DETERMINE PENTRU FIECARE RAION SALARIUL MAXIMAL--

--1 METODA--

SELECT * FROM 
(
	SELECT RAION_ID, R.DENUMIRE,
	(SELECT SUM(SALARIU) FROM ANGAJARE A INNER JOIN ANGAJAT AN ON AN.ANGAJAT_ID = A.ANGAJAT_ID
									     INNER JOIN LOC_STR LS ON LS.LOC_STR_ID = AN.LOC_STR_ID
										 INNER JOIN LOCALITATE L ON L.LOCALITATE_ID = LS.LOCALITATE_ID	
										 WHERE L.RAION_ID = R.RAION_ID) AS SUMA_SAL
FROM RAION R
) TEMP

WHERE TEMP.SUMA_SAL =
( 
	SELECT MAX(TEMP.SUMA_SAL) FROM
	(
		SELECT RAION_ID, R.DENUMIRE,
		(SELECT SUM(SALARIU) FROM ANGAJARE A INNER JOIN ANGAJAT AN ON AN.ANGAJAT_ID = A.ANGAJAT_ID
											 INNER JOIN LOC_STR LS ON LS.LOC_STR_ID = AN.LOC_STR_ID
											 INNER JOIN LOCALITATE L ON L.LOCALITATE_ID = LS.LOCALITATE_ID	
											 WHERE L.RAION_ID = R.RAION_ID) AS SUMA_SAL
		FROM RAION R
	) TEMP
)

--2 METODA--

WITH TEMP AS
(
	SELECT RAION_ID, DENUMIRE,
	(SELECT SUM(SALARIU) FROM ANGAJARE A INNER JOIN ANGAJAT AN ON A.ANGAJAT_ID=AN.ANGAJAT_ID
										 INNER JOIN LOC_STR LS ON LS.LOC_STR_ID=AN.LOC_STR_ID
										 INNER JOIN LOCALITATE LOC ON LOC.LOCALITATE_ID=LS.LOCALITATE_ID
	WHERE LOC.RAION_ID=R.RAION_ID)AS SALARIU
	FROM RAION R
)

SELECT * FROM TEMP WHERE SALARIU=(SELECT MAX(SALARIU)FROM TEMP WHERE SALARIU IS NOT NULL )

--PENTRU FIECARE ANGAJAT SA SE DETERMINE NR DE ANGAJARI ACTIVE, NR DE ANGAJARI INACTIVE, SUMA SALARIULUI ACTIV SI SUMA SALARIULUI INACTIV--
SELECT ANGAJAT_ID, CONCAT(NUME, ' ', PRENUME) AS NPP,
	(SELECT ISNULL(COUNT(*), 0) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND DATA_ELIBERARII IS NULL) AS AN_ACT,
	(SELECT ISNULL(COUNT(*), 0) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND DATA_ELIBERARII IS NOT NULL) AS ANT_INACT,
	(SELECT ISNULL(SUM(SALARIU), 0) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND DATA_ELIBERARII IS NULL) AS SS_ACT,
	(SELECT ISNULL(SUM(SALARIU), 0) FROM ANGAJARE A WHERE A.ANGAJAT_ID = AN.ANGAJAT_ID AND DATA_ELIBERARII IS NOT NULL) AS SS_INACT
FROM ANGAJAT AN

--PENTRU FIECARE GEN SA SE DETERMINE SALARIUL ACHITAT--

--1 METODA--
SELECT GEN, IIF (GEN = 1, 'MASCULIN', 'FEMININ') AS TIP,
	(SELECT SUM(SALARIU) FROM ANGAJARE A INNER JOIN ANGAJAT ANN ON A.ANGAJAT_ID = ANN.ANGAJAT_ID  
		WHERE ANN.GEN = AN.GEN) AS SUM_SALARIU_GEN
FROM ANGAJAT AN
GROUP BY GEN, IIF (GEN = 1, 'MASCULIN', 'FEMININ')

--2 METODA--
SELECT IIF (GEN = 1, 'MASCULIN', 'FEMININ') AS GEN,
	(SELECT SUM(SALARIU) FROM ANGAJARE A INNER JOIN ANGAJAT ANN ON A.ANGAJAT_ID = ANN.ANGAJAT_ID
		WHERE IIF (ANN.GEN = 1, 'MASCULIN', 'FEMININ') = IIF (AN.GEN = 1, 'MASCULIN', 'FEMININ')) AS SUM_SALARIU_GEN
FROM ANGAJAT AN
GROUP BY IIF (GEN = 1, 'MASCULIN', 'FEMININ')