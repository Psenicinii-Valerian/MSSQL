--1. Scriți interogarea ce va afișa producătorii de imprimante și PC-uri--
USE DEPOZIT

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
SELECT CONVERT(DECIMAL(10,2), PRET/1.2) AS NEW_PRET FROM PC WHERE CD IS NULL
--AICI SINGUR AM FACUT CONVERSIA DOAR PENTRU CA SA FIE MAI FRUMOS DE VIZUALIZAT!!!

--9. Scriți interogarea ce va afișa pentru fiecare model de PC – media 
	 --aritmetică a diferenței dintre prețul maximal și cel minimal--
SELECT MODEL_ID,  (MAX(PRET) - MIN(PRET))/2 AS MEDIA_PRET  FROM PC
GROUP BY MODEL_ID
HAVING COUNT(MODEL_ID)>1

--10. Scriți interogarea ce va afișa pretul maximal, prețul minimal, suma prețului, cantitatea
	  --și media aritmetică a laptop-urilor cu dimensiunea ecranului impară și preț mai mare de 7000 lei--
SELECT ECRAN, MAX(PRET) AS MAX_PRET, MIN(PRET) AS MIN_PRET, 
	   SUM(PRET) AS SUMA_PRETURILOR, COUNT(ECRAN) CANT_ECRANE FROM LAPTOPURI
WHERE ECRAN%2=1 AND PRET>7000
GROUP BY ECRAN

--11. Scriți interogarea ce va afișa suma dintre penultima cifră din model_id și numărul de simboluri--
	  --ce alcătuește prețul imprimantelor--
SELECT CONVERT(INT, SUBSTRING(CONVERT(VARCHAR(20),MODEL_ID),LEN(MODEL_ID)-1,1)) +
	   CONVERT(INT,LEN(CONVERT(VARCHAR(20),PRET))) AS SUMA FROM IMPRIMANTE

--12. Scriți interogarea ce va afișa lista tuturor produselor fără repetări--
  	  --Efectuați interogarea prin două metode--
SELECT PRODUCATOR, TIP, ACTIV FROM PRODUSE
GROUP BY PRODUCATOR, TIP, ACTIV

	  --A DOUA METODA
SELECT DISTINCT(PRODUCATOR), TIP FROM PRODUSE 

--13. Scriți interogarea ce va afișa prețul lăptop-urilor minus suma cifrelor ce formează câmpul ecran--
	 --exprimat în %. Afișați pret_vechi și pret_nou--
SELECT * FROM LAPTOPURI

SELECT PRET AS PRET_VECHI, ( PRET - PRET*((ECRAN / 10) + (ECRAN % 10))/100 ) AS PRET_NOU
FROM LAPTOPURI

--14. Scriți interogarea ce va afișa numai acele laptop-uri la care viteza este mai mică decât RAM-ul--
	  --și capacitatea dublă a discului dur este mai mică decât valoare modelului--
SELECT * FROM LAPTOPURI WHERE VITEZA<RAM AND 2*HDD < MODEL_ID