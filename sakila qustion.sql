USE sakila;
SELECT * from film;

# A) WITHOUT JOIN - FILM TABLE
#1) how many film
SELECT  COUNT(*) AS film_title
from film;

#2) avg.rental duration 
SELECT ROUND(AVG(rental_duration),2) AS
avg_rental_duration
FROM film;

#3) MIN & MAX RENTAL_DURATION
SELECT MAX(rental_duration) AS
max_rental_duration,
MIN(rental_duration) AS 
min_rental_duration
from film;

#4) avg rental rate 
SELECT ROUND(AVG(rental_rate),2) AS
avg_rental_rate
from film;

#5) min & max rental rate
SELECT MAX(rental_rate) AS max_rental_rate,
MIN(rental_rate) AS min_rental_rate
from film;

#6) how many film each rating
SELECT rating,COUNT(*) AS 
total_count
from film
GROUP BY rating;

#7) how many film each rental_duration
SELECT rental_duration,COUNT(*) AS
TOTAL_COUNT
from film 
GROUP BY rental_duration;

#8) AVG.replacement_cost 
SELECT ROUND(AVG(replacement_cost),2) AS
avg_replacement_cost
from film;

#9) high renral rate
SELECT title,MAX(rental_rate) AS
max_rental_rate
from film
GROUP BY title
ORDER BY max_rental_rate DESC
LIMIT 1;

#10)low rental rate
SELECT title,MIN(rental_rate) AS
min_rental_rate
from film
GROUP BY title
ORDER BY min_rental_rate ASC
LIMIT 1;

#11) highest replacement_cost
SELECT title, MAX(replacement_cost) AS
max_replacement_cost
from film
GROUP BY title
ORDER BY max_replacement_cost DESC
LIMIT 1;

#12)longest rental-duration
SELECT title,MAX(rental_duration) AS
long_rental_duration
from film
GROUP BY title
ORDER BY long_rental_duration DESC
LIMIT 1;

#13)how many film each rating and rental duration
SELECT rating,rental_duration,COUNT(*) AS
film_count
from film
GROUP BY rating,rental_duration;

#14) avg rental_rate for eaach rating
SELECT rating,ROUND(AVG(rental_rate),2) AS 
AVG_rental_rate
from film
GROUP BY rating;

#15) avg replacement_cost for eaach rating
SELECT rating,ROUND(AVG(replacement_cost),2) AS 
AVG_replacement_cost
from film
GROUP BY rating;

#16)how many film awailable each rating & rental rate
SELECT rating,rental_rate,COUNT(*) AS
Total_count
from film 
GROUP BY rating,rental_rate;

#17)rental_rate > 3
SELECT COUNT(*) AS 
film_count
from film
WHERE rental_rate >3;
 
#18) replacement_cost > 20
SELECT COUNT(*) AS
film_count
from film
WHERE replacement_cost > 20;

#19) rental_duration > 5
SELECT COUNT(*) AS
film_count
from film
WHERE rental_duration > 5;

#20) Longest description 
SELECT film_id,title,description, length(description) AS
description_length
from film
ORDER BY description_length DESC
LIMIT 5;


# B) WITHOUT JOIN - OTHER TABLE
SELECT * FROM actor;

#21)how many actor
SELECT COUNT(*) AS 
ACTOR_COUNT
from actor;

#22) how many customer 
SELECT COUNT(*) AS 
total_customer
from customer;

#23) how many staff
SELECT COUNT(*) AS
staff_count
from staff;

#24) how many categories
SELECT COUNT(*) AS
category_count
from category;

#25)how many countries
SELECT COUNT(*) AS
COUNTRY_COUNT
FROM country;

#26) how many cities 
SELECT COUNT(*) AS
city_count
from city;

#27) total no. of payments
SELECT COUNT(*) AS 
total_payment
from payment;

#29) avg. payment amount
SELECT ROUND(AVG(amount),2) AS
avg_payment
from payment;

#28) total payment amount
SELECT SUM(amount) AS 
total_payment
from payment;

#30) min & max payment amount
SELECT MAX(amount) AS max_payment,
MIN(amount) AS min_payment
from payment;

# C) EDA QUS. USING JOIN

#31) no of film each languges

SELECT COUNT(f.film_id) AS no_of_films ,l.name
from film f
INNER JOIN language l
ON F.language_id = L.language_id
GROUP BY l.name,l.language_id;

#32) how many film each category
SELECT c.name AS category,
COUNT(film_id) AS
film_count
FROM category c
INNER JOIN film_category fc
ON c.category_id = fc. category_id
GROUP BY c.category_id,c.name;

