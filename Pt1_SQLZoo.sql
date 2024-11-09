-- **** TUTORIAL 0 ****

-- ***** 1. INTRODUCING THE WORLD TABLE OF COUNTRIES

-- The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';

-- Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany';

-- Correct answer
-- population
-- 80716000


-------------------------------------------------------------------------------------------------------
-- ***** 2. SCANDINAVIA

-- Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Correct answer
-- name	population
-- Denmark	5634437
-- Norway	5124383
-- Sweden	9675885


-------------------------------------------------------------------------------------------------------
-- ***** 3. JUST THE RIGHT SIZE

-- Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- Correct answer
-- name	area
-- Belarus	207600
-- Ghana	238533
-- Guinea	245857
-- Guyana	214969
-- Laos	236800
-- Romania	238391
-- Uganda	241550
-- United Kingdom	242900


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- **** TUTORIAL 1 ****

-------------------------------------------------------------------------------------------------------
--  ***** 1.
-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".

-- The % is a wild-card it can match any characters
-- Find the country that start with Y

SELECT name FROM world
  WHERE name LIKE 'Y%';

-- Correct answer
-- name
-- Yemen


-------------------------------------------------------------------------------------------------------
-- ***** 2.
-- Find the countries that end with y

SELECT name FROM world
  WHERE name LIKE '%y';

-- Correct answer
-- name
-- Turkey
-- Germany
-- Hungary
-- Italy
-- Norway
-- Vatican City
-- Paraguay
-- Uruguay


-------------------------------------------------------------------------------------------------------
-- ***** 3.
-- Luxembourg has an x - so does one other country. List them both.

-- Find the countries that contain the letter x

SELECT name FROM world
  WHERE name LIKE '%x%';

-- Correct answer
-- name
-- Luxembourg
-- Mexico


-------------------------------------------------------------------------------------------------------
-- ***** 4.
-- Iceland, Switzerland end with land - but are there others?

-- Find the countries that end with land

SELECT name FROM world
  WHERE name LIKE '%land';

-- Correct answer
-- name
-- Swaziland
-- Thailand
-- Finland
-- Iceland
-- Ireland
-- Poland
-- Switzerland
-- New Zealand


-------------------------------------------------------------------------------------------------------
-- ***** 5.
-- Columbia starts with a C and ends with ia - there are two more like this.

-- Find the countries that start with C and end with ia

SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE '%ia';

-- OR:

SELECT name FROM world
  WHERE name LIKE 'C%ia';

--Correct answer
-- name
-- Cambodia
-- Colombia
-- Croatia


-------------------------------------------------------------------------------------------------------
-- ***** 6.
-- Greece has a double e - who has a double o?

-- Find the country that has oo in the name

SELECT name FROM world
  WHERE name LIKE '%oo%';

-- Correct answer
-- name
-- Cameroon


-------------------------------------------------------------------------------------------------------
-- ***** 7.
-- Bahamas has three a - who else?

-- Find the countries that have three or more a in the name

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- Correct answer
-- name
-- Central African Republic
-- Equatorial Guinea
-- Madagascar
-- Mauritania
-- Sao TomÃ© and PrÃ­ncipe
-- Tanzania
-- Afghanistan
-- Azerbaijan
-- Malaysia
-- Saudi Arabia
-- United Arab Emirates
-- Antigua and Barbuda
-- Bahamas
-- Jamaica
-- Trinidad and Tobago
-- Albania
-- Bosnia and Herzegovina
-- Kazakhstan
-- Canada
-- Guatemala
-- Nicaragua
-- Panama
-- Australia
-- Marshall Islands
-- Micronesia, Federated States of
-- Papua New Guinea
-- Paraguay
-- Saint Vincent and the Grenadines


-------------------------------------------------------------------------------------------------------
-- ***** 8.
-- India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

-- SELECT name FROM world
--  WHERE name LIKE '_n%'
-- ORDER BY name
-- Find the countries that have "t" as the second character.

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

-- Correct answer
-- name
-- Ethiopia
-- Italy


