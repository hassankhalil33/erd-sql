-- Rooms seating 100 people

SELECT name FROM rooms
WHERE capacity > 100;

-- Lowest start time

SELECT name FROM courses
WHERE start_time = (SELECT MIN(start_time) FROM courses);

-- Find courses of BIF major || ASSUMES NO STUDENT CAN TAKE COURSES OUTSIDE MAJOR ||

SELECT courses.name FROM courses, departments, enrolls, students, majors
WHERE departments.name = "BIF" AND courses.id_crn = enrolls.courses_id_crn
AND enrolls.students_id = students.id AND students.id = majors.students_id
AND majors.departments_id = departments.id;

-- Students not enrolled

SELECT students.name FROM students, courses, enrolls
WHERE students.name NOT IN(SELECT students.name FROM students, enrolls, courses
WHERE students.id = enrolls.students_id AND courses.id_crn = enrolls.courses_id_crn
GROUP BY students.name)
GROUP BY students.name;

-- CS students enrolled in CSC275

SELECT COUNT(*) FROM students s, departments d, courses c, enrolls e, majors m
WHERE d.name = "CS" AND c.name = "CSC275" AND c.id_crn = e.courses_id_crn
AND e.students_id = s.id AND s.id = m.students_id
AND m.departments_id = d.id;

-- CS students any course

SELECT COUNT(*) FROM students s, enrolls e, courses c, departments d, majors m
WHERE d.name = "CS" AND d.id = m.departments_id AND m.students_id = s.id 
AND s.id = e.students_id AND e.courses_id_crn = c.id_crn;

-- Number of majors each student declared

SELECT s.name, COUNT(m.students_id) FROM students s, majors m
WHERE s.id = m.students_id
GROUP BY s.name;
