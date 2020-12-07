/*Specify foreign keys for Country table.
*/

ALTER TABLE Country
ADD CONSTRAINT ForeignKey_VenueID FOREIGN KEY(venue_id)
	REFERENCES Venue(id) ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE Player
ADD CONSTRAINT ForeignKey_CountryID FOREIGN KEY(country_id)
	REFERENCES Country(abreviation) ON DELETE RESTRICT ON UPDATE CASCADE;
    

ALTER TABLE Rugby_Match
ADD CONSTRAINT ForeignKey_VenueID_1 FOREIGN KEY(venue_id)
	REFERENCES Venue(id) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT ForeignKey_HomeID FOREIGN KEY(home_team_id)
	REFERENCES Country(abreviation) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT ForeignKey_AwayID FOREIGN KEY(away_team_id)
	REFERENCES Country(abreviation) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT ForeignKey_RefereeID FOREIGN KEY(referee_id)
	REFERENCES Referee(id) ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE Coach
ADD CONSTRAINT ForeignKey_CountryID_1 FOREIGN KEY(country_id)
	REFERENCES Country(abreviation) ON DELETE RESTRICT ON UPDATE CASCADE;
    
    
ALTER TABLE Trophy
ADD CONSTRAINT ForeignKey_HolderID FOREIGN KEY(current_holder)
	REFERENCES Country(abreviation) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT check_trophy_name CHECK(
	trophy.trophy_name IN ('Championship Trophy', 'Triple Crown', 'Grand Slam', 'Calcutta Cup', 
    'Millenium Trophy', 'Centenary Quaich', 'Giuseppe Garibaldi Trophy', 'Auld Alliance Trophy', 'Doddie Weir Cup'));
  
  
ALTER TABLE Match_Referees
ADD CONSTRAINT ForeignKey_RefereeID_1 FOREIGN KEY(referee_id)
	REFERENCES Referee(id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT ForeignKey_MatchID FOREIGN KEY(match_id)
	REFERENCES Rugby_Match(id) ON DELETE RESTRICT ON UPDATE CASCADE;



ALTER TABLE Score_Details
ADD CONSTRAINT ForeignKey_MatchID_1 FOREIGN KEY(match_id)
	REFERENCES Rugby_Match(id) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT ForeignKey_PlayerID FOREIGN KEY(id)
	REFERENCES Player(id) ON DELETE CASCADE ON UPDATE CASCADE; 