-------------------------------------------------------------------------------------------------------
-- ***** 9.
-- Lesotho and Moldova both have two o characters separated by two other characters.

-- Find the countries that have two "o" characters separated by two others.

SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- Correct answer
-- name
-- Congo, Democratic Republic of
-- Congo, Republic of
-- Lesotho
-- Morocco
-- Sao TomÃ© and PrÃ­ncipe
-- Mongolia
-- Moldova


-------------------------------------------------------------------------------------------------------
-- ***** 10.
-- Cuba and Togo have four characters names.

-- Find the countries that have exactly four characters.

SELECT name FROM world
 WHERE name LIKE '____';

-- Correct answer
-- name
-- Chad
-- Mali
-- Togo
-- Iran
-- Iraq
-- Laos
-- Oman
-- Cuba
-- Fiji
-- Peru

-------------------------------------------------------------------------------------------------------
-- ***** 11.
-- The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

-- Find the country where the name is the capital city.

SELECT name
  FROM world
 WHERE name LIKE capital;

-- Correct answer
-- name
-- Djibouti
-- Luxembourg
-- San Marino
-- Singapore


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- **** TUTORIAL 2 ****

-------------------------------------------------------------------------------------------------------
-- ***** 1. INTRODUCTION

-- Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

-- Correct answer
-- name	continent	population
-- Afghanistan	Asia	25500100
-- Albania	Europe	2821977
-- Algeria	Africa	38700000
-- Andorra	Europe	76098
-- Angola	Africa	19183590
-- Antigua and Barbuda	Caribbean	86295
-- Argentina	South America	42669500
-- Armenia	Eurasia	3017400
-- Australia	Oceania	23545500
-- Austria	Europe	8504850
-- Azerbaijan	Asia	9477100
-- Bahamas	Caribbean	351461
-- Bahrain	Asia	1234571
-- Bangladesh	Asia	156557000
-- Barbados	Caribbean	285000
-- Belarus	Europe	9467000
-- Belgium	Europe	11198638
-- Belize	North America	349728
-- Benin	Africa	9988068
-- Bhutan	Asia	749090
-- Bolivia	South America	10027254
-- Bosnia and Herzegovina	Europe	3791622
-- Botswana	Africa	2024904
-- Brazil	South America	202794000
-- Brunei	Asia	393162
-- Bulgaria	Europe	7245677
-- Burkina Faso	Africa	17322796
-- Burundi	Africa	9420248
-- Cambodia	Asia	15184116
-- Cameroon	Africa	20386799
-- Canada	North America	35427524
-- Cape Verde	Africa	491875
-- CÃ´te d'Ivoire	Africa	23919000
-- Central African Republic	Africa	4709000
-- Chad	Africa	13211000
-- Chile	South America	17773000
-- China	Asia	1365370000
-- Colombia	South America	47662000
-- Comoros	Africa	743798
-- Congo, Democratic Republic of	Africa	69360000
-- Congo, Republic of	Africa	4559000
-- Costa Rica	North America	4667096
-- Croatia	Europe	4290612
-- Cuba	Caribbean	11167325
-- Cyprus	Asia	865878
-- Czech Republic	Europe	10517400
-- Denmark	Europe	5634437
-- Djibouti	Africa	886000
-- Dominica	Caribbean	71293
-- Dominican Republic	Caribbean	9445281


-------------------------------------------------------------------------------------------------------
-- ***** 2. LARGE COUNTRIES

-- How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >= 200000000;

-- Correct answer
-- name
-- Brazil
-- China
-- India
-- Indonesia
-- United States


-------------------------------------------------------------------------------------------------------
-- ***** 3. PER CAPITA GDP

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population FROM world
WHERE population >= 200000000;

-- Correct answer
-- name	gdp/population
-- Brazil	11115.2648
-- China	6121.7106
-- India	1504.7931
-- Indonesia	3482.0205
-- United States	51032.2945


-------------------------------------------------------------------------------------------------------
-- ***** 4. SOUTH AMERICA IN MILLIONS

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

