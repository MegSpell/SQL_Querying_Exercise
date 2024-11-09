-- Comments in SQL Start with dash-dash --

-- ***** 1. Find the app with an ID of 1880

SELECT app_name FROM analytics WHERE ID = 1880;

-- playstore=# SELECT app_name FROM analytics WHERE ID = 1880;                                                
--         app_name         
-- -------------------------
--  Web Browser for Android
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ***** 2. Find the ID and app name for all apps that were last updated on August 01, 2018.

SELECT ID, app_name FROM analytics WHERE last_updated = 'August 01, 2018';

----------------------------------------------------------------------------------------------------------

-- ***** 3. Count the number of apps in each category, e.g. “Family | 1972”.

SELECT category, COUNT(app_name) FROM analytics GROUP BY category;

-- *** OR *** :

-- SELECT category, COUNT(id) FROM analytics GROUP BY category;

-- *** OR *** :

-- SELECT category, COUNT(*) FROM analytics GROUP BY category;

----------------------------------------------------------------------------------------------------------

-- ***** 4. Find the top 5 most-reviewed apps and the number of reviews for each.

SELECT app_name, SUM(reviews) FROM analytics GROUP BY app_name ORDER BY SUM(reviews) DESC LIMIT 5;

-- playstore=# SELECT app_name, SUM(reviews) FROM analytics GROUP BY app_name ORDER BY SUM(reviews) DESC LIMIT 5;
--                  app_name                 |   sum    
-- ------------------------------------------+----------
--  Facebook                                 | 78158306
--  WhatsApp Messenger                       | 78128208
--  Messenger – Text and Video Chat for Free | 69119316
--  Instagram                                | 69119316
--  Clash of Clans                           | 69109672
-- (5 rows)

-- *** OR *** :

-- SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;

----------------------------------------------------------------------------------------------------------

-- ***** 5. Find the app that has the most reviews with a rating greater than equal to 4.8.

SELECT app_name, SUM(reviews) FROM analytics WHERE rating => 4.8 ORDER BY reviews DESC LIMIT 1;

-- playstore=# SELECT app_name, SUM(reviews) FROM analytics WHERE rating >= 4.8 GROUP BY app_name ORDER BY SUM(reviews) DESC LIMIT 1;
--   app_name  |   sum   
-- ------------+---------
--  Chess Free | 4559407
-- (1 row)

-- *** OR *** : 
-- SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- playstore=# SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
--  id  |  app_name  |      category      | rating | reviews |        size        | min_installs | price | content_rating |        genres        | last_updated |  current_version   |  android_version   
-- -----+------------+--------------------+--------+---------+--------------------+--------------+-------+----------------+----------------------+--------------+--------------------+--------------------
--  260 | Chess Free | HEALTH_AND_FITNESS |    4.8 | 4559407 | Varies with device |    100000000 |     0 | Everyone       | {"Health & Fitness"} | 2018-08-01   | Varies with device | Varies with device
-- (1 row)

---------------------------------------------------------------------------------------------------------

-- ***** 6. Find the average rating for each category ordered by the highest rated to lowest rated.

SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) DESC;

-- *** OR ***:

-- SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG DESC;
----------------------------------------------------------------------------------------------------------

-- ***** 7. Find the name, price, and rating of the most expensive app with a rating that’s less than 3.

SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- playstore=# SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
--       app_name      | price  | rating 
-- --------------------+--------+--------
--  Naruto & Boruto FR | 379.99 |    2.9
-- (1 row)

-- *** OR *** :

-- SELECT app_name, MAX(price), AVG(rating) FROM analytics GROUP BY app_name HAVING AVG(rating) < 3 ORDER BY MAX(price) DESC LIMIT 1;

-- playstore=# SELECT app_name, MAX(price), AVG(rating) FROM analytics GROUP BY app_name HAVING AVG(rating) < 3 ORDER BY MAX(price) DESC LIMIT 1;
--       app_name      |  max   |        avg         
-- --------------------+--------+--------------------
--  Naruto & Boruto FR | 379.99 | 2.9000000953674316
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ***** 8. Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.

SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

----------------------------------------------------------------------------------------------------------

-- ***** 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.

SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- playstore=# SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;
--                     app_name                     
-- -------------------------------------------------
--  The Wall Street Journal: Business & Market News
--  Vikings: an Archer’s Journey
--  Shoot Em Down Free
-- (3 rows)

----------------------------------------------------------------------------------------------------------

-- ***** 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.

SELECT app_name FROM analytics WHERE price BETWEEN 0.10 AND 1 ORDER BY reviews DESC LIMIT 10;

-- playstore=# SELECT app_name FROM analytics WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews DESC LIMIT 10;    

--                   app_name                   
-- ---------------------------------------------
--  Free Slideshow Maker & Video Editor
--  Couple - Relationship App
--  Anime X Wallpaper
--  Dance On Mobile
--  Marvel Unlimited
--  FastMeet: Chat, Dating, Love
--  IHG®: Hotel Deals & Rewards
--  Live Weather & Daily Local Weather Forecast
--  DreamMapper
--  Můj T-Mobile Business
-- (10 rows)

----------------------------------------------------------------------------------------------------------

-- ***** 11. Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/

SELECT app_name FROM analytics ORDER BY last_updated LIMIT 1; 

-- playstore=# SELECT app_name FROM analytics ORDER BY last_updated LIMIT 1;                                   
--   app_name  
-- ------------
--  CP Clicker
-- (1 row)

-- *** OR FANCY SUBQUERY WAY: ***

-- SELECT app_name FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

----------------------------------------------------------------------------------------------------------

-- ***** 12. Find the most expensive app (the query is very similar to #11).

SELECT app_name FROM analytics ORDER BY price DESC LIMIT 1;

-- playstore=# SELECT app_name FROM analytics ORDER BY last_updated LIMIT 1;                                   
--   app_name  
-- ------------
--  CP Clicker
-- (1 row)

-- *** OR FANCY SUBQUERY WAY: ***

-- SELECT app_name FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

-- playstore=# SELECT app_name FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

--       app_name      
-- --------------------
--  Cardi B Piano Game
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ***** 13. Count all the reviews in the Google Play Store.

SELECT SUM(reviews) AS "All Reviews" FROM analytics;

-- playstore=# SELECT SUM(reviews) AS "All Reviews" FROM analytics;
--  All Reviews 
-- -------------
--   4814575866
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ***** 14. Find all the categories that have more than 300 apps in them.

SELECT category FROM analytics GROUP BY category HAVING COUNT(id) > 300;

-- playstore=# SELECT category FROM analytics GROUP BY category HAVING COUNT(id) > 300;
--     category     
-- -----------------
--  COMMUNICATION
--  PHOTOGRAPHY
--  GAME
--  BUSINESS
--  MEDICAL
--  TOOLS
--  LIFESTYLE
--  PRODUCTIVITY
--  PERSONALIZATION
--  FINANCE
--  SPORTS
--  FAMILY
-- (12 rows)

-- *** OR : ***

-- SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- playstore=# SELECT category FROM analytics 
-- playstore-#   GROUP BY category 
-- playstore-#   HAVING COUNT(*) > 300;
--     category     
-- -----------------
--  COMMUNICATION
--  PHOTOGRAPHY
--  GAME
--  BUSINESS
--  MEDICAL
--  TOOLS
--  LIFESTYLE
--  PRODUCTIVITY
--  PERSONALIZATION
--  FINANCE
--  SPORTS
--  FAMILY
-- (12 rows)

----------------------------------------------------------------------------------------------------------

-- ***** 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.

SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;

-- playstore=# SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;

--      app_name     | reviews | min_installs | proportion 
-- ------------------+---------+--------------+------------
--  Kim Bu Youtuber? |      66 |     10000000 |     151515
-- (1 row)