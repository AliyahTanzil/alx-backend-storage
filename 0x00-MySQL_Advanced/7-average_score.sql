-- Create a stored procedure named ComputeAverageScoreForUser
CREATE PROCEDURE ComputeAverageScoreForUser (
    -- Declare the input parameter
    IN user_id INT
) -- The procedure should execute the following statements
BEGIN -- Declare a local variable to store the average score
DECLARE avg_score DECIMAL(10, 2);
-- Calculate the average score of the user from the corrections table
SELECT AVG(score) INTO avg_score
FROM corrections
WHERE user_id = user_id;
-- Update the average_score attribute of the user in the users table
UPDATE users
SET average_score = avg_score
WHERE id = user_id;
END;