-- Correct answer
-- name	population/1000000
-- Argentina	42.6695
-- Bolivia	10.0273
-- Brazil	202.7940
-- Chile	17.7730
-- Colombia	47.6620
-- Ecuador	15.7742
-- Guyana	0.7849
-- Paraguay	6.7834
-- Peru	30.4751
-- Saint Vincent and the Grenadines	0.1090
-- Suriname	0.5342
-- Uruguay	3.2863
-- Venezuela	28.9461


-------------------------------------------------------------------------------------------------------
-- ***** 5. FRANCE, GERMANY, ITALY

-- Show the name and population for France, Germany, Italy

SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');

-- Correct answer
-- name	population
-- France	65906000
-- Germany	80716000
-- Italy	60782668


-------------------------------------------------------------------------------------------------------
-- ***** 6. UNITED

-- Show the countries which have a name that includes the word 'United'

SELECT name FROM world WHERE name LIKE '%United%';

-- Correct answer
-- name
-- United Arab Emirates
-- United Kingdom
-- United States


-------------------------------------------------------------------------------------------------------
-- ***** 7. TWO WAYS TO BE BIG

-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

-- Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;

-- Correct answer
-- name	population	area
-- Australia	23545500	7692024
-- Brazil	202794000	8515767
-- Canada	35427524	9984670
-- China	1365370000	9596961
-- India	1246160000	3166414
-- Indonesia	252164800	1904569
-- Russia	146000000	17125242
-- United States	318320000	9826675


-------------------------------------------------------------------------------------------------------
-- ***** 8. ONE OR THE OTHER BUT NOT BOTH

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;

-- Correct answer
-- name	population	area
-- Australia	23545500	7692024
-- Brazil	202794000	8515767
-- Canada	35427524	9984670
-- Indonesia	252164800	1904569
-- Russia	146000000	17125242


-------------------------------------------------------------------------------------------------------
-- ***** 9. ROUNDING

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

-- For Americas show population in millions and GDP in billions both to 2 decimal places.
-- Millions and billions
-- Divide by 1000000 (6 zeros) for millions. Divide by 1000000000 (9 zeros) for billions.
-- Missing decimals
-- For some version of SQL the division of an integer by an integer will be an integer. One way to prevent this is to divide by a floating point number such as 1000000.0.

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world WHERE continent = 'South America';

-- Correct answer
-- name	ROUND(population/1000000,2)	ROUND(gdp/1000000000,2)
-- Argentina	42.67	477.03
-- Bolivia	10.03	27.04
-- Brazil	202.79	2254.11
-- Chile	17.77	268.31
-- Colombia	47.66	369.81
-- Ecuador	15.77	87.50
-- Guyana	0.78	2.85
-- Paraguay	6.78	25.94
-- Peru	30.48	204.68
-- Saint Vincent and the Grenadines	0.11	0.69
-- Suriname	0.53	5.01
-- Uruguay	3.29	49.92
-- Venezuela	28.95	382.42


-------------------------------------------------------------------------------------------------------
-- ***** 10. TRILLION DOLLAR ECONOMIES

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3) FROM world WHERE gdp >= 1000000000000;

-- Correct answer
-- name	ROUND(gdp/population, -3)
-- Australia	66000
-- Brazil	11000
-- Canada	45000
-- China	6000
-- France	40000
-- Germany	42000
-- India	2000
-- Italy	33000
-- Japan	47000
-- Mexico	10000
-- Russia	14000
-- South Korea	22000
-- Spain	28000
-- United Kingdom	39000
-- United States	51000


--------------------------------------------------------------------------------------------------------
-- ***** 11. NAME AND CAPITAL HAVE THE SAME LENGTH

-- Greece has capital Athens.

-- Each of the strings 'Greece', and 'Athens' has 6 characters.

-- Show the name and capital where the name and the capital have the same number of characters.

-- You can use the LENGTH function to find the number of characters in a string
-- For Microsoft SQL Server the function LENGTH is LEN

SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);

