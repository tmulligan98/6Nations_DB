/*Stored procedures to allow for easily reproducable triggers*/

/*Stored procedure for score_time*/
DROP PROCEDURE IF EXISTS check_score_time;
DELIMITER $$
CREATE PROCEDURE check_score_time(
match_id INT,
time_scored INT
)
BEGIN
	DECLARE match_finish_time TINYINT;
    SET @match_finish_time = (SELECT Rugby_Match.match_length FROM Rugby_Match WHERE Rugby_Match.id = match_id);
    IF (time_scored > match_finish_time) THEN
		SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
    END IF;
END
$$
DELIMITER ;





/*Stored procedure for checking that trophy is associated to correct country*/
DROP PROCEDURE IF EXISTS check_current_holder;
DELIMITER $$
CREATE PROCEDURE check_current_holder(
trophy_name VARCHAR(50),
current_holder CHAR(3)
)
BEGIN

	DECLARE t1 VARCHAR(50) DEFAULT "Calcutta Cup";
    DECLARE t2 VARCHAR(50) DEFAULT "Millenium Trophy";
    DECLARE t3 VARCHAR(50) DEFAULT "Centenary Quaich";
    DECLARE t4 VARCHAR(50) DEFAULT "Giuseppe Garibaldi Trophy";
    DECLARE t5 VARCHAR(50) DEFAULT "Auld Alliance Trophy";
    DECLARE t6 VARCHAR(50) DEFAULT "Doddie Weir Cup";
    
	
	IF (trophy_name = t1) THEN 
		IF (current_holder != "ENG" AND current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (trophy_name = t2) THEN 
		IF (current_holder != "ENG" AND current_holder != "IRE") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (trophy_name = t3) THEN 
		IF (current_holder != "IRE" AND current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (trophy_name = t4) THEN 
		IF (current_holder != "FRA" AND current_holder != "ITA") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (trophy_name = t5) THEN 
		IF (current_holder != "FRA" AND current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
    
    IF (trophy_name = t6) THEN 
		IF (current_holder != "WAL" AND current_holder != "SCO") THEN 
			SIGNAL sqlstate '45000' set message_text = 'Cannot set score time greater than match length';
		END IF;
	END IF;
	

END
$$
DELIMITER ;





/*Stored procedure for one_captain*/
DROP PROCEDURE IF EXISTS check_one_captain;
DELIMITER $$
CREATE PROCEDURE check_one_captain(
leadership VARCHAR(50),
country_id CHAR(3)
)
BEGIN
	
	
    IF EXISTS(SELECT Player.leadership FROM Player WHERE Player.leadership = "Captain" AND Player.country_id = country_id) THEN
		IF leadership = "Captain" THEN
		SIGNAL sqlstate '45000' set message_text = 'Only one captain is allowed per team';
        END IF;
	END IF;
END
$$
DELIMITER ;

 