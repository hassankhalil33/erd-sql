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
