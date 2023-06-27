SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW TABLES;

SELECT * FROM albums;

SELECT * FROM albums WHERE sales >= 20;


-- WHAT IS THE PRIMARY KEY FOR THE ALBUM TABLE?  * 
		-- "id"
-- WHAT DOES THE COLUMN NAMED 'NAME' REPRESENT?
		-- The name of the album
-- WHAT DO YOU THINK THE SALES COLUMN REPRESENTS? * 
		-- the amount of tickets sold for by the millions
-- FIND THE NAME FO ALL ALBUMS BY PINK FLOYD. * 
		-- SELECT * FROM albums WHERE artist = "Pink Floyd";
		-- The Dark Side of the Moon and The Wall
-- WHAT IS THE YEAR SGT. PEPPER'S LONELY HEARTS CLUB BAND WAS RELEASED?  * 
		-- SELECT * FROM albums WHERE name = 'SGT. PEPPER\'s LONELY HEARTS CLUB BAND';
        -- 1967
-- WHAT IS THE GENRE FOR THE ALBUMS NEVERMIND? * 
		-- SELECT * FROM albums WHERE name = 'NEVERMIND';
		-- Grunge, Alternative rock
-- WHICH ALBUMS WERE RELEASED IN THE 1990s? *SELECT * 
		-- FROM albums WHERE release_date >= 1990 AND release_date <= 1999; 
-- WHICH ALBUMS HAD LESS THAN 20 MILLION CERTIFIED SALES. RENAMED THIS COLUMN AS LOW_SELLING_ALBUM * 
		-- SELECT DISTINCT sales AS LOW_SELLING_ALBUM FROM albums;
        -- SELECT * FROM albums WHERE sales <= 20;
        
        -- SELECT name AS low_selling_albums FROM albums WHERE sales < 20;
-- Write a statement with today's vocab:
		-- Select * FROM Somerville WHERE Last_Name ('Nguyen','Zalazar');
        -- will bring up Adam and Marcelino