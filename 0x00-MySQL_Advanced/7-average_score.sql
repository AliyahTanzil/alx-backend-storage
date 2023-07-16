-- This stored procedure computes and stores the average score for a student
-- Input: user_id - a users.id value (assumed to be linked to an existing user)
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
  -- Declare variables
  DECLARE total_score DECIMAL(10,2);
  DECLARE num_scores INT;

  -- Compute the total score and the number of scores for the user
  SELECT SUM(score), COUNT(*) INTO total_score, num_scores
  FROM scores
  WHERE user_id = user_id;

  -- Calculate the average score
  DECLARE average_score DECIMAL(10,2);
  IF num_scores > 0 THEN
    SET average_score = total_score / num_scores;
  ELSE
    SET average_score = 0;
  END IF;

  -- Store the average score for the user
  UPDATE users
  SET average_score = average_score
  WHERE id = user_id;
END $$

DELIMITER ;