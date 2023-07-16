-- This script creates an index named idx_name_first on the table names and the first letter of name.
-- First, we import the table dump.
SOURCE / path / to / names.sql;
CREATE INDEX idx_name_first ON names (LEFT(name, 1));