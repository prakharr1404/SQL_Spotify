/* Medium Questions */

-- 1. Calculate the average danceabillity of tracks in each album

SELECT 
	Track,
	AVG(Danceability)
FROM
	Spotify
GROUP BY
	Track
ORDER BY
	AVG(Danceability) DESC;

-- 2. Find the top 5 tracks with the highest energy values 

SELECT 
	Artist,
	Track,
	Energy
FROM
	Spotify
ORDER BY
	Energy DESC
LIMIT 5;

-- 3. List all tracks along with their views and likes where Official_video = 'True'

SELECT
	Track,
	SUM(Views) as Views,
	SUM(Likes) as Likes
FROM
	Spotify
WHERE
	Official_video = 'True'
GROUP BY
	Track
ORDER BY
	Views DESC;

-- 4. For each album, calculate the total views of all associated tracks

SELECT
	Album,
	Track,   
	SUM(Views) as Number_of_Views
FROM
	Spotify
GROUP BY
	Album, Track
ORDER BY
	Number_of_Views DESC;

-- 5. Retrieve the track names that have been streamed on Spotify more than YouTube

SELECT
	Artist,
	Track,
	Stream,
	Most_Played_On
FROM
	Spotify
WHERE
	Most_Played_On = 'Spotify';

-- OR

SELECT * FROM
	(SELECT
		track,
		COALESCE(SUM(CASE
						WHEN 'Most_Played_On' = 'YouTube' THEN stream END), 0) as Streamed_on_Youtube,
		COALESCE(SUM(CASE
						WHEN 'Most_Played_On' = 'Spotify' THEN stream END), 0) as Streamed_on_Spotify
		FROM Spotify
		GROUP BY 1
) as t1
WHERE
	streamed_on_spotify > streamed_on_youtube
	AND
	streamed_on_youtube <> 0;

