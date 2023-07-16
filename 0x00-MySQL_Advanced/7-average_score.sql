-- This script creates a stored procedure named ComputeAverageScoreForUser that computes and stores the average score for a student.
-- First, we set the delimiter to $$ so that we can use semicolons inside the procedure.
DELIMITER $$ -- Next, we create the procedure.
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT) BEGIN -- Declare a variable to hold the average score.
DECLARE avg_score DECIMAL(10, 2);
-- Calculate the average score for the specified user.
SELECT AVG(score) INTO avg_score
FROM scores
WHERE user_id = user_id;
-- Insert the result into the average_scores table.
INSERT INTO average_scores (user_id, avg_score)
VALUES (user_id, avg_score);
END $$ -- Finally, we reset the delimiter back to ;.
DELIMITER;