#33)which category contain the most film
SELECT c.name AS category,COUNT(film_id) AS film_count
from category c 
INNER JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;

#34) AVG. rental rate for each film category
SELECT c.name AS category,ROUND(AVG(rental_rate),2) AS avg_rental_rate
from category c 
INNER JOIN film_category fc
ON c.category_id = fc.category_id
INNER JOIN film f 
ON f.film_id = fc.film_id
GROUP BY c.category_id,c.name;

#35)AVG. replacement_cost for each film category
SELECT c. name AS category,ROUND(AVG(f.replacement_cost),2) AS avg_replacement_cost
from category c 
INNER JOIN film_category fc
ON c.category_id = fc.category_id
INNER JOIN film f
ON f.film_id =fc.film_id
GROUP BY c.category_id,c.name;

#36) how many film are each language
SELECT COUNT(f.film_id) AS film_count,l.name AS language
from film f
INNER JOIN language l 
ON f.language_id = l.language_id
GROUP BY l.language_id,l.name;

 #37)how many film are each actor
 SELECT a.first_name,last_name,ROUND(COUNT(fa.film_id),2) AS film_count
 from actor a
 INNER JOIN film_actor fa
 ON a.actor_id = fa.actor_id
 GROUP BY a.actor_id,a.first_name,a.last_name
 ORDER BY film_count DESC
 LIMIT 1;
 
 #38)whichh actor have appered in most film
 SELECT a.actor_id,a.first_name,a.last_name,COUNT(fa.film_id) AS
 film_count
 from actor a
 INNER JOIN film_actor fa
 ON a.actor_id = fa.actor_id
 GROUP BY actor_id,first_name,last_name
 ORDER BY film_count DESC;
 
 #39) how many rental each customer
 SELECT c.customer_id,c.first_name,c.last_name,COUNT(rental_id) AS
 rental_count
 from customer c
 JOIN rental r
 ON c.customer_id = r.customer_id
 GROUP BY c.customer_id,c.first_name,c.last_name;
 
 #40) which customer Have mode most rental
  SELECT c.customer_id,c.first_name,c.last_name,COUNT(rental_id) AS
 rental_count
 from customer c
 JOIN rental r
 ON c.customer_id = r.customer_id
 GROUP BY c.customer_id,c.first_name,c.last_name
 ORDER BY rental_count DESC;
 
  #41)Total payment amount of each customer
SELECT c.first_name,c.last_name,ROUND(COUNT(p.amount),2) AS
Totaal_payment
from customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name;

 
#42) which customer highest total payment
SELECT c.first_name,c.last_name,ROUND(COUNT(p.amount),2) AS
Total_payment
from customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
ORDER BY Total_payment DESC;

#43)avg payment of each customer
SELECT c.first_name,c.last_name,ROUND(AVG(p.amount),2) AS
avg_total_payment
from customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name;

#44)how many rental process each staff
SELECT s.first_name,s.last_name,COUNT(r.rental_id) AS rental_count
from rental r 
INNER JOIN staff s
ON r.staff_id = s.staff_id
GROUP BY s.staff_id,s.first_name,s.last_name;

#45) total payment amount by each staff
SELECT s.first_name,s.last_name,ROUND(COUNT(p.amount),2) AS total_payment
from staff s 
INNER JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY s.staff_id,s.first_name,s.last_name;

#46) how many inventry copies awailable for eac film
SELECT f.film_id,f.title,COUNT(i.inventory_id) AS
inventory_count
from film f
JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id,f.title;

#47)which film have highest no of inventory copies
SELECT f.film_id,f.title,COUNT(i.inventory_id) AS
inventory_count
from film f
JOIN inventory i
GROUP BY f.film_id,f.title
ORDER BY inventory_count DESC;

#48) how many city belong to each country
SELECT COUNT(c.city_id) AS city_count,co.country
from city c
INNER JOIN country co
ON c.country_id = co.country_id
GROUP BY co.country_id,co.country;

#49)how many film each category and rating
SELECT c.name AS category,
f.rating,COUNT(f.film_id) AS film_count
from category c
JOIN film_cateory fc
ON c.category_id = fc.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY c.category_id,c.name,f.rating;

#50) total payment amount foe each customer and staff member
SELECT c.customer_id,c.first_name,c.last_name,
s.staff_id,s.first_name,s.last_name,SUM(p.amount) AS total_payment
from payment p
JOIN customer c 
ON p.customer_id = c.customer_id
JOIN staff s
ON p.staff_id = s.staff_id
GROUP BY c.customer_id,c.first_name,c.last_name,s.staff_id,s.first_name,s.last_name
ORDER BY total_payment DESC
LIMIT 5;

