-- TASK 4
-- INSERT INTO location (city, state, country) 
-- VALUES
-- (Nashville, Tennessee, United States),
-- (Memphis, Tennessee, United States),
-- (Phoenix, Arizona, United States),
-- (Denver, Colorado, United States)

-- TASK 5
-- INSERT INTO person (firstName, lastName, age, location_id) 
-- VALUES
-- (Chickie, Ourtic, 21, 1),
-- (Hilton, O’Hanley, 37, 1),
-- (Barbe, Purver, 50, 3),
-- (Reeta, Sammons, 34, 2),
-- (Abbott, Fisbburne, 49, 1),
-- (Winnie, Whines, 19, 4),
-- (Samantha, Leese, 35, 2),
-- (Edouard, Lorimer, 29, 1),
-- (Mattheus, Shaplin, 27, 3),
-- (Donnell, Corney, 25, 3),
-- (Wallis, Kauschke, 28, 3),
-- (Melva, Lanham, 20, 2),
-- (Amelina, McNirlan, 22, 4),
-- (Courtney, Holley, 22, 1),
-- (Sigismond, Vala, 21, 4),
-- (Jacquelynn, Halfacre, 24, 2),
-- (Alanna, Spino, 25, 3),
-- (Isa, Slight, 32, 1),
-- (Kakalina, Renne, 26, 3)

-- TASK 6
-- INSERT INTO interest (title) 
-- VALUES
-- (Programming, Gaming, Computers, Music, Movies, Cooking, Sports)



-- TASK 7
-- INSERT INTO person_interest (person_id, interest_id) 
-- VALUES
-- ( 1, 1 ),
-- ( 1, 2 ),
-- ( 1, 6 ),
-- ( 2, 1 ),
-- ( 2, 7 ),
-- ( 2, 4 ),
-- ( 3, 1 ),
-- ( 3, 3 ),
-- ( 3, 4 ),
-- ( 4, 1 ),
-- ( 4, 2 ),
-- ( 4, 7 ),
-- ( 5, 6 ),
-- ( 5, 3 ),
-- ( 5, 4 ),
-- ( 6, 2 ),
-- ( 6, 7 ),
-- ( 7, 1 ),
-- ( 7, 3 ),
-- ( 8, 2 ),
-- ( 8, 4 ),
-- ( 9, 5 ),
-- ( 9, 6 ),
-- ( 10, 7 ),
-- ( 10, 5 ),
-- ( 11, 1 ),
-- ( 11, 2 ),
-- ( 11, 5 ),
-- ( 12, 1 ),
-- ( 12, 4 ),
-- ( 12, 5 ),
-- ( 13, 2 ),
-- ( 13, 3 ),
-- ( 13, 7 ),
-- ( 14, 2 ),
-- ( 14, 4 ),
-- ( 14, 6 ),
-- ( 15, 1 ),
-- ( 15, 5 ),
-- ( 15, 7 ),
-- ( 16, 2 ),
-- ( 16, 3 ),
-- ( 16, 4 ),
-- ( 17, 1 ),
-- ( 17, 3 ),
-- ( 17, 5 ),
-- ( 17, 7 ),
-- ( 18, 2 ),
-- ( 18, 4 ),
-- ( 18, 6 ),
-- ( 19, 1 ),
-- ( 19, 2 ),
-- ( 19, 3 ),
-- ( 19, 4 ),
-- ( 19, 5 ),
-- ( 19, 6 ),
-- ( 19, 7 )

-- TASK 8
-- UPDATE person 
-- SET age = age +1 
-- WHERE 
-- ("firstName"='Chickie' AND "lastName"='Ourtic')
-- OR ("firstName"='Winnie' AND "lastName"='Whines')
-- OR ("firstName"='Edouard' AND "lastName"='Lorimer')
-- OR ("firstName"='Courtney' AND "lastName"='Holley')
-- OR ("firstName"='Melva' AND "lastName"='Lanham')
-- OR ("firstName"='Isa' AND "lastName"='Slight')
-- OR ("firstName"='Abbott' AND "lastName"='Fisbburne')
-- OR ("firstName"='Reeta' AND "lastName"='Sammons')

-- TASK 9
-- SELECT id FROM person WHERE ("firstName"='Hilton' AND "lastName"='O’Hanley'); 
-- id of Hilton O’Hanley is 2
-- SELECT id FROM person WHERE ("firstName"='Alanna' AND "lastName"='Spino'); 
-- id of Hilton O’Hanley is 17
-- Operation note: Already enabled ON DELETE CASCADE for the person_id constraint in interest table. So we're just performing the following command:

-- DELETE FROM person WHERE (id = 2) OR (id = 17)

-- QUERYING TASKS
-- Get all the names (first and last) of the people using the application (Columns to SELECT = firstName & lastName)
SELECT "firstName", "lastName" FROM person;

-- Find all the people who live in Nashville, TN (Columns to SELECT = firstName, lastName, city, & state)
SELECT "firstName", "lastName", city, state 
	FROM person 
	JOIN location
	ON person.location_id = location.id
	WHERE location.id = 1;

-- Use COUNT & GROUP BY to figure out how many people live in each of our four cities (Resulting Columns: city & count)
SELECT city, COUNT(person.id)
	FROM person 
	JOIN location
	ON person.location_id = location.id
	GROUP BY location.city;

-- Use COUNT & GROUP BY to determine how many people are interested in each of the 7 interests (Resulting Columns: title & count)
SELECT title, COUNT(person.id) 
	FROM person
	JOIN person_interest ON person.id = person_interest.person_id
	JOIN interest ON interest.id = person_interest.interest_id
	GROUP BY interest.title;

-- Write a query that finds the names (first and last) of all the people who live in Nashville, TN and are interested in programming (Columns to SELECT = firstName, lastName, city, state, & interest title)
SELECT "firstName", "lastName", title, city 
	FROM person
	JOIN person_interest ON person.id = person_interest.person_id
	JOIN interest ON interest.id = person_interest.interest_id
	JOIN location ON location.id = person.location_id
	WHERE location.id = 1 AND interest.id = 1; 









