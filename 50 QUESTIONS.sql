# EDA QUS 

USE SAKILA;
SELECT *from film;

# 1)TOTAL FILM
SELECT COUNT(*) AS total_films 
FROM film;

# 2)UNIQUE titles
SELECT COUNT(DISTINCT title) AS 
unique_titles
FROM film;

# 3)MAX,MIN, AVG length
SELECT MAX(length) AS
max_length
FROM film;

SELECT MIN(length) AS
min_length
FROM fiLM;

SELECT AVG(length) AS
avg_length
from film;

#4)MAX, MIN ,AVG RENTAL RATE

SELECT MAX(rental_rate) AS
MAX_rental_rate
FROM film;

SELECT Min(rental_rate) AS
MIN_rental_rate
FROM film;

 SELECT AVG(rental_rate) AS
AVG_rental_rate
FROM film;

#5) MAX,MIN,AVG REPLACEMENT COST

SELECT MAX(replacement_cost) AS
MAX_replacement_cost
from film;

SELECT MIN(replacement_cost) AS
MIN_replacement_cost
from film;

SELECT AVG(replacement_cost) AS
AVG_replacement_cost
from film;

#6)DIFFERENT RATIMG AWAILABLE
SELECT DISTINCT rating
from film;

#7)number of film each rating category
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;


#8) film released in each year
SELECT release_year, COUNT(*) AS film_count
FROM film
GROUP BY release_year
ORDER BY release_year;

#9)avg film length by rating
SELECT rating, AVG(length) AS
avg_length
from film
GROUP BY rating
ORDER BY avg_length DESC;

#10) Avg rental_rate by rating
SELECT rating,AVG( rental_rate)
avg_rental_rate
from film
GROUP BY rating
ORDER BY avg_rental_rate ASC;

#11) Avg.replacement_cost by rating
USE Sakila;
SELECT rating,AVG(replacement_cost) AS
avg_replacement_cost
from film
GROUP BY rating
ORDER BY avg_replacement_cost ASC;

#12)film by rental_duration
SELECT rental_duration,
COUNT(*) AS film_count
FROM film
WHERE rental_duration BETWEEN 3 AND 7
GROUP BY rental_duration
ORDER BY rental duration;

#13) film with longest length
SELECT title, length
from film
WHERE length =(SELECT MAX(length) from film);

#14) film with shortest length
SELECT title, length
from film
WHERE length = (SELECT MIN(length) from film);

# 15)FILM HIGHEST RENTAL_RATE
SELECT title,rental_rate
from film 
WHERE rental_rate = (SELECT MAX(rental_rate) from film);

#16) top 10 long film
SELECT title,length
from film
ORDER BY length DESC
LIMIT 10;

#17) top 10 short film
SELECT title,length
from film
ORDER BY length ASC
LIMIT 10;

#18) TOP 10 rental_rate
SELECT title,rental_rate
from film
ORDER BY rental_rate DESC
LIMIT 10;

#19)TOP HIGH replacement_cost
SELECT title,replacement_cost
from film
ORDER BY replacement_cost DESC
LIMIT 10;

#20) LOW rental_rate
SELECT title,rental_rate
from film
ORDER BY rental_rate ASC
LIMIT 10;

#21)
SELECT title,length
from film
WHERE(length>(SELECT AVG(length) from film))
ORDER BY length DESC;

#22)
SELECT title,rental_rate
from film
WHERE(rental_rate>(SELECT AVG(rental_rate) from film))
ORDER BY rental_rate DESC;

#23)
SELECT title,replacement_cost
from film
WHERE(replacement_cost>(SELECT AVG(replacement_cost) from film))
ORDER BY replacement_cost DESC;

#24 
SELECT rental_duration,
AVG(rental_rate)
from film
GROUP BY rental_duration;

#25)
SELECT rental_duration,AVG(length)
from film
GROUP BY rental_duration;

#26)
SELECT rental_duration,AVG(replacement_cost)
from film
GROUP BY rental_duration;

#27)
SELECT rating,AVG(length) AS
avg_film_length
from film
GROUP BY rating
ORDER BY avg_film_length DESC
LIMIT 1;

#28)
SELECT rating,AVG(rental_rate) AS
avg_rental_rate
from film
GROUP BY rating
ORDER BY avg_rental_rate
LIMIT 1;

