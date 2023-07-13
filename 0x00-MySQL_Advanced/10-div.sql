-- Create a function named SafeDiv
CREATE FUNCTION SafeDiv (
    -- Declare the input parameters
    a INT,
    b INT
) -- Declare the return type
RETURNS INT -- The function should execute the following statements
BEGIN -- Declare a local variable to store the result
DECLARE result INT;
-- If the second number is not equal to zero
IF b <> 0 THEN -- Set the result to the division of the first by the second number
SET result = a / b;
-- Else
ELSE -- Set the result to zero
SET result = 0;
END IF;
-- Return the result
RETURN result;
END;