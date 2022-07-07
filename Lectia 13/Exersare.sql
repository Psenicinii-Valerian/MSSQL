-- REPETARE --

-- 1) Pentru fiecare model de laptop sa se determine : --
--	  a) suma costului produselor cu ram mai mare de 2000 MHz --
--	  b) media aritmetica a produselor cu pret par --
--    c) cantitatea produselor cu pret intre 5000-8000 lei --
--    d) viteza minima a produselor cu hdd mai mic de 500 Gb --

SELECT L.MODEL_ID,
	(SELECT ISNULL(SUM(PRET),0) FROM LAPTOPURI LL WHERE RAM > 2000 AND LL.MODEL_ID = L.MODEL_ID) AS SUMA_PRET,
	(SELECT ISNULL(AVG(PRET),0) FROM LAPTOPURI LL WHERE CONVERT(INT, PRET) % 2 = 0 AND LL.MODEL_ID = L.MODEL_ID) AS MED_PROD,
	(SELECT ISNULL(COUNT(*),0) FROM LAPTOPURI LL WHERE (PRET BETWEEN 5000 AND 8000) AND LL.MODEL_ID = L.MODEL_ID) AS CANT_PROD,
	(SELECT ISNULL(MIN(VITEZA),0) FROM LAPTOPURI LL WHERE HDD < 500 AND LL.MODEL_ID = L.MODEL_ID) AS VITEZA_PRO
FROM LAPTOPURI L
GROUP BY L.MODEL_ID