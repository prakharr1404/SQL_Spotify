-- Spotify Project

CREATE TABLE Spotify
(
	Artist VARCHAR(255),
	Track VARCHAR(255),
	Album VARCHAR(255),
	Album_Type VARCHAR(255),
	Danceability FLOAT,
	Energy FLOAT,
	Loudness FLOAT,
	Speechiness FLOAT,
	Acousticness FLOAT,
	Instrumentalness FLOAT,
	Liveness FLOAT,
	Valence FLOAT,
	Tempo FLOAT,
	Duration_min FLOAT,
	Title VARCHAR(255),
	Channel VARCHAR(255),
	Views  BIGINT,
	Likes BIGINT,
	Comments BIGINT,
	Licensed BOOLEAN,
	Official_Video BOOLEAN,
	Stream BIGINT,
	EnergyLiveness FLOAT,
	Most_Played_On VARCHAR(255)
);

-- EDA

/* First EDA */
select 
	count(*)
from
	Spotify;

/* Second EDA */
select 
	Count(Distinct Artist)
from
	spotify;

/* Third EDA */
select
	count(distinct Album)
from
	Spotify;

/* Fourth EDA */
select 
	Artist,
	Count(Album) as No_of_albums
from 
	Spotify
group by
	Artist
order by
	No_of_albums DESC;

/* Fifth EDA */
select
	distinct album_type
from
	spotify;

/* Sixth EDA */
select
	max(Duration_Min),
	min(Duration_Min)
from
	spotify;

/* Seventh EDA */
select
	Artist,
	Duration_min,
	Album
from
	spotify
where
	Duration_min = 0;

/* Eith EDA */
delete from spotify
where
	Duration_Min = 0;
