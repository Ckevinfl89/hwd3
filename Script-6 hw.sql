--Week 5 - Wednesday Questions
--
--1. List all customers who live in Texas (use JOINs)
SELECT  c.first_name, c.last_name , a.district 
FROM customer c
JOIN address a 
ON c.customer_id =a.address_id 
WHERE a.district ='Texas'

---answer:first_name|last_name|district|
----------+---------+--------+
--Dorothy   |Taylor   |Texas   |
--Thelma    |Murray   |Texas   |
--Daniel    |Cabral   |Texas   |
--Leonard   |Schofield|Texas   |
--Alfredo   |Mcadams  |Texas   |


--2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.first_name,c.last_name,p.amount 
FROM payment p 
JOIN customer c 
ON p.customer_id =c.customer_id 
WHERE amount > 7
ORDER BY amount;

--answer:
--first_name |last_name   |amount|
-------------+------------+------+
--Justin     |Ngo         |  7.98|
--Heather    |Morris      |  7.98|
--Cathy      |Spencer     |  7.98|
--Gail       |Knight      |  7.98|
--Margie     |Wade        |  7.98|
--Bradley    |Motley      |  7.99|
--Dwight     |Lombardi    |  7.99|
--Frederick  |Isbell      |  7.99|
--Valerie    |Black       |  7.99|
--Harvey     |Guajardo    |  7.99|
--Dwight     |Lombardi    |  7.99|
--Suzanne    |Nichols     |  7.99|
--Michele    |Grant       |  7.99|
--Naomi      |Jennings    |  7.99|
--Naomi      |Jennings    |  7.99|
--Erin       |Dunn        |  7.99|
--Erin       |Dunn        |  7.99|
--Geraldine  |Perkins     |  7.99|
--Cathy      |Spencer     |  7.99|
--Roberta    |Harper      |  7.99|
--Lynn       |Payne       |  7.99|
--Lynn       |Payne       |  7.99|
--Hugh       |Waldrop     |  7.99|
--Dianne     |Shelton     |  7.99|
--Stacy      |Cunningham  |  7.99|
--Beatrice   |Arnold      |  7.99|
--Nelson     |Christenson |  7.99|
--Dana       |Hart        |  7.99|
--Sonia      |Gregory     |  7.99|
--Karl       |Seal        |  7.99|
--Annette    |Olson       |  7.99|
--June       |Carroll     |  7.99|
--June       |Carroll     |  7.99|
--Marion     |Snyder      |  7.99|
--Dana       |Hart        |  7.99|
--Dana       |Hart        |  7.99|
--Marion     |Snyder      |  7.99|
--Miriam     |Mckinney    |  7.99|
--Ana        |Bradley     |  7.99|
--Nelson     |Christenson |  7.99|
--Annette    |Olson       |  7.99|
--Violet     |Rodriquez   |  7.99|
--Allan      |Cornish     |  7.99|
--Brittany   |Riley       |  7.99|
--Violet     |Rodriquez   |  7.99|
--Yvonne     |Watkins     |  7.99|
--Brittany   |Riley       |  7.99|
--Darren     |Windham     |  7.99|
--Tyrone     |Asher       |  7.99|
--Laurie     |Lawrence    |  7.99|
--Laurie     |Lawrence    |  7.99|
--Kristen    |Chavez      |  7.99|
--Vanessa    |Sims        |  7.99|
--Vanessa    |Sims        |  7.99|
--Mathew     |Bolin       |  7.99|
--Audrey     |Ray         |  7.99|
--Mathew     |Bolin       |  7.99|
--Mae        |Fletcher    |  7.99|
--Shelly     |Watts       |  7.99|
--Neil       |Renner      |  7.99|
--Neil       |Renner      |  7.99|
--Ramona     |Hale        |  7.99|
--Erik       |Guillen     |  7.99|
--Ramona     |Hale        |  7.99|
--Ella       |Oliver      |  7.99|
--Bernice    |Willis      |  7.99|
--Eddie      |Tomlin      |  7.99|
--Stacey     |Montgomery  |  7.99|
--Wilma      |Richards    |  7.99|
--Claude     |Herzog      |  7.99|
--Natalie    |Meyer       |  7.99|
--Bessie     |Morrison    |  7.99|
--John       |Farnsworth  |  7.99|
--Melinda    |Fernandez   |  7.99|
--Joy        |George      |  7.99|
--Georgia    |Jacobs      |  7.99|
--Beatrice   |Arnold      |  7.99|
--Claudia    |Fuller      |  7.99|
--Marcia     |Dean        |  7.99|
--Marcia     |Dean        |  7.99|
--3. Show all customer names who have made over $175 in payments (use
--subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
--first_name|last_name|
------------+---------+
--Rhonda    |Kennedy  |
--Clara     |Shaw     |
--Eleanor   |Hunt     |
--Marion    |Snyder   |
--Tommy     |Collazo  |
--Karl      |Seal     |


SELECT *
FROM customer 
WHERE customer_id  IN ( 
	SELECT customer_id  
	FROM payment 
--	WHERE sum(amount) > 175
	GROUP BY customer_id
	HAVING sum(amount) > 175
);
	 
--answer; customer_id|store_id|first_name|last_name|email                            |address_id|activebool|create_date|last_update            |active|
-------------+--------+----------+---------+---------------------------------+----------+----------+-----------+-----------------------+------+
--        137|       2|Rhonda    |Kennedy  |rhonda.kennedy@sakilacustomer.org|       141|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        144|       1|Clara     |Shaw     |clara.shaw@sakilacustomer.org    |       148|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        148|       1|Eleanor   |Hunt     |eleanor.hunt@sakilacustomer.org  |       152|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        178|       2|Marion    |Snyder   |marion.snyder@sakilacustomer.org |       182|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        459|       1|Tommy     |Collazo  |tommy.collazo@sakilacustomer.org |       464|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
--        526|       2|Karl      |Seal     |karl.seal@sakilacustomer.org     |       532|true      | 2006-02-14|2013-05-26 14:49:45.738|     1|
SELECT c.first_name, c.last_name , sum(p.amount) AS total_amount 
FROM customer c
JOIN payment p
ON c.customer_id =p.customer_id 
WHERE c.customer_id  IN ( 
	SELECT p.customer_id  
	FROM payment p 
--	WHERE sum(amount) > 175
	GROUP BY customer_id
	HAVING sum(amount) > 175
)
GROUP BY c.first_name,c.last_name;

--answer: first_name|last_name|total_amount|
------------+---------+------------+
--Tommy     |Collazo  |      183.63|
--Clara     |Shaw     |      189.60|
--Karl      |Seal     |      208.58|
--Eleanor   |Hunt     |      211.55|
--Marion    |Snyder   |      194.61|
--Rhonda    |Kennedy  |      191.62|

--4. List all customers that live in Argentina (use the city table)
SELECT  c.first_name, c.last_name, c3.country
FROM customer c
JOIN address a 
ON c.customer_id = a.address_id
JOIN city c2 
ON c2.city_id = a.city_id
JOIN country c3 
ON c3.country_id = c2.country_id
WHERE c3.country = 'Argentina';

--answer: first_name|last_name|country  |
----------+---------+---------+
--Benjamin  |Varney   |Argentina|
--Casey     |Mena     |Argentina|
--Larry     |Thrasher |Argentina|
--Cynthia   |Young    |Argentina|
--Jay       |Robb     |Argentina|
--Fernando  |Churchill|Argentina|
--Phyllis   |Foster   |Argentina|
--Carmen    |Owens    |Argentina|
--Kent      |Arsenault|Argentina|
--Stella    |Moreno   |Argentina|
--Joshua    |Mark     |Argentina|
--Curtis    |Irby     |Argentina|
--Melinda   |Fernandez|Argentina|


--5. Show all the film categories with their count in descending order
SELECT c.name, COUNT(*) AS num_movies_in_cat , c.category_id
FROM film_category fc
JOIN category c 
ON c.category_id = fc.category_id
GROUP BY c.name, c.category_id 
ORDER BY num_movies_in_cat DESC;
--name       |num_movies_in_cat|category_id|
-------------+-----------------+-----------+
--Sports     |               74|         15|
--Foreign    |               73|          9|
--Family     |               69|          8|
--Documentary|               68|          6|
--Animation  |               66|          2|
--Action     |               64|          1|
--New        |               63|         13|
--Drama      |               62|          7|
--Sci-Fi     |               61|         14|
--Games      |               61|         10|
--Children   |               60|          3|
--Comedy     |               58|          5|
--Classics   |               57|          4|
--Travel     |               57|         16|
--Horror     |               56|         11|
--Music      |               51|         12|

--6. What film had the most actors in it (show film info)?
SELECT f.film_id, f.title, COUNT(*) AS actor_count
FROM film f
JOIN film_actor fa 
ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY actor_count DESC
LIMIT 1;

--answer 
--film_id|title           |actor_count|
---------+----------------+-----------+
--    508|Lambs Cincinatti|         15|

--7. Which actor has been in the least movies?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS num_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_films ASC
LIMIT 1;

--answer
--actor_id|first_name|last_name| num_films |
----------+----------+---------+-----------+
--     148|Emily     |Dee      |         14|

--8. Which country has the most cities?
SELECT co.country_id, co.country, COUNT(*) AS num_cities
FROM country co
JOIN city ci ON co.country_id = ci.country_id
GROUP BY co.country_id, co.country
ORDER BY num_cities DESC
LIMIT 3;

--ANSWER:
--country_id|country      |num_cities|
------------+-------------+----------+
--        44|India        |        60|
--        23|China        |        53|
--       103|United States|        35|

--9. List the actors who have been in between 20 and 25 films.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS num_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING  count(*) BETWEEN 20 AND 25
ORDER BY num_films DESC;

--answer
--actor_id|first_name |last_name  |num_films|
----------+-----------+-----------+---------+
--      93|Ellen      |Presley    |       25|
--       9|Joe        |Swank      |       25|
--      61|Christian  |Neeson     |       25|
--      19|Bob        |Fawcett    |       25|
--      38|Tom        |Mckellen   |       25|
--       2|Nick       |Wahlberg   |       25|
--     172|Groucho    |Williams   |       25|
--     131|Jane       |Jackman    |       25|
--     122|Salma      |Nolte      |       25|
--     180|Jeff       |Silverstone|       25|
--     114|Morgan     |Mcdormand  |       25|
--     112|Russell    |Bacall     |       25|
--      51|Gary       |Phoenix    |       25|
--      34|Audrey     |Olivier    |       25|
--      54|Penelope   |Pinkett    |       25|
--      ..........

