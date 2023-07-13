-- Create a view named need_meeting
CREATE VIEW need_meeting AS -- Select the name of the students from the students table
SELECT name
FROM students -- Where the score is less than 80
WHERE score < 80 -- And the last_meeting is null or more than a month ago
    AND (
        last_meeting IS NULL
        OR last_meeting < CURDATE() - INTERVAL 1 MONTH
    );