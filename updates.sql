/*Update the aviva to have an artificial surface instead of grass*/
UPDATE Venue SET surface = "artifical" WHERE id = 111;

/*Update the leadership of the Irish Rugby team, make Peter O'Mahoney the captain*/
UPDATE Player SET leadership = "NULL" WHERE id = 1;
UPDATE Player SET leadership = "captain" WHERE id = 7;

/*A mistake was made recording a score made in the Ireland-Scotland game on the 1st of february. Jordan Larmour scored the try*/
UPDATE Score_Details SET player_id = (SELECT id FROM Player WHERE Player.Fname = "Jordan" AND Player.Sname = "Larmour") WHERE id = 1;