--  Correct answer
-- name	capital
-- Algeria	Algiers
-- Angola	Luanda
-- Armenia	Yerevan
-- Botswana	Gaborone
-- Canada	Ottowa
-- Djibouti	Djibouti
-- Egypt	Cairo
-- Estonia	Tallinn
-- Fiji	Suva
-- Gambia	Banjul
-- Georgia	Tbilisi
-- Ghana	Accra
-- Greece	Athens
-- Luxembourg	Luxembourg
-- Mauritania	Nouakchott
-- Peru	Lima
-- Poland	Warsaw
-- Russia	Moscow
-- Rwanda	Kigali
-- San Marino	San Marino
-- Singapore	Singapore
-- Taiwan	Taipei
-- Turkey	Ankara
-- Zambia	Lusaka


---------------------------------------------------------------------------------------------------------
-- ***** 12. MATCHING NAME AND CAPITAL 

-- The capital of Sweden is Stockholm. Both words start with the letter 'S'.

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.

SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

-- Correct answer
-- name	capital
-- Algeria	Algiers
-- Andorra	Andorra la Vella
-- Barbados	Bridgetown
-- Belize	Belmopan
-- Brazil	BrasÃ­lia
-- Brunei	Bandar Seri Begawan
-- Burundi	Bujumbura
-- Guatemala	Guatemala City
-- Guyana	Georgetown
-- Kuwait	Kuwait City
-- Maldives	MalÃ©
-- Marshall Islands	Majuro
-- Mexico	Mexico City
-- Monaco	Monaco-Ville
-- Mozambique	Maputo
-- Niger	Niamey
-- Panama	Panama City
-- Papua New Guinea	Port Moresby
-- Sao TomÃ© and PrÃ­ncipe	SÃ£o TomÃ©
-- South Korea	Seoul
-- Sri Lanka	Sri Jayawardenepura Kotte
-- Sweden	Stockholm
-- Taiwan	Taipei
-- Tunisia	Tunis



-------------------------------------------------------------------------------------------------------
-- ***** 13. ALL THE VOWELS
-- Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.

-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';

-- Correct answer
-- name
-- Mozambique



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- **** TUTORIAL 3 ****

-------------------------------------------------------------------------------------------------------

-- ***** 1. WINNERS FROM 1950

-- Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

--  Correct answer
-- yr	subject	winner
-- 1950	chemistry	Kurt Alder
-- 1950	chemistry	Otto Diels
-- 1950	literature	Bertrand Russell
-- 1950	medicine	Edward Kendall
-- 1950	medicine	Philip Hench
-- 1950	medicine	Tadeus Reichstein
-- 1950	peace	Ralph Bunche
-- 1950	physics	Cecil Powell



-------------------------------------------------------------------------------------------------------

-- ***** 2. 1962 LITERATURE

-- Show who won the 1962 prize for literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature';

-- Correct answer
-- winner
-- John Steinbeck



-------------------------------------------------------------------------------------------------------

-- ***** 3. ALBERT EINSTEIN

-- Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';

-- Correct answer
-- yr	subject
-- 1921	physics



-------------------------------------------------------------------------------------------------------

-- ***** 4. RECENT PEACE PRIZES

-- Give the name of the 'peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel WHERE subject = 'peace' AND yr >= 2000;

-- Correct answer
-- winner
-- Kim Dae-jung
-- Kofi Annan
-- United Nations
-- Jimmy Carter
-- Shirin Ebadi
-- Wangari Maathai
-- International Atomic Energy Agency
-- Mohamed ElBaradei
-- Grameen Bank
-- Muhammad Yunus
-- Al Gore
-- Intergovernmental Panel on Climate Change
-- Martti Ahtisaari
-- Barack Obama
-- Liu Xiaobo
-- Ellen Johnson Sirleaf
-- Leymah Gbowee
-- Tawakkol Karman
-- European Union
-- Organisation for the Prohibition of Chemical Weapons
-- Kailash Satyarthi
-- Malala Yousafzai
-- National Dialogue Quartet
-- Juan Manuel Santos
-- International Campaign to Abolish Nuclear Weapons
-- Denis Mukwege
-- Nadia Murad
-- Abiy Ahmed Ali
-- World Food Programme
-- Dmitry Muratov
-- Maria Ressa
-- Ales Bialiatski
-- Center for Civil Liberties
-- Memorial
-- Narges Mohammadi



