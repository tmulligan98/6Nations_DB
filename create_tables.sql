DROP SCHEMA IF EXISTS SixNations;
CREATE SCHEMA SixNations;
USE SixNations;

/*Need to use trigger to check date of birth of player*/

CREATE TABLE Country ( 
country_name VARCHAR(20) NOT NULL, 
abreviation CHAR(3) NOT NULL, 
nickname varchar (20),
venue_id VARCHAR(30) NOT NULL,
PRIMARY KEY(abreviation), 
KEY(country_name),
KEY(nickname),
UNIQUE (country_name),
CONSTRAINT check_country_abbr CHECK
(abreviation IN ('IRL', 'ENG' 'SCO', 'WAL', 'FRA', 'ITA')),
CONSTRAINT check_country_name CHECK
(country_name IN ('Ireland', 'England' 'Scotland', 'Wales', 'France', 'Italy'))
);


CREATE TABLE Venue (
id varchar(6) NOT NULL, 
surface varchar(20),
city varchar(20) NOT NULL,
stadium_type varchar(20),
venue_name VARCHAR(20) NOT NULL,
KEY(venue_name),
primary key(id), 
constraint check_stadium_type check 
(stadium_type IN ('open', 'closed', 'retractable'))
);


CREATE TABLE Player (
id INT NOT NULL AUTO_INCREMENT, 
Fname VARCHAR(50) NOT NULL,
Sname VARCHAR(50) NOT NULL,
country_id CHAR(3) NOT NULL, 
date_of_birth DATE DEFAULT NULL, 
caps INT NOT NULL,
club VARCHAR(20) NOT NULL,
position VARCHAR(30) DEFAULT NULL,
age INT NOT NULL CHECK (age >= 18),
PRIMARY KEY (id),
FOREIGN KEY (country_id) REFERENCES Country(abreviation)
);

CREATE TABLE referee (
id INT NOT NULL AUTO_INCREMENT,
Fname VARCHAR(50) DEFAULT NULL,
Sname VARCHAR(50) DEFAULT NULL,
country_of_birth VARCHAR(50) DEFAULT NULL,
age INT DEFAULT NULL CHECK (age >= 18),
PRIMARY KEY(id));



CREATE TABLE rugby_match(
id INT NOT NULL AUTO_INCREMENT, 
venue_id VARCHAR(20) NOT NULL,
home_team_id CHAR(3) NOT NULL,
away_team_id CHAR(3) NOT NULL,
kickoff_date_time DATETIME DEFAULT NULL,
score_hometeam TINYINT DEFAULT 0,
score_awayteam TINYINT DEFAULT 0,
referee_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (venue_id) REFERENCES Venue(id),
FOREIGN KEY (home_team_id) REFERENCES Country(abreviation),
FOREIGN KEY (away_team_id) REFERENCES Country(abreviation),
FOREIGN KEY (referee_id) REFERENCES referee(id)
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

CREATE TABLE trophy(
trophy_name VARCHAR(50) NOT NULL,
current_holder CHAR(3) NOT NULL,
year_established INT NOT NULL,
PRIMARY KEY(trophy_name),
FOREIGN KEY(current_holder) REFERENCES Country(abreviation)
);
/*Use trigger to check for trophy name*/

CREATE TABLE match_referees(
referee_id INT NOT NULL,
match_id INT NOT NULL,
FOREIGN KEY (referee_id) REFERENCES referee(id),
FOREIGN KEY (match_id) REFERENCES rugby_match(id)
);


