#Q1: Find the most senior employee based on job title.

select first_name , last_name , title , levels from music.employee
order by levels  desc
limit 1 ;


#Q2: Determine which countries have the most invoices.

select billing_country , count(*)as invoice_id 
from music.invoice
group by billing_country
order by invoice_id desc ;


#Q3: Identify the top 3 invoice totals.

select total from music.invoice
order by total desc 
limit 3 ;

#Q4: Find the city with the highest total invoice amount to determine the best location for
#     a promotional event.
select billing_city , count(*)as invoice_id 
from music.invoice
group by billing_city
order by invoice_id desc 
limit 1 ;


#Q5: Identify the customer who has spent the most money.

select c.customer_id , 
sum(i.total) as total_spent
 from music.customer c 
 JOIN music.invoice i ON c.customer_id = i.customer_id
 group by c.customer_id 
 order by total_spent desc 
 limit 1;
 
 
 #Q1: Find the email, first name, and last name of customers who listen to Rock music.
 
select c.email , c.first_name , c.last_name
from music.customer c
join music.invoice i on c.customer_id = i.customer_id
join music.invoice_line l on i.invoice_id = l.invoice_id
join music.track t on l.track_id = t.track_id
join music.genre g on t.genre_id = g.genre_id
where g.name = 'rock'
ORDER BY c.Email ;


#Q2: Identify the top 10 rock artists based on track count.

SELECT
  a.Name AS ArtistName,
  COUNT(t.track_id) AS RockTrackCount
FROM music.artist a
JOIN music.album2 al ON a.artist_id = al.artist_id
JOIN music.track t ON al.album_id = t.album_id
JOIN music.genre g ON t.genre_id = g.genre_id
WHERE g.Name = 'Rock'
GROUP BY a.artist_id, a.name
ORDER BY RockTrackCount DESC
LIMIT 10;


#Q3: Find all track names that are longer than the average track length.

select t.name , t.milliseconds
from music.track t 
where t.milliseconds > (select avg(t.milliseconds) from music.track)
ORDER BY t.Milliseconds DESC;




