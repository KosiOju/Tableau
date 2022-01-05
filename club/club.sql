DROP DATABASE IF EXISTS data_;
CREATE DATABASE IF NOT EXISTS data_;

USE data_;

SELECT 'CREATING DATABASE STRUCTURE' AS 'INFO';

DROP TABLE IF EXISTS new_club_1;

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;

CREATE TABLE club_1(
club_name							VARCHAR(50)		NOT NULL,
competition_name 					VARCHAR(50)		NOT NULL,
squad_size							TINYINT			NOT NULL,
avg_player_age						DECIMAL(3,1)	NOT NULL,
markt_val_of_club_in_mil_£			SMALLINT		NOT NULL,
avg_markt_val_of_player_in_mil_£	SMALLINT		NOT NULL,
markt_val_top_18_players_in_mil_£	SMALLINT		NOT NULL,
PRIMARY KEY (club_name)
);

/* used file import to import the csv file recorded
but could also have used

LOAD DATA INFILE 'C:\Users\...\new_club_1.csv'
INTO TABLE club_1
FIELDS TERMINATED BY ',' ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

*/

SELECT 
    *
FROM
    club_1;
    
##export as club_1.csv

SELECT 
    competition_name,
    ROUND(AVG(squad_size), 0) AS average_squad_size, #players come in whole numbers
    ROUND(AVG(avg_player_age), 1) AS average_avg_player_age,
    ROUND(AVG(avg_markt_val_of_player_in_mil_£), 2) AS average_avg_markt_val_of_player_in_mil_£,
    ROUND(AVG(markt_val_of_club_in_mil_£), 2) AS average_markt_val_of_club_in_mil_£,
    ROUND(AVG(markt_val_top_18_players_in_mil_£), 2) AS average_markt_val_top_18_players_in_mil_£
FROM
    club_1
GROUP BY competition_name;
##export as club_2.csv