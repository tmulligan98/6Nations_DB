/*Insert countrys*/

/*
111 - Aviva
112 - Twickenham
113
114
115
116*/

/*
000001
000010
000100
001000
010000
100000
*/

/*Venue*/
INSERT INTO Venue VALUES(111, "Grass", "Dublin", "open", "Aviva");
INSERT INTO Venue VALUES(112, "Grass", "London", "open", "Twickenham");
INSERT INTO Venue VALUES(113, "Grass", "Cardiff", "retractable", "Millenium");
INSERT INTO Venue VALUES(114, "Grass", "Edinburgh", "open", "Murrayfield");
INSERT INTO Venue VALUES(115, "Grass", "Rome", "open", "Stadio Flaminio");
INSERT INTO Venue VALUES(116, "Grass", "Paris", "open", "Stade de France");
INSERT INTO Venue VALUES(117, "Artificial", "Paris", "closed", "Paris La Defense Arena");

/*Country*/
INSERT INTO Country VALUES("Ireland", "IRL", NULL, 111);
INSERT INTO Country VALUES("England", "ENG", NULL, 112);
INSERT INTO Country VALUES("Wales", "WAL", NULL, 113);
INSERT INTO Country VALUES("Scotland", "SCO", NULL, 114);
INSERT INTO Country VALUES("Italy", "ITA", "Azurri", 115);
INSERT INTO Country VALUES("France", "FRA", "Les Bleus", 116);



/*Referee*/
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Luke", "Pearce", "England", 33);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Mathieu", "Raynal", "France", 39);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Nigel", "Owens", "Wales", 49);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Romain", "Poite", "France", 45);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Pascal", "Gauzere", "France", 43);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Andrew", "Brace", "Wales", 32);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Ben", "O'Keefe", "New Zealand", 31);
INSERT INTO Referee(Fname, Sname, country_of_birth, age) VALUES("Matthew", "Carley", "England", 35);


/*Player*/

/*Removed positions from these inserts. Now in separate table.*/
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, age, leadership) 
VALUES("Johnny", "Sexton", "IRL", "1985-07-11", 94, "Leinster", 35, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Owen", "Farrell", "ENG", "1991-10-24", NULL, "Saracens", 29, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Alun", "Wyn Jones", "WAL", "1985-10-9", 149, "Ospreys", 35, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Stuart", "Hogg", "SCO", "1992-06-24", NULL, "Exeter Chiefs", 28, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Charles", "Ollivon", "FRA", "1993-05-11", NULL, "Toulon", 27, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Luca", "Bigi", "ITA", "1991-04-19", NULL, "Zebre", 29, "captain");
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Peter", "O'Mahoney", "IRL", "1989-10-17", 67, "Munster", 31, "vice-captain");

INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Josh", "Adams", "Wal", "1995-04-21", NULL, "Cardiff Blues", 25, NULL);
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Jordan", "Larmour", "IRL", "1997-06-10", 21, "Leinster", 23, NULL);
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Ellis", "Genge", "ENG", "1995-02-16", NULL, "Leicster", 25, NULL);
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Romain", "Ntamack", "FRA", "1999-05-1", NULL, "Toulouse", 21, NULL);
INSERT INTO Player(Fname, Sname, country_id, date_of_birth, caps, club, position, age, leadership) 
VALUES("Dan", "Biggar", "WAL", "1989-10-16", 79, "Northampton", 31, "vice-captain");


/*Rugby Match*/

INSERT INTO Rugby_Match VALUES(1111, 113, "WAL", "ITA",  "2020-02-1 14:15:00", 42, 0, 1, 80);
INSERT INTO Rugby_Match VALUES(1112, 111, "IRE", "SCO",  "2020-02-1 16:45:00", 19, 12, 2, 80);
INSERT INTO Rugby_Match VALUES(1113, 116, "FRA", "ENG",  "2020-02-2 15:00:00", 24, 17, 3, 80);
INSERT INTO Rugby_Match VALUES(1114, 111, "IRE", "WAL",  "2020-02-8 14:15:00", 24, 14, 4, 80);
INSERT INTO Rugby_Match VALUES(1115, 114, "SCO", "ENG",  "2020-02-8 16:45:00", 6, 13, 5, 80);
INSERT INTO Rugby_Match VALUES(1116, 113, "FRA", "ITA",  "2020-02-9 15:00:00", 35, 22, 6, 80);
INSERT INTO Rugby_Match VALUES(1117, 113, "ITA", "SCO",  "2020-02-22 14:15:00", 0, 17, 7, 80);
INSERT INTO Rugby_Match VALUES(1118, 113, "WAL", "FRA",  "2020-02-22 16:45:00", 23, 27, 8, 80);


/*Coach*/

INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("IRL", "England", "Andy", "Farrell", "Head Coach");
INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("ENG", "Australia", "Eddie", "Jones", "Head Coach");
INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("SCO", "Scotland", "Gregor", "Townsend", "Head Coach");
INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("WAL", "Wales", "Wayne", "Pivac", "Head Coach");
INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("FRA", "France", "Fabien", "Galthie", "Head Coach");
INSERT INTO Coach(country_id, country_of_origin, Fname, Sname, coach_role) VALUES("ITA", "South Africa", "Franco", "Smith", "Head Coach");


/*Trophy*/

INSERT INTO Trophy VALUES("Championship Trophy", "England", 1993);
INSERT INTO Trophy VALUES("Triple Crown", "England", 1993);
INSERT INTO Trophy VALUES("Grand Slam", "England", NULL);
INSERT INTO Trophy VALUES("Calcutta Cup", "England", 1879);
INSERT INTO Trophy VALUES("Millenium Trophy", "England", 1988);
INSERT INTO Trophy VALUES("Centenary Quaich", "Ireland", 1989);
INSERT INTO Trophy VALUES("Giuseppe Garibaldi Trophy", "France", 2007);
INSERT INTO Trophy VALUES("Auld Alliance Trophy", "Scotland", 2018);
INSERT INTO Trophy VALUES("Doddie Weir", "Scotland", 2018);

/*Match_Referees*/

INSERT INTO Match_Referees VALUES(1, 1111);
INSERT INTO Match_Referees VALUES(2, 1112);
INSERT INTO Match_Referees VALUES(3, 1113);
INSERT INTO Match_Referees VALUES(4, 1114);
INSERT INTO Match_Referees VALUES(5, 1115);
INSERT INTO Match_Referees VALUES(6, 1116);
INSERT INTO Match_Referees VALUES(7, 1117);
INSERT INTO Match_Referees VALUES(8, 1118);

/*Score_Details(
*/

INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 17, 1111, 7);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 9, 1112, 1);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Conversion", 57, 1113, 2);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 18, 1114, 8);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 69, 1115, 9);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Penalty", 2, 1116, 10);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 22, 1117, 4);
INSERT INTO Score_Details(score_type, time_scored, match_id, player_id) 
VALUES("Try", 74, 1118, 11);
