USE SAKILA;

#1)FILM+LANGUAGES
SELECT f.title, l.name
from film f
INNER JOIN language l
ON f.language_id = l.language_id;

#2)ACTOR + FILM ACTOR
SELECT a.first_name,a.last_name,fa.actor_id
from actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id; 

#3) FILM + IVENTORY
SELECT f.title,i.inventory_id
from film f
INNER JOIN inventory i
ON f.film_id = i.film_id;

#4) FILM + FILM CATEGORY
SELECT f.title, fc.category_id
from film f
INNER JOIN film_category fc
ON f.film_id = fc. film_id;

#5) category + film_category
SELECT c.name AS category_name, fc. film_id
from category c
INNER JOIN film_category fc
ON c.category_id = fc.category_id;

#6) customer + payment
SELECT c.first_name,c.last_name,p.amount
from customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id;

#7)customer + rental
SELECT c.first_name,c.last_name,r.rental_date
from customer c
INNER JOIN rental r
ON c.customer_id = r. customer_id;

# 8) staff + payment
SELECT s.first_name,s.last_name,p. amount
from staff s
INNER JOIN payment p 
ON s.staff_id = p.staff_id;

#9) CITY + COUNTRY
SELECT c.city AS city_name,co.country_id
from city c
INNER JOIN country co
ON c.country_id = co.country_id;

#10)  film + languages- english
SELECT f.title, l.name AS language_name
from film f
INNER JOIN language l
ON f.language_id = l.language_id
WHERE l.name = 'English';

 