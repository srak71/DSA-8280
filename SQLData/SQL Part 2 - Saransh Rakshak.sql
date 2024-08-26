################
#### PART 1 ####
################
USE employees;

SELECT titles.title AS Title, FORMAT(AVG(salaries.salary), 2) AS Average_salary
FROM titles
INNER JOIN salaries ON titles.emp_no = salaries.emp_no
GROUP BY titles.title
ORDER BY titles.title ASC;

################
#### PART 2 ####
################
USE sakila;

# QUESTION 1
# Which table(s) are necessary to include in a query that lists the languages of films that each customer has rented?
# sakila.film, sakila.language, sakila.inventory, sakila.rental, and sakila.customer

# QUESTION 2
# Which table(s) are necessary to identify the number of workers (staff) per store?
# sakila.staff, sakila.store


# QUERY 1
SELECT cus.first_name AS "First Name", cus.last_name AS "Last Name", cus.store_id AS "Store #", SUM(pay.amount) AS "Total Revenue" 
FROM customer AS cus
INNER JOIN sakila.payment AS pay ON pay.customer_id = cus.customer_id
GROUP BY cus.customer_id
ORDER BY SUM(pay.amount) DESC;


# QUERY 2
CREATE VIEW spend_by_customer AS
SELECT cus.first_name AS "First Name", cus.last_name AS "Last Name", cus.store_id AS "Store #", SUM(pay.amount) AS "Total Revenue" 
FROM customer AS cus
INNER JOIN sakila.payment AS pay ON pay.customer_id = cus.customer_id
GROUP BY cus.customer_id
ORDER BY SUM(pay.amount) DESC;

# SELECT * FROM spend_by_customer;


# QUERY 3
SELECT st.store_id AS "Store #",
    (SELECT 
        COUNT(inv.inventory_id) 
    FROM sakila.inventory as inv
    WHERE inv.store_id = cus.store_id
    )/
    COUNT(cus.store_id) AS "Inventory per Customer"
FROM sakila.store as st
INNER JOIN sakila.customer as cus on st.store_id = cus.store_id
GROUP BY cus.store_id;


# QUERY 4
CREATE VIEW inventory_per_customer AS
SELECT st.store_id AS "Store #",
    (SELECT 
        COUNT(inv.inventory_id) 
    FROM sakila.inventory as inv
    WHERE inv.store_id = cus.store_id
    )/
    COUNT(cus.store_id) AS "Inventory per Customer"
FROM sakila.store as st
INNER JOIN sakila.customer as cus on st.store_id = cus.store_id
GROUP BY cus.store_id;

# SELECT * FROM inventory_per_customer;


# QUERY 5
SELECT
	cus.first_name AS "First Name", 	
    cus.last_name AS "Last Name",
    cus.store_id AS "Store #", 
    sakila.get_customer_balance(cus.customer_id, CURRENT_DATE()) AS "Outstanding Balance"
FROM customer AS cus
INNER JOIN sakila.payment ON payment.customer_id = cus.customer_id
WHERE sakila.get_customer_balance(cus.customer_id, CURRENT_DATE()) != 0.00
GROUP BY payment.customer_id
ORDER BY SUM(payment.amount) DESC;