-------------------------------------------------------------------------------------------------------

-- ***** 5. LITERATURE IN THE 1980s

-- Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner FROM nobel WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

-- Correct answer
-- yr	subject	winner
-- 1980	literature	Czes?aw Mi?osz
-- 1981	literature	Elias Canetti
-- 1982	literature	Gabriel García Márquez
-- 1983	literature	William Golding
-- 1984	literature	Jaroslav Seifert
-- 1985	literature	Claude Simon
-- 1986	literature	Wole Soyinka
-- 1987	literature	Joseph Brodsky
-- 1988	literature	Naguib Mahfouz
-- 1989	literature	Camilo José Cela


-------------------------------------------------------------------------------------------------------

-- ***** 6. ONLY PRESIDENTS

-- Show all details of the presidential winners:

-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama

SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson','Jimmy Carter','Barack Obama');

-- Correct answer
-- yr	subject	winner
-- 1906	peace	Theodore Roosevelt
-- 2002	peace	Jimmy Carter
-- 2009	peace	Barack Obama



-------------------------------------------------------------------------------------------------------

-- ***** 7. JOHN

-- Show the winners with first name John

SELECT winner FROM nobel WHERE winner LIKE 'John_%';

-- Correct answer
-- winner
-- John Macleod
-- John Galsworthy
-- John Northrop
-- John Mott
-- John Cockcroft
-- John Enders
-- John Bardeen
-- John Kendrew
-- John Steinbeck
-- John Bardeen
-- John Cornforth
-- John Van Vleck
-- John Vane
-- John Polanyi
-- John Walker
-- John Pople
-- John Hume
-- John Fenn
-- John Sulston
-- John Hall
-- John Mather
-- John O'Keefe
-- John Goodenough
-- John Clauser


-------------------------------------------------------------------------------------------------------

-- ***** 8. CHEMISTRY AND PHYSICS FROM DIFFERENT YEARS

-- Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

SELECT yr, subject, winner FROM nobel WHERE subject = 'physics' AND yr = 1980 OR subject = 'chemistry' AND yr = 1984;

-- Correct answer
-- yr	subject	winner
-- 1980	physics	James Cronin
-- 1980	physics	Val Fitch
-- 1984	chemistry	Bruce Merrifield



-------------------------------------------------------------------------------------------------------

-- ***** 9. EXCLUDE CHEMISTS AND MEDICS

-- Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

SELECT * FROM nobel WHERE subject <> 'chemistry' AND subject <> 'medicine' AND yr = 1980;

-- Correct answer
-- yr	subject	winner
-- 1980	literature	Czes?aw Mi?osz
-- 1980	peace	Adolfo Pérez Esquivel
-- 1980	physics	James Cronin
-- 1980	physics	Val Fitch



-------------------------------------------------------------------------------------------------------

-- ***** 10. EARLY MEDICINE, LATE LITERATURE

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT * FROM nobel WHERE subject = 'medicine' AND yr < 1910 OR subject = 'literature' AND yr >= 2004;

