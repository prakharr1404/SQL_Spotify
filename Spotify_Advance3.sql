/* Advanced Questions */

-- 3. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album

WITH difference as (
	SELECT 
		Album,
		MAX(energy) - MIN(energy) as Difference_of_Energy
	FROM
		Spotify
	GROUP BY
		Album
)

SELECT *
FROM difference
ORDER BY
	Difference_of_Energy DESC;
