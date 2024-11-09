-- SIMPLE WHERE AND ORDER BY:
-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50

-- people table schema
-- id
-- name
-- age
-- You should return all people fields where their age is over 50 and order by the age descending

SELECT *
FROM people
WHERE age > 50
ORDER BY age DESC;


-- SIMPLE SUM
-- For this challenge you need to create a simple SUM statement that will sum all the ages.

-- people table schema
-- id
-- name
-- age

-- select table schema
-- age_sum (sum of ages)

SELECT SUM(age) AS age_sum FROM people;



--SIMPLE MIN/MAX
-- For this challenge you need to create a simple MIN / MAX statement that will return the Minimum and Maximum ages out of all the people.

-- people table schema
-- id
-- name
-- age

-- select table schema
-- age_min (minimum of ages)
-- age_max (maximum of ages)

SELECT MIN(age) AS age_min, MAX(age) AS age_max FROM people;



-- FIND ALL ACTIVE STUDENTS:
-- Create a simple SELECT query to display student information of all ACTIVE students.

-- TABLE STRUCTURE:

-- students
-- Id (integer)	FirstName (text)	LastName (text)	IsActive (boolean)

SELECT * FROM students WHERE IsActive = 1;



-- SIMPLE GROUP BY
-- For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.

-- people table schema
-- id
-- name
-- age

-- select table schema
-- age [group by]
-- people_count (people count)

SELECT age, COUNT (id) AS people_count FROM people GROUP BY age;



-- SIMPLE HAVING
-- For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.

-- people table schema
-- id
-- name
-- age

-- return table schema
-- age
-- total_people

SELECT age, COUNT(id) AS total_people FROM people GROUP BY age HAVING COUNT(id) >= 10;



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- **** TUTORIAL 5 **** (SUM_and_COUNT) on SQL Zoo

-------------------------------------------------------------------------------------------------------

-- ***** 1. TOTAL WORLD POPULATION

-- Show the total population of the world.

-- world(name, continent, area, population, gdp)

SELECT SUM(population)
FROM world;

-- Correct answer
-- SUM(population)
-- 7118632738


-------------------------------------------------------------------------------------------------------

-- ***** 2. LIST OF CONTINENTS

-- List all the continents - just once each.

SELECT DISTINCT continent FROM world;

-- Correct answer
-- continent
-- Africa
-- Asia
-- Caribbean
-- Eurasia
-- Europe
-- North America
-- Oceania
-- South America



-------------------------------------------------------------------------------------------------------

-- ***** 3 GDP OF AFRICA

-- Give the total GDP of Africa

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

-- Correct answer
-- SUM(gdp)
-- 1811788000000


-------------------------------------------------------------------------------------------------------

-- ***** 4. COUNT THE BIG COUNTRIES

-- How many countries have an area of at least 1000000

SELECT COUNT(name) FROM world WHERE area >= 1000000;

-- Correct answer
-- COUNT(name)
-- 29



-------------------------------------------------------------------------------------------------------

-- ***** 5 BALTIC STATES POPULATION

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- Correct answer
-- SUM(population)
-- 6251750


-------------------------------------------------------------------------------------------------------

------USING GROUP BY AND HAVING-----

-- ***** 6 COUNTING THE COUNTRIES OF EACH CONTINENT

-- For each continent show the continent and number of countries.

SELECT continent, COUNT(name) FROM world GROUP BY continent
ORDER BY continent;

-- Correct answer
-- continent	COUNT(name)
-- Africa	53
-- Asia	47
-- Caribbean	11
-- Eurasia	2
-- Europe	44
-- North America	11
-- Oceania	14
-- South America	13


-------------------------------------------------------------------------------------------------------

-- ***** 7 COUNTING BIG COUNTRIES IN EACH CONTINENT

-- For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name) FROM world WHERE population >= 10000000
GROUP BY continent;

-- Correct answer
-- continent	COUNT(name)
-- Africa	29
-- Asia	26
-- Caribbean	2
-- Eurasia	1
-- Europe	14
-- North America	4
-- Oceania	1
-- South America	8

-------------------------------------------------------------------------------------------------------

-- ***** 8 COUNTING BIG CONTINENTS

-- List the continents that have a total population of at least 100 million.

SELECT continent FROM world GROUP BY continent HAVING SUM(population)>100000000;

-- Correct answer
-- continent
-- Africa
-- Asia
-- Eurasia
-- Europe
-- North America
-- South America
