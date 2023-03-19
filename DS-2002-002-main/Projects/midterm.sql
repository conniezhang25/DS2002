USE sakila;
SELECT * FROM rental;
SELECT * FROM customer;
SELECT * FROM inventory;
SELECT * FROM film;
SELECT * FROM store;
SELECT * FROM payment;

#Join store and address
SELECT * FROM store
INNER JOIN address
ON store.address_id = address.address_id;

#join customers and payment with customer id
SELECT * FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id;

#join inventory with store and film inventory id
SELECT * FROM inventory
INNER JOIN film
ON inventory.film_id = film.film_id;

SELECT * FROM inventory
INNER JOIN store
ON inventory.store_id = store.store_id;

#connect rentals: inventory, customer
SELECT * FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id;

SELECT * FROM rental
INNER JOIN customer
ON customer.customer_id = rental.customer_id;
