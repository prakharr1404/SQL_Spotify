/* Advance Questions */

-- 1. Find the top 3 viewed for each artist using window functions
/* WINDOW FUNCTIONS 

Window functions in PostgreSQL allow you to perform calculations across a set of table rows 
that are related to the current row, without collapsing rows into groups, 
which is what happens in aggregate functions (like SUM() or AVG() used with GROUP BY).

SYNTAX

function_name (expression) OVER (
    [PARTITION BY column]
    [ORDER BY column]
    [ROWS BETWEEN ...]
)


WINDOW FUNCTIONS

| Function         | Description                             |
| ---------------- | --------------------------------------- |
| `ROW_NUMBER()`   | Gives a unique row number per partition |
| `RANK()`         | Gives rank with gaps                    
| `DENSE_RANK()`   | Rank without gaps                       |
| `NTILE(n)`       | Divides rows into n buckets             |
| `LAG()`          | Access value from a previous row        |
| `LEAD()`         | Access value from a next row            |
| `SUM()`, `AVG()` | Aggregate functions with a window       |

*/

WITH ranking_artist as(
SELECT 
	Artist,
	Track,
	SUM(Views) as Total_Views,
		--WINDOW FUNCTION
		DENSE_RANK() OVER (PARTITION BY Artist 
		ORDER BY SUM(Views) DESC) as rank
FROM
	Spotify
GROUP BY
	Artist, Track
ORDER BY
	Artist, Total_views DESC
)
SELECT *
FROM
	ranking_artist
WHERE
	rank<=3;