-- 1) Pentru fiecare model de laptop sa se determine : --
--	  a) suma costului produselor cu ram mai mare de 2000 MHz --
--	  b) media aritmetica a produselor cu pret par --
--    c) cantitatea produselor cu pret intre 5000-8000 lei --
--    d) viteza minima a produselor cu hdd mai mic de 500 Gb --

SELECT L.MODEL_ID,
	(SELECT ISNULL(SUM(PRET),0) FROM LAPTOPURI LL WHERE RAM > 2000 AND LL.MODEL_ID = L.MODEL_ID) AS SUMA_PROD,
	(SELECT ISNULL( CONVERT(DECIMAL(8,2), AVG(PRET)), 0 ) FROM LAPTOPURI LL WHERE (CONVERT(INT, PRET) % 2) = 0 AND
		LL.MODEL_ID = L.MODEL_ID) AS MEDIA_PROD,
	(SELECT COUNT(*) FROM LAPTOPURI LL WHERE (PRET BETWEEN 5000 AND 8000) AND
		LL.MODEL_ID = L.MODEL_ID) AS CANTITATEA_PROD,
	(SELECT ISNULL(MIN(VITEZA),0) FROM LAPTOPURI LL WHERE HDD < 500 AND LL.MODEL_ID = L.MODEL_ID) AS VITEZA_MIN
FROM LAPTOPURI L
GROUP BY L.MODEL_ID


-- 2) Sa se determine producatorii si vitezele pc-urilor ce poseda hdd-uri cu viteza cea mai mica --
SELECT P.PRODUCATOR, PC.VITEZA
FROM PC INNER JOIN PRODUSE P ON P.MODEL_ID = PC.MODEL_ID 
	WHERE PC.HDD = (SELECT MIN(HDD) FROM PC)


-- 3) Sa se gaseasca modelele si producatorii pc-urilor care au o viteza mai mare decat cel mai rapid laptop --
SELECT PC.MODEL_ID, P.PRODUCATOR
FROM PC INNER JOIN PRODUSE P ON P.MODEL_ID = PC.MODEL_ID 
	WHERE PC.VITEZA > (SELECT MAX(VITEZA) FROM LAPTOPURI)
