﻿--1. Scriți interogarea ce va afișa producătorii de imprimante și PC-uri--
SELECT PRODUCATOR, COUNT(DISTINCT(TIP)) AS NR FROM PRODUSE
WHERE TIP='IMPRIMANTE' OR TIP='PC'
GROUP BY PRODUCATOR
HAVING COUNT(DISTINCT(TIP))>1

--2. Scriți interogarea ce va afișa numărul de fiecare tip de produs în parte--
SELECT TIP, COUNT(TIP) AS NR_TIP FROM PRODUSE
GROUP BY TIP

--3. Scriți interogarea ce va afișa producatorii ce produc cel puțin două tipuri de piese diferite--
SELECT PRODUCATOR, COUNT(TIP) AS NR_TIP FROM PRODUSE
GROUP BY PRODUCATOR
HAVING COUNT(DISTINCT(TIP))>2

--4. Scriți interogarea ce va afișa laptopurile cu RAM-ul de 1000 și 2000 GHz--
SELECT * FROM LAPTOPURI WHERE RAM=1000 OR RAM=2000

--5. Scriți interogarea ce va afișa pentru fiecare dimensiune a ecranului – cantitatea,--
	 --pretul minimal și cel maximal.--
SELECT ECRAN, COUNT(ECRAN) AS CANT_ECRANE, MAX(PRET) AS MAX_PRET_ECRAN,
			  MIN(PRET) AS MIN_PRET_ECRAN FROM LAPTOPURI
GROUP BY ECRAN

--6. Scriți interogarea ce va afișa modelul si prețul PC-urilor la care suma primelor două simboluri 
	 --din model este mai mică decât suma ultimilelor două cifre din model--
SELECT MODEL_ID, PRET FROM PC 
WHERE CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20),MODEL_ID),1,1)) +
	  CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20),MODEL_ID),2,1)) <

	  CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20),MODEL_ID),LEN(MODEL_ID)-1,1))+
	  CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20),MODEL_ID),LEN(MODEL_ID),1)) 


--7. Scriți interogarea ce va afișa laptop-urile cu preț par--
SELECT LAPTOP_ID FROM LAPTOPURI WHERE CONVERT(INT,PRET)%2=0

--8. Scriți interogarea ce va afișa prețul -20% a PC-urilor ce nu au CD--
SELECT PRET*0.8 AS NEW_PRET FROM PC WHERE CD = '' OR CD IS NULL

--9. Scriți interogarea ce va afișa pentru fiecare model de PC – media 
	 --aritmetică a diferenței dintre prețul maximal și cel minimal--
SELECT MODEL_ID, (MAX(PRET) - MIN(PRET))/2 AS MEDIA FROM PC
GROUP BY MODEL_ID

--10. Scriți interogarea ce va afișa pretul maximal, prețul minimal, suma prețului, cantitatea
	  --și media aritmetică a laptop-urilor cu dimensiunea ecranului impară și preț mai mare de 7000 lei--
SELECT ECRAN, MAX(PRET) AS MAX_PRET, MIN(PRET) AS MIN_PRET, SUM(PRET) AS SUMA_PRET, 
				 COUNT(ECRAN) AS NR_ECRAN, AVG(ECRAN) AS MEDIA_ECRAN 
FROM LAPTOPURI
WHERE CONVERT(INT, ECRAN)%2=1 AND PRET>7000
GROUP BY ECRAN

--11. Scriți interogarea ce va afișa suma dintre penultima cifră din model_id și numărul de simboluri--
	  --ce alcătuește prețul imprimantelor--
SELECT CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20), MODEL_ID), LEN(MODEL_ID)-1, 1) ) +
	   LEN(CONVERT(VARCHAR(10),MODEL_ID)) AS SUMA
FROM IMPRIMANTE

--12. Scriți interogarea ce va afișa lista tuturor produselor fără repetări--
  	  --Efectuați interogarea prin două metode--
SELECT PRODUCATOR, TIP, ACTIV FROM PRODUSE
GROUP BY PRODUCATOR, TIP, ACTIV

SELECT DISTINCT(PRODUCATOR), TIP FROM PRODUSE 

SELECT DISTINCT(TIP), PRODUCATOR  FROM PRODUSE 

--13. Scriți interogarea ce va afișa prețul lăptop-urilor minus suma cifrelor ce formează câmpul ecran--
	  --exprimat în %. Afișați pret_vechi și pret_nou--
SELECT * FROM LAPTOPURI

SELECT PRET AS PRET_VECHI, ( PRET - PRET*((ECRAN / 10) + (ECRAN % 10))/100 ) AS PRET_NOU
FROM LAPTOPURI

--14. Scriți interogarea ce va afișa numai acele laptop-uri la care viteza este mai mică decât RAM-ul--
	  --și capacitatea dublă a discului dur este mai mică decât valoare modelului--
SELECT * FROM LAPTOPURI WHERE VITEZA < RAM AND 2*HDD < MODEL_ID

--SA SE DETERMINE ANGAJATII DIN DEPARTAMENTUL IT CE NU LOCUIESC IN ORASUL TELENESTI--
USE ANGAJAT
SELECT NUME, PRENUME, L.DENUMIRE FROM ANGAJAT AN 
					  INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
					  INNER JOIN DEPARTAMENT D ON D.DEPARTAMENT_ID = A.DEPARTAMENT_ID
					  INNER JOIN LOC_STR LS ON LS.LOC_STR_ID = AN.LOC_STR_ID
					  INNER JOIN LOCALITATE L ON L.LOCALITATE_ID = LS.LOCALITATE_ID
WHERE D.DENUMIRE_DEPART='IT' AND L.DENUMIRE NOT LIKE '%TELE%'

--SA SE DETERMINE PERSOANELE CU SALARIUL NU MAI MIC DE 60000 LEI--
SELECT NUME, PRENUME FROM ANGAJAT AN INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
WHERE A.SALARIU >= 60000
GROUP BY NUME, PRENUME

--METODA MAI CORECTA
SELECT NUME, PRENUME, SUM(SALARIU) AS SALARIUL_TOTAL 
					 FROM ANGAJAT AN 
					 INNER JOIN ANGAJARE A ON AN.ANGAJAT_ID = A.ANGAJAT_ID
GROUP BY NUME, PRENUME
	HAVING SUM(SALARIU)>=60000
ORDER BY(NUME)