-- SQL script to create a stored procedure to compute and store the average score for a student

-- Description: This stored procedure takes a user_id as input and calculates the average score for the corresponding student.

-- Drop the stored procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser$$

-- Create the stored procedure
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN p_user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    -- Calculate the average score for the given user_id
    SELECT AVG(score) INTO avg_score
    FROM scores
    WHERE user_id = p_user_id;

    -- Insert or update the average score for the user
    INSERT INTO average_scores (user_id, average_score)
    VALUES (p_user_id, avg_score)
    ON DUPLICATE KEY UPDATE average_score = avg_score;

    -- Optionally, you can return the average score as output
    SELECT avg_score AS average_score;
END $$
DELIMITER ;
