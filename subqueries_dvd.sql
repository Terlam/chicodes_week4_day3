-- Inner Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id

-- Left Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name is NULL and last_name IS NULL;

-- Join that will produce info about a customer
-- From the country of Angola
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- SubQuery Examples

--Two queries split apart (which will become a subquery later)

-- Find a customer_id that has an amount greater 
-- Than 175 in total payments
SELECT customer_id, 
FROM payment
GROUP BY customer_id 
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- Find All customer info
SELECT *
FROM customer;

-- Subquery to find the 6 customers that have
-- A total amount of payments grater than 175

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Basic Subquery
-- Find all films with a language of 'English'

SELECT *
FROM film
WHERE language_id IN(
	SELECT language_id
	FROM language
	WHERE name = 'English'
);


-- Question 1
-- Answer: (below)

SELECT first_name,last_name,customer.address_id,district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Question 2
-- Answer: (below)

SELECT first_name,last_name,customer.customer_id, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- Question 3
-- Answer (answer)

SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY first_name,last_name;

-- Question 4
-- Answer (below?)

SELECT first_name,last_name,customer.address_id,city
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city	
ON address.city_id = city.city_id
WHERE city = '%';

-- Question 5
-- Answer: Jon

SELECT COUNT(DISTINCT payment_id), first_name,staff.staff_id
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, staff.staff_id;

-- Question 6
-- Answer: 178-"G" / 194-"PG" / 223-"PG-13" / 195-"R" / 210-"NC-17"

SELECT COUNT(DISTINCT film_id), rating
FROM film
GROUP BY rating;

-- Question 7
-- Answer:(below)

SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount >6.99
	)
GROUP BY first_name,last_name;

-- Question 8
-- Answer: 24 

SELECT COUNT(amount)
FROM payment
WHERE amount = 0;