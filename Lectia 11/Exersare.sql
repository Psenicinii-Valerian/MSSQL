﻿											--EXERSARE--

--1) Scrie o interogare care va afişa pentru fiecare persoană câte angajări active are şi ce salariu total primeşte--

SELECT NUME, PRENUME, COUNT(ANGAJARE_ID) AS NR_ANGAJARI, SUM(SALARIU) AS SALARIU_TOTAL
FROM ANGAJAT AN  INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
WHERE DATA_ELIBERARII IS NULL
GROUP BY NUME, PRENUME

--2) Scrie o interogare care va afişa (NPP, salariu, departament)--

SELECT CONCAT(NUME,' ',  PRENUME) AS NPP, SALARIU, DENUMIRE_DEPART 
FROM ANGAJAT AN INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
				INNER JOIN DEPARTAMENT D ON D.DEPARTAMENT_ID = A.DEPARTAMENT_ID

--3) Scrie o interogare care va afişa pentru fiecare departament ce salarii se achită--
	 --Să se afişeze numai acele rezultate a căror sumă depăşeşte 5000 lei--

SELECT DENUMIRE_DEPART, SUM(SALARIU) AS SALARIU_TOTAL
FROM DEPARTAMENT D INNER JOIN ANGAJARE A ON D.DEPARTAMENT_ID = A.DEPARTAMENT_ID
WHERE SALARIU > 5000
GROUP BY DENUMIRE_DEPART
ORDER BY SALARIU_TOTAL DESC

--4) Scrie o interogare care va afişa persoanele de gen masculin din raioanele Criuleni și Orhei--
SELECT CONCAT(NUME, ' ', PRENUME) AS NPP, R.DENUMIRE
FROM ANGAJAT AN INNER JOIN LOC_STR LS ON LS.LOC_STR_ID = AN.LOC_STR_ID
				INNER JOIN LOCALITATE L ON L.LOCALITATE_ID = LS.LOCALITATE_ID
				INNER JOIN RAION R ON R.RAION_ID = L.RAION_ID
WHERE GEN = 1 AND (R.DENUMIRE = 'CRIULENI' OR R.DENUMIRE = 'ORHEI')
ORDER BY NPP

--5) Scrie o interogare pentru a obţine datele angajatului ce a activat în cadrul companiei--
	 --(FNP, data angajării, data eliberării, funcţie)--
	 
SELECT CONCAT(NUME, ' ',PRENUME) AS FNP, DATA_ANGAJARII, DATA_ELIBERARII, DENUMIRE_FUNCTIE
FROM ANGAJAT AN INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
				INNER JOIN FUNCTIE F ON F.FUNCTIE_ID = A.FUNCTIE_ID
WHERE DATA_ELIBERARII IS NOT NULL
ORDER BY FNP

--SA SE DETERMINE LISTA PERSOANELOR ELIBERATE DEFINITIV DIN CADRUL COMPANIEI--

SELECT CONCAT(NUME, ' ', PRENUME) AS NPP, 
COUNT(DATA_ANGAJARII) AS ANGAJARI_TOTAL, COUNT(DATA_ELIBERARII) AS ELIBERARI_TOTAL
FROM ANGAJAT AN INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
GROUP BY CONCAT(NUME, ' ', PRENUME)
	  HAVING COUNT(DATA_ANGAJARII) = COUNT(DATA_ELIBERARII)
ORDER BY NPP
