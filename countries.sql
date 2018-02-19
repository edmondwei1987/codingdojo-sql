select countries.name,languages.language,languages.percentage 
from countries join languages 
on countries.id=languages.country_id 
where languages.language='Slovene'
order by languages.percentage desc;



select countries.name,count(*)
from countries join cities
on countries.id=cities.country_id
group by countries.id
order by count(*) desc;


select cities.name,cities.population
from countries join cities
on countries.id=cities.country_id
where countries.name='mexico' and cities.population>500000
order by cities.population desc;

select countries.name,languages.language
from countries join languages
on countries.id=languages.country_id
where languages.percentage>89
order by languages.percentage desc;

select * 
from countries
where surface_area<501 and population>100000;

select * 
from countries
where life_expectancy>75 and government_form='Constitutional Monarchy'
and capital>200;

select countries.name,cities.name,cities.district,cities.population
from countries join cities
on countries.id=cities.country_id
where countries.name='Argentina' and cities.district='Buenos Aires' and cities.population>50000;

select region,count(*)
from countries
group by region
order by count(*) desc;
