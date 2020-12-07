/*List of some potential triggers:
	On insert of score details, make sure time scored is below end time of match
    Check some dates?
    On insert new trophy, if current holder isn't from set of correct countrys, throw error
    
    ADD trigger: Country-Captain-Coach*/
    
DROP TRIGGER IF EXISTS score_time;
DELIMITER $$
CREATE TRIGGER score_time
BEFORE INSERT ON score_details
FOR EACH ROW 
BEGIN
	DECLARE match_finish_time TINYINT;
    SET @match_finish_time = (SELECT Rugby_Match.match_length FROM Rugby_Match WHERE Rugby_Match.id = NEW.match_id);
    IF (NEW.time_scored > match_finish_time) THEN
		SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
    END IF;

END;
$$
DELIMITER ;

DROP TRIGGER IF EXISTS trophy_holder;
DELIMITER $$
CREATE TRIGGER trophy_holder
BEFORE INSERT ON trophy
FOR EACH ROW
BEGIN
    DECLARE t1 VARCHAR(50) DEFAULT "Calcutta Cup";
    DECLARE t2 VARCHAR(50) DEFAULT "Millenium Trophy";
    DECLARE t3 VARCHAR(50) DEFAULT "Centenary Quaich";
    DECLARE t4 VARCHAR(50) DEFAULT "Giuseppe Garibaldi Trophy";
    DECLARE t5 VARCHAR(50) DEFAULT "Auld Alliance Trophy";
    DECLARE t6 VARCHAR(50) DEFAULT "Doddie Weir Cup";
    
	
	IF (NEW.trophy_name = t1) THEN 
		IF (NEW.current_holder != "ENG" AND NEW.current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (NEW.trophy_name = t2) THEN 
		IF (NEW.current_holder != "ENG" AND NEW.current_holder != "IRE") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (NEW.trophy_name = t3) THEN 
		IF (NEW.current_holder != "IRE" AND NEW.current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (NEW.trophy_name = t4) THEN 
		IF (NEW.current_holder != "FRA" AND NEW.current_holder != "ITA") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (NEW.trophy_name = t5) THEN 
		IF (NEW.current_holder != "FRA" AND NEW.current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (NEW.trophy_name = t6) THEN 
		IF (NEW.current_holder != "WAL" AND NEW.current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    

END;
$$
DELIMITER ;


