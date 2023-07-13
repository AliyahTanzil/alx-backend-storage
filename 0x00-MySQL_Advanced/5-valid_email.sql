-- Create a trigger named before_email_update
CREATE TRIGGER before_email_update -- The trigger should be activated before updating a row in the users table
BEFORE
UPDATE ON users -- The trigger should apply to each updated row
    FOR EACH ROW -- The trigger should execute the following statement
    BEGIN -- If the new email is different from the old email
    IF NEW.email <> OLD.email THEN -- Set the valid_email attribute to false
SET NEW.valid_email = false;
END IF;
END;