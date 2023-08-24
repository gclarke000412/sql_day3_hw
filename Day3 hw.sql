-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, payment_id, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175
-- (use subqueries)
 select customer_id, first_name, last_name
 from customer
 where customer_id in (
 	select customer_id
 	from payment
 	group by customer_id, amount
 	having amount > 175
 );
 
-- 4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal';

-- 5. Which staff member had the most transactions

select staff.first_name, staff.last_name
from staff
where staff_id in (
	select staff_id 
	from rental
	group by rental_id
	order by sum(rental_id) desc 
);
-- 5. Answer: Jon Stephens

--6. 6. How many movies of each rating are there?
select movie.movie_id, movie.content_rating 
from movie
group by movie_id 
order by count(distinct content_rating);
--empty database, could not find usable one with data


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
select customer.customer_id, customer.first_name, customer.last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by payment_id, amount
	having amount > 6.99
);

-- 8. How many free rentals did our stores give away?
select rental.rental_id, count(rental.rental_id) 
from rental
full join payment
on rental.rental_id = payment.rental_id
where amount = 0
group by rental.rental_id
-- 8. Answer: 0 rentals given away for free




