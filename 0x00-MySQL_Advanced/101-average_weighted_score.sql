-- Create a stored procedure named ComputeAverageWeightedScoreForUsers
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers () -- The procedure should execute the following statements
BEGIN -- Declare a cursor to iterate over all users
DECLARE user_cursor CURSOR FOR
SELECT id
FROM users;
-- Declare a local variable to store the user id
DECLARE user_id INT;
-- Declare a local variable to store the average weighted score
DECLARE avg_weighted_score DECIMAL(10, 2);
-- Declare a flag to indicate the end of the cursor
DECLARE done INT DEFAULT FALSE;
-- Declare a handler to set the flag when the cursor is exhausted
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET done = TRUE;
-- Open the cursor
OPEN user_cursor;
-- Start a loop
loop_label: LOOP -- Fetch the next user id from the cursor
FETCH user_cursor INTO user_id;
-- If the cursor is exhausted, exit the loop
IF done THEN LEAVE loop_label;
END IF;
-- Calculate the average weighted score of the user from the corrections and projects tables
SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO avg_weighted_score
FROM corrections c
    JOIN projects p ON c.project_id = p.id
WHERE c.user_id = user_id;
-- Update the average_weighted_score attribute of the user in the users table
UPDATE users
SET average_weighted_score = avg_weighted_score
WHERE id = user_id;
-- End of loop
END LOOP loop_label;
-- Close the cursor
CLOSE user_cursor;
END;