/* Advanced Questions */

-- 2. Write a query to find tracks where the liveness score is above the average

SELECT *
FROM	
	Spotify
WHERE 
	Liveness > 	(SELECT 
					AVG(Liveness)
				FROM
					Spotify);