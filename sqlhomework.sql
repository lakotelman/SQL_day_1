-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name ='Wahlberg'; 
-- Count = 2

-- 2. How many payments were made between $3.99 and $5.99? 
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
-- Count = 5607

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id) as totals
FROM inventory
GROUP BY film_id
ORDER BY totals DESC;
-- 72 Films have a count of 8

-- 4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
-- Count = 0

-- 5. What store employee (get the id) sold the most rentals?
SELECT COUNT(staff_id)
FROM rental
GROUP BY staff_id;
-- Staff ID 1(Mike Hillyer)

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- Count = 378 districts 

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS num_of_a 
FROM film_actor
GROUP BY film_id
ORDER BY num_of_a DESC; 
-- film_id 508 has 15 actors. Lamb Cincinatti must have had a large budget.

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' and store_id = '1';
-- count = 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250 
ORDER BY amount DESC; 
-- count = 3 (4.99, 2.99, and 0.99)


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(rating) AS total
FROM film
GROUP BY rating
ORDER BY total DESC;
-- 5 rating categories, PG-13 has the most with a total of 223
