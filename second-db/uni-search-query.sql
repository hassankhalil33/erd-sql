-- Rooms seating 100 people

SELECT name FROM rooms
WHERE capacity > 100;

-- Lowest start time

SELECT name FROM courses
WHERE start_time = (SELECT MIN(start_time) FROM courses);

