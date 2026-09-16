USE SAKILA;
SELECT * From film;

SELECT * from film; 

SELECT * from film WHERE rating ="PG";
SELECT * from film WHERE rental_rate >4;

# rating ="PG" AND RENTAL RATE>3

SELECT * from film WHERE RATING ="PG" AND rental_rate >3;

# OR

SELECT * from film 
WHERE rental_rate=0.99 OR rental_rate =4.99;

#NOT
SELECT * from film
WHERE NOT rating="PG";

# IN 
SELECT * from film
WHERE rating = "G" AND rating= "PG";

SELECT * from film
WHERE rating IN ("G","PG");
SELECT *from film 
WHERE rental_rate IN (0.99,2.99,4.99);

# NOT INSERT
SELECT *from film 
WHERE rental_rate IN (0.99,2.99);

# BETWEEN
SELECT * from film
WHERE length BETWEEN 80 AND 100;

#NOT BETWEEN 
SELECT * from film
WHERE length NOT BETWEEN 120 AND 150;


# LIKE
SELECT title from film
WHERE title LIKE "%C";

SELECT title from film
WHERE title LIKE "B%";

SELECT title from film
WHERE title LIKE "%love%";
 
 SELECT title from film
WHERE title LIKE "%action%";

# NOT LIKE

SELECT title from film
WHERE title NOT LIKE "A%";

# IS NULL 

SELECT title ,description from film
WHERE description IS NULL;

# IS NOT NULL 
SELECT title ,description from film
WHERE description IS NOT NULL;

# DISTINCT 
SELECT DISTINCT rating from film;

# ORDER BY-  ASC, desc

SELECT title ,rental_rate
from film order by rental_rate ASC;

SELECT title ,rental_rate
from film order by rental_rate DESC;

#LIMIT

SELECT title,rental_rate
from film order by rental_rate DESC LIMIT 3;