#29)
SELECT rating,AVG(replacement_cost) AS
avg_replacement_cost
from film
GROUP BY rating
ORDER BY avg_replacement_cost
LIMIT 1;

#30)
SELECT rating, COUNT(*) AS
film_count
from film
GROUP BY rating
ORDER BY film_count DESC
LIMIT 1;

#31)
SELECT title,length,rental_rate
from film
WHERE length>(SELECT AVG(length) from film)
AND
rental_rate>(SELECT AVG(rental_rate) from film);

#32)
SELECT title,length,replacement_cost
from film
WHERE length>(SELECT AVG(length) from film)
AND
replacement_cost>(SELECT AVG(replacement_cost) from film);

#33)
SELECT title,rental_rate,replacement_cost
from film 
WHERE rental_rate>(SELECT AVG(rental_rate) from film)
AND
replacement_cost<(SELECT AVG(replacement_cost) from film);

#34)
SELECT title,rental_rate,replacement_cost
from film 
WHERE rental_rate<(SELECT AVG(rental_rate) from film)
AND
replacement_cost>(SELECT AVG(replacement_cost) from film);

#35)
SELECT rating,rental_duration,
AVG(rental_rate) AS
avg_rental_rate
from film
GROUP BY rating,rental_duration;

#36) 
SELECT rating,rental_duration,
AVG(length) AS
avg_length
from film
GROUP BY rating,rental_duration;


#37)
SELECT rating,rental_duration,
AVG(replacement_cost) AS
avg_replacement_cost
from film
GROUP BY rating,rental_duration;

#38)
SELECT rating,rental_duration,
AVG(rental_rate) AS 
avg_rental
from film
GROUP BY rating,rental_duration
ORDER BY avg_rental DESC
LIMIT 1;

#39
SELECT rating,rental_duration,
AVG(length) AS
avg_film_length
from film
GROUP BY rating,rental_duration
ORDER BY avg_film_length DESC
LIMIT 1;

#40)
SELECT rating, MIN(length),MAX(length),
MAX(length)-MIN(length)
AS length_range
from film
GROUP BY rating;

#41 
SELECT title,length,rental_rate,(rental_rate/length) AS
rental_rate_per_min
from film
ORDER BY rental_rate_per_min DESC;

#42
SELECT title, length,rental_rate,(rental_rate/length) AS
rental_rate_per_min
from film
ORDER BY rental_rate_per_min DESC
LIMIT 10;

# 43
SELECT title, length,replacement_cost,(replacement_cost/length) AS
replacement_cost_per_min
from film
ORDER BY replacement_cost_per_min DESC
LIMIT 10;

#44
SELECT rating,AVG(rental_rate/length) AS
rental_rate_per_min
from film
GROUP BY rating
ORDER BY rental_rate_per_min DESC 
LIMIT 1;

#45
SELECT rating,AVG(replacement_cost/length) AS
replacement_cost_per_min
from film
GROUP BY rating
ORDER BY replacement_cost_per_min DESC 
LIMIT 1;

#46
SELECT CASE 
WHEN length<90 THEN "SHORT"
WHEN length BETWEEN 90 AND 120 THEN "MED"
ELSE "LONG" END AS category,
COUNT(*) AS film_count
from film
GROUP BY category;

#47
SELECT CASE
WHEN rental_rate<90 THEN "SHORT"
WHEN rental_rate BETWEEN 90 AND 120 THEN "MED"
ELSE "LONG" END AS category,
COUNT(*) AS film_count
FROM film
GROUP BY category;

#48
SELECT CASE
WHEN length<90 THEN "SHORT"
WHEN length BETWEEN 90 AND 120 THEN "MED"
ELSE "LONG" END AS category,
COUNT(*) AS film_count
FROM film
GROUP BY rating,category;

#49
SELECT title,length,rental_rate
from film
WHERE length>(SELECT AVG(length) FROM film)
AND
rental_rate<(SELECT AVG(rental_rate) FROM film);

# 50)
SELECT rating,COUNT(*) film_count,
AVG(length),AVG(replacement_cost),AVG(rental_rate)
from film
GROUP BY rating
ORDER BY rating;



