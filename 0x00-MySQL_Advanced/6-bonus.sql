-- Create a stored procedure named AddBonus
CREATE PROCEDURE AddBonus (
    -- Declare the input parameters
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
) -- The procedure should execute the following statements
BEGIN -- Declare a local variable to store the project id
DECLARE project_id INT;
-- Check if the project name exists in the projects table
SELECT id INTO project_id
FROM projects
WHERE name = project_name;
-- If the project name does not exist, insert a new row in the projects table and get the generated id
IF project_id IS NULL THEN
INSERT INTO projects (name)
VALUES (project_name);
SET project_id = LAST_INSERT_ID();
END IF;
-- Insert a new row in the corrections table with the user id, project id and score
INSERT INTO corrections (user_id, project_id, score)
VALUES (user_id, project_id, score);
END;