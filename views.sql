/*Ideas:
View of country, captain and coaches
View of youngest players in championship
View of Trophies and respective holders*/

CREATE OR REPLACE VIEW Youngest_Players(First_name, Surname, Player_Age, Country) AS 
SELECT Fname, Sname, age, Country.country_name FROM Player, Country WHERE( age <= 22 
AND Player.country_id = Country.abreviation);

CREATE OR REPLACE VIEW Country_Captain_Coach(Country_name, Captain_FirstName, Captain_Surname, Head_Coach_Firstname, Head_Coach_Surname) AS 
SELECT Country.country_name, Player.Fname, Player.Sname, Coach.Fname, Coach.Sname FROM (Player, Country, Coach)
INNER JOIN Country AS Ctry ON Country.abreviation = Player.country_id AND Country.abreviation = Coach.country_id
WHERE Coach.coach_role = "Head Coach" AND Player.leadership = "captain";

CREATE OR REPLACE VIEW Country_and_trophy(Country_name, Trophy_name) AS
SELECT Country.country_name, Trophy.trophy_name FROM (Country, Trophy) 
WHERE (Trophy.current_holder = Country.abreviation);
