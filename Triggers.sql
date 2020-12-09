/*List of some potential triggers:
	On insert of score details, make sure time scored is below end time of match
    Check some dates?
    On insert new trophy, if current holder isn't from set of correct countrys, throw error
    
    ADD trigger: Country-Captain-Coach*/
    
DROP TRIGGER IF EXISTS score_time_insert;
DELIMITER $$
CREATE TRIGGER score_time_insert
BEFORE INSERT ON Score_Details
FOR EACH ROW 
BEGIN
	CALL check_score_time(NEW.match_id, NEW.time_scored);
END;
$$
DELIMITER ;


DROP TRIGGER IF EXISTS score_time_update;
DELIMITER $$
CREATE TRIGGER score_time_update
BEFORE UPDATE ON Score_Details
FOR EACH ROW 
BEGIN
	CALL check_score_time(NEW.match_id, NEW.time_scored);
END;
$$
DELIMITER ;


DROP TRIGGER IF EXISTS trophy_holder;
DELIMITER $$
CREATE TRIGGER trophy_holder
BEFORE INSERT ON Trophy
FOR EACH ROW
BEGIN
   CALL check_current_holder(NEW.trophy_name, NEW.current_holder);
    

END;
$$
DELIMITER ;


DROP TRIGGER IF EXISTS only_one_captain;
DELIMITER $$
CREATE TRIGGER only_one_captain
BEFORE INSERT ON Player
FOR EACH ROW
BEGIN

	DECLARE leadership_role VARCHAR(50);
	
    IF EXISTS(SELECT Player.leadership FROM Player WHERE Player.leadership = "Captain" AND Player.country_id = NEW.country_id) THEN
		IF NEW.leadership = "Captain" THEN
		SIGNAL sqlstate '45000' set message_text = 'Only one captain is allowed per team';
        END IF;
	END IF;


END;
$$
DELIMITER ;




