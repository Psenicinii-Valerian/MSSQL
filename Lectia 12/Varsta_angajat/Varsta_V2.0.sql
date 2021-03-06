--SA SE CALCULEZE VARSTA DEPLINA A ANGAJATILOR (ANI, LUNI, ZILE)--			
USE ANGAJAT
SELECT  CONCAT ( NUME, ' ', PRENUME) AS NUME_PRENUME,
		CONCAT ( CONVERT( VARCHAR(3),  
			
					IIF( (MONTH( GETDATE() ) - MONTH(DATA_NAST) ) >= 0,  YEAR( GETDATE() ) - YEAR(DATA_NAST),  
						YEAR( GETDATE() ) - YEAR(DATA_NAST) - 1  ) ),  ' ANI, ',


				 CONVERT( VARCHAR(3), 
				 
					IIF( (MONTH( GETDATE() ) - MONTH(DATA_NAST) ) >= 0 AND (  DAY( GETDATE() ) - DAY(DATA_NAST) ) > 0,
						MONTH( GETDATE() ) - MONTH(DATA_NAST),  

						IIF( (MONTH( GETDATE() ) - MONTH(DATA_NAST) ) > 0 AND (  DAY( GETDATE() ) - DAY(DATA_NAST) ) < 0,
							 MONTH( GETDATE() ) - MONTH(DATA_NAST) - 1, 
								
								IIF( (MONTH( GETDATE() ) - MONTH(DATA_NAST) ) <= 0 AND (  DAY( GETDATE() ) - DAY(DATA_NAST) ) < 0,
									 12 - MONTH(DATA_NAST) + MONTH( GETDATE() ) - 1, 

										12 - MONTH(DATA_NAST) + MONTH( GETDATE() )  ) ) ) ), ' LUNI, ',

																			
				 CONVERT( VARCHAR(3),  
			
					IIF( ( DAY( GETDATE() ) - DAY(DATA_NAST) ) >= 0,  DAY( GETDATE() ) - DAY(DATA_NAST),
				CASE MONTH( GETDATE() ) WHEN 1 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
									    WHEN 2 THEN 
											IIF( (DAY(GETDATE() ) / 4) = 7, 28 - DAY( DATA_NAST ) - DAY( GETDATE() ) , 29 - DAY( DATA_NAST ) - DAY( GETDATE() ) )
										WHEN 3 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 4 THEN 30 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 5 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 6 THEN 30 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 7 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 8 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 9 THEN 30 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 10 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 11 THEN 30 - DAY( DATA_NAST ) + DAY( GETDATE() ) 
										WHEN 12 THEN 31 - DAY( DATA_NAST ) + DAY( GETDATE() )
						 END)),' ZILE ' ) AS VARSTA

				 FROM ANGAJAT
				 ORDER BY NUME


SELECT CONCAT ( NUME, ' ', PRENUME) AS NUME_PRENUME, DATA_NAST FROM ANGAJAT
ORDER BY NUME