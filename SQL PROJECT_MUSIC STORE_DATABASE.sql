                    --Basic Question
--Q1. Who is the senior most employee based on Job title ?
---select * from employee 


select concat(first_name,last_name)as senior_most_employee
from employee
order by levels desc
limit 1;

--Q2.which country have the most Invoices ?
---select * from invoice


select count(invoice_id)as total_inv, billing_country
from invoice
group by billing_country
order by total_inv desc
limit 1;

--Q3.what are the top 3 values of Invoice ?
--select * from invoice


select total from invoice 
order by total desc
limit 3

/*Q4.Which city has the best customers ?.We would like to throw a promotional music
     Festival in the city we made the most money. Write a query to return one city that
     has the highest sum of invoice total . Return both city and sum of all invoice 
     total.

*/
--select * from customer
--select * from invoice


select billing_city , sum(total)as sum_invoice_total
from invoice
group by billing_city
order by sum_invoice_total desc
limit 1

/* Q5. Who is the best customer ?.The customer who spent the most money will be
       declared as the best customer.Write a query that returns the person who 
       spent the most money.
	                           */

select concat(c.first_name,c.last_name)as best_customer, sum(i.total)as total_spent
from customer c
join invoice as i on 
c.customer_id=i.customer_id
group by i.customer_id,best_customer
order by total_spent desc
limit 1

--------------------------------------------------------------------------
                          --Moderate Questions
/* Q1. Write  a query to return firstname, lastname,email & genre of all Rock 
       music  listners. Return you ordered list alphabetically by email  
       starting with A.   
	                      */

select  distinct c.first_name , c.last_name, c.email
from customer as c
join invoice as i on
c.customer_id=i.customer_id
join invoice_line as il on
i.invoice_id=il.invoice_id
join track as t on 
il.track_id=t.track_id
join genre as g on
g.genre_id=t.genre_id
where g.name ='Rock' 
order by c.email


 /* Q2.Let's invite the artist who have written the most rock music in our dataset.
       Write a query that returns the artists name and total track count of the 
	   top-10 Rock bands
	                       */

select a.artist_id ,a.name as artist_name, count(a.artist_id)as number_of_songs
from  artist as a
join album as al on
a.artist_id=al.artist_id
join track as t on
al.album_id=t.album_id
join genre as g on
t.genre_id=g.genre_id
where g.name='Rock'
group by a.artist_id
order by number_of_songs desc
limit 10

/* Q3. Return all the track names that have a song lengther than avg song length.
       Return all the name and miliseconds for each track.order by the song
       lenth with the longest song listed first.
                                                       */
.
select name,milliseconds
from track
where milliseconds > (
select Avg(milliseconds)as avg_track_length from track)
order by milliseconds desc


              --SET 3 ADVANCE QUESTION ( using CTE/Recursive CTE)


/* Q1.Find how much amount spent by each customers on artists.write a query to
      return all the customer name,artists name, and total spent . 
	                                                                       */

with best_selling_artist as (
select ar.artist_id as artist_id,ar.name as artist_name,sum(inl.unit_price*inl.quantity)
as total_sales
from invoice_line as inl
join track as t on t.track_id=inl.track_id
join album as al on al.album_id=t.album_id
join artist as ar on ar.artist_id=al.artist_id
group by 1
order by 3 desc
limit 1)

select cu.customer_id, concat(cu.first_name,cu.last_name)as cus_name,
 bsa.artist_name ,sum(inl.unit_price*inl.quantity)as total_spent
from invoice as i
Join customer as cu on cu.customer_id=i.customer_id
join invoice_line as inl on i.invoice_id=inl.invoice_id
join track as t on inl.track_id=t.track_id
join album as al on t.album_id=al.album_id
join best_selling_artist as bsa on bsa.artist_id=al.artist_id
group by 1,2,3
order by 4 desc


/* 
Q2.We want to find  ou thr most popular music genre for each country. we determine
   the most popular  genre as the genre wit the highest amount of purchases.Write
   the query  thta returns  each country  along with  the top genre .
   for countries where the maximum number of  purchases shared  return all Genres.
       */


With popular_genre as (
select count(invoice_line.quantity)As purchases,customer.country,genre.name,
genre.genre_id,
Row_number() over(partition by customer.country order by count(invoice_line.quantity)
desc)as Row_num
from invoice_line
Join invoice  on  invoice.invoice_id=invoice_line.invoice_id
join customer on customer.customer_id=invoice.customer_id
join track on track.track_id=invoice_line.track_id
join genre  on genre.genre_id=track.genre_id
group by  2,3,4
order by  2 asc, 1 desc
)
select * from  popular_genre where  Row_num<=1

/* Q3.Write a query that determines  the customer that has spent the most
      on music for each country.write a query that returns the country along
      with the top customers and how much they spent. for country where the
      top amount spent is shared,provided all customer.

                                                         */
with recursive customer_with_country as (
 select  customer.customer_id,first_name,last_name,billing_country,sum(total)
as total_spending
from invoice 
join customer on customer.customer_id=invoice.customer_id
group by 1,2,3,4
order by 2,3 desc) ,
country_max_spending as (
select billing_country,max(total_spending)as max_spending
from customer_with_country
group by billing_country)

select cc.billing_country,cc.total_spending,cc.first_name,cc.last_name
from customer_with_country cc
join country_max_spending ms
on
 cc.billing_country=ms.billing_country
 where cc.total_spending=ms.max_spending
 order by 1



---------------------------------------------------------------------------------------------



 
