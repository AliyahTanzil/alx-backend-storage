-- Create a trigger named after_order
-- A SQL script that lists all bands with Glam rock as their main style, ranked by their longevity
-- 
-- Initial
CREATE TRIGGER decrease_items_quantity
AFTER
INSERT ON orders FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;