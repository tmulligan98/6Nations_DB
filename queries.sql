/*Updates*/
/*Update the aviva to have an artificial surface instead of grass*/
UPDATE Venue SET surface = "artifical" WHERE id = 111;

/*Update the leadership of the Irish Rugby team, make Peter O'Mahoney the captain*/
UPDATE Player SET leadership = "NULL" WHERE id = 1;
UPDATE Player SET leadership = "captain" WHERE id = 7;

/*A mistake was made recording a score made in the Ireland-Scotland game on the 1st of february. Jordan Larmour scored the try*/
UPDATE Score_Details SET player_id = (SELECT id FROM Player WHERE Player.Fname = "Jordan" AND Player.Sname = "Larmour") WHERE id = 1;


/*Selects*/
/*View the views*/
SELECT * FROM SixNations.Youngest_Players;
SELECT * FROM Country_Captain_Coach LIMIT 6;
SELECT * FROM SixNations.Country_and_trophy;

/*Find out the number of tries scored before half time*/
SELECT score_type,COUNT(*)
FROM Score_Details WHERE score_type = "try" AND time_scored < 40
GROUP BY score_type;