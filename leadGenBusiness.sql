-- 1. What query would you run to get the total revenue for March of 2012?

select sum(amount)
from billing
where date_format(charged_datetime,'%M%Y')='March2012';


-- 2. What query would you run to get total revenue collected from the client with an id of 2?
select sum(amount)
from billing
where client_id=2;

-- 3. What query would you run to get all the sites that client=10 owns?
select *
from sites
where client_id=10;

-- 4. What query would you run to get total 
# of sites created per month per year for the client with an id of 1? What about for client=20?

select date_format(created_datetime,'%Y'),count(*),client_id
from sites
where client_id=1
-- group by date_format(created_datetime,'%M%Y')
group by date_format(created_datetime,'%Y');

-- 5. What query would you run to get the total 
# of leads generated for each of the sites between January 1, 2011 to February 15, 2011?

select sites.domain_name,count(leads.leads_id) 
from sites left join leads on sites.site_id=leads.site_id
where leads.registered_datetime>'2011-01-01' 
and leads.registered_datetime<'2011-2-15'
group by sites.site_id;

-- 6. What query would you run to get a list of client names and the total 
# of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?

select c.first_name,c.last_name,count(l.leads_id)
from clients c 
left join sites s on c.client_id=s.client_id 
left join leads l on s.site_id=l.site_id
where l.registered_datetime>'2011-01-01' and l.registered_datetime<'2011-12-31'
group by c.client_id;

-- 7. What query would you run to get a list of client names and the total 
# of leads we've generated for each client each month between months 1 - 6 of Year 2011?

select c.first_name,c.last_name,count(le.leads_id),date_format(le.registered_datetime,'%Y%M')
from clients c 
left join sites s on c.client_id=s.client_id 
left join leads as le on s.site_id=le.site_id
where le.registered_datetime>='2011-01-01' and le.registered_datetime<='2011-06-30'
group by date_format(le.registered_datetime,'%Y%M'),c.client_id;

-- 8. What query would you run to get a list of client names and the total
 # of leads we've generated for each of our clients' sites between January 1, 2011 
--  to December 31, 2011? Order this query by client id.  Come up with a second query 
--  that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.

select c.first_name,c.last_name,count(le.leads_id),s.domain_name
from clients c 
left join sites s on c.client_id=s.client_id 
left join leads as le on s.site_id=le.site_id
where le.registered_datetime>='2011-01-01' and le.registered_datetime<='2011-12-31'
group by s.site_id
order by c.client_id desc;

-- 9. Write a single query that retrieves total revenue collected 
-- from each client for each month of the year. Order it by client id.

select concat_ws('  ',first_name,c.last_name),sum(b.amount),monthname(b.charged_datetime),year(b.charged_datetime)
from billing b 
join clients c on b.client_id=c.client_id
group by monthname(b.charged_datetime),year(b.charged_datetime), c.client_id
order by c.client_id;

-- 10. Write a single query that retrieves all the sites that each client owns. 
-- Group the results so that each row shows a new client. It will become clearer when you add a new field 
-- called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)

select concat_ws('  ',c.first_name,c.last_name) as name,group_concat('/',s.domain_name) as sites
from sites s join clients c
on s.client_id= c.client_id
group by c.client_id

