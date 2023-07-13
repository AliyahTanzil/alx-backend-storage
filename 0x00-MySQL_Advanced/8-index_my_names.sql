-- Import the table dump
SOURCE names.sql.zip;
-- Create an index named idx_name_first on the table names and the first letter of name
CREATE INDEX idx_name_first ON names (LEFT(name, 1));