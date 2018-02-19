-- 1. What query would you run to get all the customers inside city_id = 312? 
-- Your query should return customer first name, last name, email, and address.

select c.first_name,c.last_name,c.email,address.address 
from customer c join address 
on c.address_id=address.address_id
where address.city_id='312';


-- 2. What query would you run to get all comedy films? 
-- Your query should return film title, description, release year, rating, special features, and genre (category).

select f.title,f.description,f.release_year,f.rating,f.special_features,c.name
from film f join film_category fc
on f.film_id=fc.film_id
join category c
on c.category_id=fc.category_id
where c.name='comedy';


-- 3. What query would you run to get all the films joined by actor_id=5? 
-- Your query should return the actor id, actor name, film title, description, and release year.


select a.actor_id,concat_ws('  ',a.first_name,a.last_name),f.title,f.description,f.release_year
from film f,film_actor fa, actor a
where f.film_id=fa.film_id and fa.actor_id=a.actor_id
and a.actor_id=5;


-- 4. What query would you run to get all the customers in store_id = 1 
-- and inside these cities (1, 42, 312 and 459)? 
-- Your query should return customer first name, last name, email, and address.

select c.first_name,c.last_name,c.email,a.address
from store s,customer c,address a
where s.store_id=c.store_id and a.address_id=c.address_id
and s.store_id=1 and a.city_id in (1,42,312,459);




-- 5. What query would you run to get all the films with a "rating = G" 
-- and "special feature = behind the scenes", joined by actor_id = 15? 
-- Your query should return the film title, description, release year, rating, 
-- and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.



select f.title,f.description,f.release_year,f.rating 
from film f, film_actor fa, actor a
where f.film_id=fa.film_id and fa.actor_id=a.actor_id
and f.rating='G' and f.special_features='behind the scenes' and a.actor_id=15;

-- 6. What query would you run to get all the actors that joined in the film_id = 369? 
-- Your query should return the film_id, title, actor_id, and actor_name.

select fa.film_id,f.title,a.actor_id,a.first_name,a.last_name
from actor a join film_actor fa
on a.actor_id=fa.actor_id
join film f
on f.film_id=fa.film_id
where fa.film_id=369;



-- 7. What query would you run to get all drama films with a rental rate of 2.99? 
-- Your query should return film title, description, release year, rating, special features, and genre (category).

select f.title,f.description,f.release_year,f.rating,f.special_features,c.name
from film f join film_category fa
on f.film_id=fa.film_id
join category c
on c.category_id=fa.category_id
where f.rental_rate=2.99 and c.name='drama';




-- 8. What query would you run to get all the action films which are joined by SANDRA KILMER? 
-- Your query should return film title, description, release year, rating, special features, genre (category), 
-- and actor's first name and last name.

select f.title,f.description,f.release_year,f.rating,f.special_features,a.first_name,a.last_name,c.name
from film f,film_actor fa,actor a,film_category fc,category c
where f.film_id=fa.film_id and fa.actor_id=a.actor_id
and fc.film_id=f.film_id and c.category_id=fc.category_id
and a.first_name='SANDRA' and a.last_name='KILMER'




