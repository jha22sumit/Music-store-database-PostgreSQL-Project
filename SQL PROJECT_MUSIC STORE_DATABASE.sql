-- ====================================
-- BASIC QUESTIONS
-- ====================================

-- Q1. Who is the senior-most employee based on job title?
SELECT CONCAT(first_name, ' ', last_name) AS senior_most_employee
FROM employee
ORDER BY levels DESC
LIMIT 1;

-- Q2. Which country has the most invoices?
SELECT COUNT(invoice_id) AS total_invoices, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY total_invoices DESC
LIMIT 1;

-- Q3. What are the top 3 invoice amounts?
SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Q4. Which city has the best customers?
-- We want to host a promotional music festival in the city generating the most revenue.

SELECT billing_city, SUM(total) AS sum_invoice_total
FROM invoice
GROUP BY billing_city
ORDER BY sum_invoice_total DESC
LIMIT 1;

-- Q5. Who is the best customer?
-- Identify the customer who spent the most.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS best_customer,
       SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY i.customer_id, best_customer
ORDER BY total_spent DESC
LIMIT 1;


-- ====================================
-- MODERATE QUESTIONS
-- ====================================

-- Q1. List first name, last name, email & genre of all Rock music listeners.
-- Order alphabetically by email.

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

-- Q2. Which artists have written the most Rock music?
-- Return top 10 Rock bands by number of tracks.

SELECT a.artist_id, a.name AS artist_name,
       COUNT(a.artist_id) AS number_of_songs
FROM artist a
JOIN album al ON a.artist_id = al.artist_id
JOIN track t ON al.album_id = t.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

-- Q3. List all tracks that are longer than the average track length.
-- Include track name and duration (milliseconds), ordered by length.

SELECT name, milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) FROM track
)
ORDER BY milliseconds DESC;


-- ====================================
-- ADVANCED QUESTIONS (CTE / Recursive CTE)
-- ====================================

-- Q1. How much has each customer spent on the best-selling artist?
-- Return customer name, artist name, and total amount spent.

WITH best_selling_artist AS (
    SELECT ar.artist_id, ar.name AS artist_name,
           SUM(il.unit_price * il.quantity) AS total_sales
    FROM invoice_line il
    JOIN track t ON t.track_id = il.track_id
    JOIN album al ON al.album_id = t.album_id
    JOIN artist ar ON ar.artist_id = al.artist_id
    GROUP BY ar.artist_id
    ORDER BY total_sales DESC
    LIMIT 1
)
SELECT cu.customer_id,
       CONCAT(cu.first_name, ' ', cu.last_name) AS customer_name,
       bsa.artist_name,
       SUM(il.unit_price * il.quantity) AS total_spent
FROM invoice i
JOIN customer cu ON cu.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = al.artist_id
GROUP BY cu.customer_id, customer_name, bsa.artist_name
ORDER BY total_spent DESC;


-- Q2. What is the most popular music genre in each country?
-- Popularity is based on highest number of purchases.

WITH popular_genre AS (
    SELECT
        COUNT(il.quantity) AS purchases,
        c.country,
        g.name AS genre_name,
        g.genre_id,
        ROW_NUMBER() OVER (PARTITION BY c.country ORDER BY COUNT(il.quantity) DESC) AS row_num
    FROM invoice_line il
    JOIN invoice i ON i.invoice_id = il.invoice_id
    JOIN customer c ON c.customer_id = i.customer_id
    JOIN track t ON t.track_id = il.track_id
    JOIN genre g ON g.genre_id = t.genre_id
    GROUP BY c.country, g.name, g.genre_id
)
SELECT *
FROM popular_genre
WHERE row_num = 1;


-- Q3. Who are the top-spending customers in each country?
-- Return customer name, country, and total spent.

WITH customer_with_country AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        i.billing_country,
        SUM(i.total) AS total_spending
    FROM invoice i
    JOIN customer c ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, i.billing_country
),
country_max_spending AS (
    SELECT billing_country, MAX(total_spending) AS max_spending
    FROM customer_with_country
    GROUP BY billing_country
)
SELECT
    cwc.billing_country,
    cwc.total_spending,
    cwc.first_name,
    cwc.last_name
FROM customer_with_country cwc
JOIN country_max_spending cms
    ON cwc.billing_country = cms.billing_country
   AND cwc.total_spending = cms.max_spending
ORDER BY cwc.billing_country;

