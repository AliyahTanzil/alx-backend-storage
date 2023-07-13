-- Create a trigger named after_order
CREATE TRIGGER after_order -- The trigger should be activated after inserting a new row in the orders table
AFTER
INSERT ON orders -- The trigger should apply to each new row
    FOR EACH ROW -- The trigger should execute the following statement
    BEGIN -- Decrease the quantity of the item by the number of units ordered
UPDATE items
SET quantity = quantity - NEW.number_of_units -- Where the item id matches the one in the new order
WHERE id = NEW.item_id;
END;