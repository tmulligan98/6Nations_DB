DROP SCHEMA IF EXISTS SixNations;
CREATE SCHEMA SixNations;
USE SixNations;



CREATE TABLE Country ( 
country_name VARCHAR(20) NOT NULL, 
abreviation CHAR(3) NOT NULL, 
nickname VARCHAR (20),
venue_id INT NOT NULL,
PRIMARY KEY(abreviation), 
KEY(country_name),
KEY(nickname),
CONSTRAINT check_country_abbr CHECK
(abreviation IN ('IRE', 'ENG', 'SCO', 'WAL', 'FRA', 'ITA')),
CONSTRAINT check_country_name CHECK
(country_name IN ('Ireland', 'England', 'Scotland', 'Wales', 'France', 'Italy'))
);


CREATE TABLE Venue (
id INT NOT NULL, 
surface VARCHAR(20),
city VARCHAR(20) NOT NULL,
stadium_type VARCHAR(20),
venue_name VARCHAR(50) NOT NULL,
KEY(venue_name),
PRIMARY KEY(id), 
CONSTRAINT check_stadium_type CHECK 
(stadium_type IN ('open', 'closed', 'retractable'))
);

CREATE TABLE Referee (
id INT NOT NULL AUTO_INCREMENT,
Fname VARCHAR(50) DEFAULT NULL,
Sname VARCHAR(50) DEFAULT NULL,
country_of_birth VARCHAR(50) DEFAULT NULL,
age INT DEFAULT NULL CHECK (age >= 18),
PRIMARY KEY(id));


CREATE TABLE Player (
id INT NOT NULL AUTO_INCREMENT, 
Fname VARCHAR(50) NOT NULL,
Sname VARCHAR(50) NOT NULL,
country_id CHAR(3) NOT NULL, 
date_of_birth DATE DEFAULT NULL, 
caps INT,
club VARCHAR(20) NOT NULL,
age INT NOT NULL CHECK (age >= 18),
leadership VARCHAR(50) DEFAULT NULL,
PRIMARY KEY (id)
/*Removed position attribute. Better to have a separate relation since it's multivalued*/
);


CREATE TABLE Rugby_Match(
id INT NOT NULL, 
venue_id INT NOT NULL,
home_team_id CHAR(3) NOT NULL,
away_team_id CHAR(3) NOT NULL,
kickoff_date_time DATETIME DEFAULT NULL,
score_hometeam TINYINT DEFAULT 0,
score_awayteam TINYINT DEFAULT 0,
referee_id INT NOT NULL,
match_length TINYINT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (venue_id) REFERENCES Venue(id),
FOREIGN KEY (home_team_id) REFERENCES Country(abreviation),
FOREIGN KEY (away_team_id) REFERENCES Country(abreviation),
FOREIGN KEY (referee_id) REFERENCES Referee(id)
); /* Given current circumstances, there's no knowing where a game will be hosted*/
/*Fields can be null for match scheduled ahead of time without knowledge of certain attributes*/




CREATE TABLE Coach(
id INT NOT NULL AUTO_INCREMENT,
country_id CHAR(3) NOT NULL, 
country_of_origin VARCHAR(20),
Fname VARCHAR(50) NOT NULL,
Sname VARCHAR(50) NOT NULL,
coach_role VARCHAR(50) DEFAULT NULL,
PRIMARY KEY(id),
FOREIGN KEY(country_id) REFERENCES Country(abreviation)
);

CREATE TABLE Trophy(
trophy_name VARCHAR(50) NOT NULL,
current_holder CHAR(3) NOT NULL,
year_established INT,
PRIMARY KEY(trophy_name),
FOREIGN KEY(current_holder) REFERENCES Country(abreviation)
);
/*Stick to trophys that already exist, not ones that might come about*/

CREATE TABLE Match_Referees(
referee_id INT NOT NULL,
match_id INT NOT NULL,
FOREIGN KEY (referee_id) REFERENCES Referee(id),
FOREIGN KEY (match_id) REFERENCES Rugby_Match(id)
);

CREATE TABLE Score_Details(
ID INT NOT NULL AUTO_INCREMENT,
score_type VARCHAR(20) NOT NULL,
time_scored DOUBLE DEFAULT NULL,
match_id INT NOT NULL,
player_id INT NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE Positions(
player_id INT NOT NULL,
position VARCHAR(30) NOT NULL,
FOREIGN KEY (player_id) REFERENCES Player(id)
);


