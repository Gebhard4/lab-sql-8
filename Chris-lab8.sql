use sakila;

#1 Rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.

select title, length, row_number() over (order by length asc) as 'rank'
from film
where length != null or length != 0;

select distinct length from film
order by length asc;

#2 Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (partition by rating order by length desc) as 'rank'
from film
where length != null or length != 0;

#3 How many films are there for each of the categories in the category table. Use appropriate join to write this query

select count(f.film_id), c.name
from category as c
join film_category as f
on c.category_id = f.category_id
group by c.name;


#4 Which actor has appeared in the most films?

select actor.actor_id, count(film_actor.film_id) as count_films
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
group by actor_id
order by count_films desc;


#5 Most active customer (the customer that has rented the most number of films)

select customer.customer_id, count(rental.rental_id) as count_films
from customer
join rental
on customer.customer_id = rental.customer_id
group by customer_id
order by count_films desc;