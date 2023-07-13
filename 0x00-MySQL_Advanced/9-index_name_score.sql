-- Import the table dump
SOURCE names.sql.zip;
-- Create an index named idx_name_first_score on the table names and the first letter of name and the score
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);