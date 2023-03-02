USE sakila;
-- 1
SELECT c.name, COUNT(f.film_id) AS film_number
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY c.name;

-- 2
SELECT s.first_name, s.last_name, SUM(p.amount) AS amount
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE date_format(p.payment_date,'%y') = 05 AND date_format(p.payment_date,'%m') = 08
GROUP BY p.staff_id;

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, SUM(p.amount) AS total_amount
FROM sakila.staff s
JOIN sakila.payment p ON s.staff_id = p.staff_id
JOIN sakila.rental r ON p.rental_id = r.rental_id
WHERE DATE_FORMAT(r.rental_date, '%Y-%m') = '2005-08'
GROUP BY s.staff_id
ORDER BY total_amount DESC;

-- 3
SELECT a.first_name, a.last_name, COUNT(f.film_id) AS appeared_time
FROM actor a
JOIN film_actor f
USING (actor_id)
GROUP BY f.actor_id
ORDER BY appeared_time DESC
LIMIT 1;

-- 4
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rental_time
FROM sakila.customer c
JOIN sakila.rental r
USING(customer_id)
GROUP BY c.customer_id
ORDER BY rental_time DESC
LIMIT 10;

-- 5
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN address a
USING(address_id);

-- 6
SELECT f.title, COUNT(fa.actor_id) AS actor_number
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 7
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- 8
SELECT c.name, COUNT(film_id) AS film_number
FROM category c
JOIN film_category fc
USING(category_id)
GROUP BY c.category_id
ORDER BY c.name ASC;