-- Correct answer
-- yr	subject	winner
-- 1901	medicine	Emil von Behring
-- 1902	medicine	Ronald Ross
-- 1903	medicine	Niels Ryberg Finsen
-- 1904	medicine	Ivan Pavlov
-- 1905	medicine	Robert Koch
-- 1906	medicine	Camillo Golgi
-- 1906	medicine	Santiago Ramón y Cajal
-- 1907	medicine	Alphonse Laveran
-- 1908	medicine	Ilya Mechnikov
-- 1908	medicine	Paul Ehrlich
-- 1909	medicine	Theodor Kocher
-- 2004	literature	Elfriede Jelinek
-- 2005	literature	Harold Pinter
-- 2006	literature	Orhan Pamuk
-- 2007	literature	Doris Lessing
-- 2008	literature	Jean-Marie Gustave Le Clézio
-- 2009	literature	Herta Müller
-- 2010	literature	Mario Vargas Llosa
-- 2011	literature	Tomas Tranströmer
-- 2012	literature	Mo Yan
-- 2013	literature	Alice Munro
-- 2014	literature	Patrick Modiano
-- 2015	literature	Svetlana Alexievich
-- 2016	literature	Bob Dylan
-- 2017	literature	Kazuo Ishiguro
-- 2018	literature	Olga Tokarczuk
-- 2019	literature	Peter Handke
-- 2020	literature	Louise Glück
-- 2021	literature	Abdulrazak Gurnah
-- 2022	literature	Annie Ernaux
-- 2023	literature	Jon Fosse



-------------------------------------------------------------------------------------------------------
--HARDER QUESTIONS:

-- ***** 11. UMLAUT

-- Find all details of the prize won by PETER GRÜNBERG

-- Non-ASCII characters
-- The u in his name has an umlaut. You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding

--FOR MAC:
-- macOS with an English keyboard layout (Australian, British, or U.S.): type ⌥ Option+U followed by ⇧ Shift+U for ⟨Ü⟩ or ⌥ Option+U and then U for ⟨ü⟩ or by keeping the U key pressed and then typing 2 

SELECT * FROM nobel WHERE winner = 'Peter Grünberg';

-- Correct answer
-- yr	subject	winner
-- 2007	physics	Peter Grünberg


-------------------------------------------------------------------------------------------------------
--HARDER QUESTIONS:

-- ***** 12. APOSTROPHE

-- Find all details of the prize won by EUGENE O'NEILL

-- Escaping single quotes
-- You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.

SELECT * FROM nobel WHERE winner = 'Eugene O''Neill';

-- Correct answer
-- yr	subject	winner
-- 1936	literature	Eugene O'Neill



-------------------------------------------------------------------------------------------------------
--HARDER QUESTIONS:

-- ***** 13. KNIGHTS OF THE REALM

-- Knights in order

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

-- Correct answer
-- winner	yr	subject
-- Sir Peter Ratcliffe	2019	medicine
-- Sir Gregory Winter	2018	chemistry
-- Sir Fraser Stoddart	2016	chemistry
-- Sir John Gurdon	2012	medicine
-- Sir Martin Evans	2007	medicine
-- Sir Peter Mansfield	2003	medicine
-- Sir Paul Nurse	2001	medicine
-- Sir Harold Kroto	1996	chemistry
-- Sir James Black	1988	medicine
-- Sir Nevill Mott	1977	physics
-- Sir Bernard Katz	1970	medicine
-- Sir John Eccles	1963	medicine
-- Sir Frank Macfarlane Burnet	1960	medicine
-- Sir Cyril Hinshelwood	1956	chemistry
-- Sir Robert Robinson	1947	chemistry
-- Sir Alexander Fleming	1945	medicine
-- Sir Howard Florey	1945	medicine
-- Sir Henry Dale	1936	medicine
-- Sir Norman Angell	1933	peace
-- Sir Charles Sherrington	1932	medicine
-- Sir Chandrasekhara Venkata Raman	1930	physics
-- Sir Frederick Hopkins	1929	medicine
-- Sir Austen Chamberlain	1925	peace
-- Sir William Ramsay	1904	chemistry



-------------------------------------------------------------------------------------------------------
--HARDER QUESTIONS:

-- ***** 14. CHEMISTRY AND PHYSICS LAST

-- The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.

-- Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY  subject IN ('physics','chemistry') ASC, subject, winner;

--  Correct answer
-- winner	subject
-- Jaroslav Seifert	literature
-- César Milstein	medicine
-- GeorgesF. Köhler	medicine
-- Niels Jerne	medicine
-- Desmond Tutu	peace
-- Bruce Merrifield	chemistry
-- Carlo Rubbia	physics
-- Simon van der Meer	physics



