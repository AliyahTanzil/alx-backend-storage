-- Create a stored procedure named ComputeAverageWeightedScoreForUser
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    -- Declare the input parameter
    IN user_id INT
) -- The procedure should execute the following statements
BEGIN -- Declare a local variable to store the average weighted score
DECLARE avg_weighted_score DECIMAL(10, 2);
-- Calculate the average weighted score of the user from the corrections and projects tables
SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO avg_weighted_score
FROM corrections c
    JOIN projects p ON c.project_id = p.id
WHERE c.user_id = user_id;
-- Update the average_weighted_score attribute of the user in the users table
UPDATE users
SET average_weighted_score = avg_weighted_score
WHERE id = user_id;
END;