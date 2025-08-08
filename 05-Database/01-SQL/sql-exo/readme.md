# MySQL Basics exercises

- Create a `becode` database.
- Import the `students.sql` file from this folder.

In a second .sql file, you'll store the queries that will enable you to perform these actions:

- Display all data.
- Display first names only.
- Display first names, dates of birth and school.
- Show only female students.
- Displays only students who belong to Addy's school.
- Displays only students' first names, in reverse alphabetical order
(DESC). Next, the same thing, but limiting the results to 2.
- Adds Ginette Dalor, born 01/01/1930 and living in Brussels, still in
SQL.
- Modify Ginette (still in SQL) and change her gender and first name to "Omer".
- Delete the person whose ID is 3.
- Change the contents of the School column so that "1" is replaced by "Liege" and "2" is replaced by "Gent". (pay attention to column type!)
- Do a few more operations to see if you've got it right.

#
```
-- Display all data
SELECT * FROM students;

-- Display first names only
SELECT firstname FROM students;

-- Display first names, dates of birth and school
SELECT firstname, birthdate, school FROM students;

-- Show only female students
SELECT * FROM students
WHERE gender = 'F';

-- Display only students who belong to Addy's school
-- (Assuming "Addy's school" is represented by a school id, e.g., 1 or 2)
SELECT * FROM students
WHERE school = 'Addy';

-- Display only students' first names, in reverse alphabetical order (DESC)
SELECT firstname FROM students
ORDER BY firstname DESC;

-- Same thing, but limit the results to 2
SELECT firstname FROM students
ORDER BY firstname DESC
LIMIT 2;

-- Add Ginette Dalor, born 01/01/1930, living in Brussels
INSERT INTO students (firstname, lastname, birthdate, city, gender, school)
VALUES ('Ginette', 'Dalor', '1930-01-01', 'Brussels', 'F', NULL);

-- Modify Ginette to Omer and change gender
UPDATE students
SET firstname = 'Omer', gender = 'M'
WHERE firstname = 'Ginette' AND lastname = 'Dalor';

-- Delete the person whose ID is 3
DELETE FROM students
WHERE id = 3;

-- Change school column from numeric ID to names
-- First, change column type to VARCHAR (if it's INT)
ALTER TABLE students
MODIFY school VARCHAR(50);

UPDATE students
SET school = 'Liege'
WHERE school = '1';

UPDATE students
SET school = 'Gent'
WHERE school = '2';

-- Additional tests
-- Show all students from Liege
SELECT * FROM students
WHERE school = 'Liege';

-- Count how many students are from Gent
SELECT COUNT(*) AS gent_students
FROM students
WHERE school = 'Gent';
```