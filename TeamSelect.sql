----first step was to create table and decide on column names, data types and character limit -------

create table student.team_select(row_id int, order_id varchar (16),
 order_date varchar (10), ship_date varchar (10), ship_mode varchar (16),
 customer_id varchar (10), customer_name varchar (40), segment varchar (13),
 cities varchar (50), state varchar (50), country varchar (50), postal_code int,
 market varchar (8), region varchar (16), product_id varchar (20), category varchar (18),
 sub_category varchar (15), product_name varchar (100), sales numeric, quantity int, discount numeric,
 profit numeric, shipping_costs numeric, order_priority varchar (10));

---- selected all from our table to check if all the data has been imported---------


select *
from student.team_select;


-----selected all from our table using the distinct feature to make sure there was no duplicates-----


select distinct *
from team_select;


-----used count with distinct to check if rows matched with database-----


select count(distinct row_id)
from student.team_select;


--checking the number of empty cells for postcode matched database---


SELECT
    count (*) as "empty"
FROM
    student.team_select
WHERE
    postal_code is null;


---checking for number of postcodes filled in table and matched with database-----


select count (*) as "post"
from team_select
where postal_code is not null;


----used aggregate tools to calculate total sales, minimum sale and maximum sale-----


SELECT
    sum(sales),
    max(sales),
    min(sales)
FROM
    student.team_select;


----used aggregate tools to calculate total quantity of products,
-- maximum quantity sold of a product and minimum quantity----


SELECT
    sum(quantity),
    max(quantity),
    min(quantity)
FROM
    student.team_select;


--used aggregate tools to calculate total amount of discounts,
-- maximum discount provided and minimum discount---


SELECT
    sum(discount),
    max(discount),
    min(discount)


FROM
    student.team_select;


---used aggregate tools to calculate total profit earned,
-- maximum profit earned through a purchase and minimum profit (loss)-----


SELECT
    sum(profit),
    max(profit),
    min(profit)
FROM
    student.team_select;


---used aggregate tools to calculate total shipping costs,
-- maximum shipping costs from a purchase and minimum cost---


SELECT
    sum(shipping_costs),
    max(shipping_costs),
    min(shipping_costs)
FROM
    student.team_select;


--confirmed maximum length of all columns did not exceed character limits------


SELECT
    max(length(order_id)) as max_order_id,
    max(length(order_date)) as max_order_date,
    max(length(ship_date)) as max_ship_date,
    max(length(ship_mode)) as max_ship_mode,
    max(length(customer_id)) as max_customer_id,
    max(length(customer_name)) as max_customer_name,
    max(length(segment)) as max_segment,
    max(length(cities)) as max_city,
    max(length(state)) as max_state,
    max(length(country)) as max_country,
    max(length(market)) as max_market,
    max(length(region)) as max_region,
    max(length(product_id)) as max_product_id,
    max(length(category)) as max_category,
    max(length(sub_category)) as max_sub_category,
    max(length(product_name)) as max_product_name,
    max(length(order_priority)) as max_order_priority
FROM
    student.team_select;


-- replaced all non-breaking space with a normal space
UPDATE
    student.team_select
SET
    product_name = REPLACE(product_name, chr(160), ' ');


---update cities which had a '?' in place of an 'a' so it was spelt correctly---


UPDATE
    student.team_select
SET
    cities = REPLACE(cities, '?', 'a');

---30 mins test---

select

    count(distinct sub_category)
from
    team_select;

SELECT
    *
FROM
    team_select
ORDER BY
    profit DESC
limit 1;





SELECT
    SUM(profit),
    order_id
FROM
    team_select
GROUP BY
    order_id
ORDER BY
    SUM(profit) DESC;


select shipping_costs, sales, round(shipping_costs/team_select.sales * 100) as percent
from team_select
group by shipping_costs, sales, shipping_costs/team_select.sales * 100
order by percent desc ;

select *
from team_select
where order_id = 'ID-2011-78592' and customer_id = 'LH-17155'
order by product_name desc;

select max(order_date)
from team_select;

select cities, count(order_id)
from team_select
group by cities
order by count(order_id) asc, cities asc ;

select country, count(order_id)
from team_select
group by country
order by count(order_id) asc, country asc;

select *
from team_select
where order_date like '%2014'
order by order_date desc;

----number of regions in the markets----
select market, count(distinct region)
from team_select
group by market
order by count(region) asc, market asc;

select count(distinct order_id)
from team_select
where discount >=0.1;

select count(customer_name)
from team_select;

select order_priority, count(order_priority) as pri
from team_select
group by order_priority
order by pri desc;

select product_id, count(product_id) as pro
from team_select
group by product_id
order by pro desc;

select cities, count(order_id)
from team_select
group by cities
order by count(order_id) desc, cities desc;

select *
from team_select
where product_id = 'TEC-CO-10003534' and  customer_id = 'KH-16630'
order by product_id desc;


select order_id, profit, sales, round(team_select.profit/team_select.sales * 100) as percent
from team_select
group by order_id, profit, sales, team_select.profit/team_select.sales * 100
order by percent desc, order_id asc ;


select ship_mode, count(ship_mode) as mode
from team_select
group by ship_mode
order by mode asc;

select market, customer_id, count(distinct order_id) as ord
from team_select
group by market, customer_id
order by ord desc;

select customer_id, count(market)
from team_select
where market = '*'
group by customer_id, market
order by customer_id;


select count(distinct order_id)
from team_select
where discount >=0.5;






select customer_id, customer_name, count(order_id)
from team_select
group by customer_id, customer_name
order by count(order_id) desc;

select customer_name, count(order_id)
from student.team_select
group by customer_name
having count(order_id) =72
order by count(order_id) desc, customer_name asc;


select *
from team_select
where order_id = 'CA-2011-108189' and product_id = 'OFF-SU-10003567'
order by product_name desc;


select *
from team_select
where order_id = 'ID-2011-78592' and customer_id = 'LH-17155'
order by product_name desc;


select category, count(distinct category)
from team_select
group by category;


select order_id, product_id, product_name, cities, state
from team_select
where cities = state;


select customer_id, market, count(distinct customer_id )
from team_select
group by market, customer_id;

select customer_id, count( distinct market) as mar
from team_select
group by customer_id;

select customer_id, market, count(market)
from team_select
group by  market, customer_id

select *
from student.team_select;

select cities, country, count(distinct cities)
from team_select
group by cities, country;


select sum(sales*team_select.quantity)
from team_select;


select sum(sales*team_select.quantity) as rev_1, avg(discount) as dis_1

from team_select;




-----Total Sales Revenue by Year and Overall----

select sum(sales)
from team_select
where order_date like '%2011';

select sum(sales)
from team_select
where order_date like '%2012';

select sum(sales)
from team_select
where order_date like '%2013';

select sum(sales)
from team_select
where order_date like '%2014';

select sum (sales)
from team_select;


---Sales Revenue by Category---

----Top 10 Cities----
select cities, round(sum(sales),2)
from team_select
group by cities
order by sum(sales) desc, cities desc
limit  10;


----Top 10 Countries----

select country,round(sum(sales),2)
from team_select
group by country
order by sum(sales) desc, country desc
limit  10;

----Market Performance---

select market, sum(sales)
from team_select
group by market
order by sum(sales) desc ;

------Customer segment performance---

select segment, sum(sales)
from team_select
group by segment
order by sum(sales) desc, segment desc;

---Shipping mode performance----

select ship_mode, sum(sales)
from team_select
group by ship_mode
order by sum(sales) desc, ship_mode desc;

----Product category performance---

select category, sum(sales)
from team_select
group by category
order by sum(sales) desc, category desc;

---Product sub category performance---
select sub_category, sum(sales)
from team_select
group by sub_category
order by sum(sales) desc, sub_category desc;

----Top 10 Products by Sales revenue---

select product_id, product_name, round(sum(sales),2)
from team_select
group by product_id, product_name
order by sum(sales) desc, product_id desc
limit  10;

----Bottom 10 Products by Sales revenue---

select product_id, product_name, round(sum(sales),2)
from team_select
group by product_id, product_name
order by sum(sales) asc , product_id desc
limit  10;





---Top 10 customers----

select customer_id, sum(sales)
from team_select
group by customer_id
order by sum(sales) desc, customer_id desc
limit  10;

----Minimum, maximum and average Sales Revenue------

select min(sales), max(sales), avg(sales)
from team_select;



-----Total Sales Quantity by Year and Overall--------------------------------------------------------------

select sum(quantity)
from team_select
where order_date like '%2011';

select sum(quantity)
from team_select
where order_date like '%2012';

select sum(quantity)
from team_select
where order_date like '%2013';

select sum(quantity)
from team_select
where order_date like '%2014';

select sum (quantity)
from team_select;


---Sales Quantity by Category---

----Top 10 Cities----
select cities, sum(quantity)
from team_select
group by cities
order by sum(quantity) desc, cities desc
limit  10;

----Top 10 Countries----

select country, sum(quantity)
from team_select
group by country
order by sum(quantity) desc, country desc
limit  10;

----Market Performance---

select market, sum(quantity)
from team_select
group by market
order by sum(quantity) desc ;

------Customer segment performance---

select segment, sum(quantity)
from team_select
group by segment
order by sum(quantity) desc, segment desc;

---Shipping mode performance----

select ship_mode, sum(quantity)
from team_select
group by ship_mode
order by sum(quantity) desc, ship_mode desc;

----Product category performance---

select category, sum(quantity)
from team_select
group by category
order by sum(quantity) desc, category desc;

---Product sub category performance---
select sub_category, sum(quantity)
from team_select
group by sub_category
order by sum(quantity) desc, sub_category desc;

----Top 10 Products by Sales Quantity---

select product_id, sum(quantity)
from team_select
group by product_id
order by sum(quantity) desc, product_id desc
limit  10;





---Top 10 customers----

select customer_id, sum(quantity)
from team_select
group by customer_id
order by sum(quantity) desc, customer_id desc
limit  10;

----Minimum, maximum and average Sales Quantity------

select min(quantity), max(quantity), avg(quantity)
from team_select;






-----Total Profit by Year and Overall--------------------------------------------------------------

select sum(profit)
from team_select
where order_date like '%2011';

select sum(profit)
from team_select
where order_date like '%2012';

select sum(profit)
from team_select
where order_date like '%2013';

select sum(profit)
from team_select
where order_date like '%2014';

select sum (profit)
from team_select;


---Profit by Category---

----Top 10 Cities----
select cities, sum(profit)
from team_select
group by cities
order by sum(profit) desc, cities desc
limit  10;

----Top 10 Countries----

select country, sum(profit)
from team_select
group by country
order by sum(profit) desc, country desc
limit  10;

----Market Performance---

select market, sum(profit)
from team_select
group by market
order by sum(profit) desc ;

------Customer segment performance---

select segment, sum (profit)
from team_select
group by segment
order by sum(profit) desc, segment desc;

---Shipping mode performance----

select ship_mode, sum(profit)
from team_select
group by ship_mode
order by sum(profit) desc, ship_mode desc;

----Product category performance---

select category, sum(profit)
from team_select
group by category
order by sum(profit) desc, category desc;

---Product sub category performance---
select sub_category, sum(profit)
from team_select
group by sub_category
order by sum(profit) desc, sub_category desc;

----Top 10 Products by Profit---

select product_id, round(sum(profit),2)
from team_select
group by product_id
order by sum(profit) desc, product_id desc
limit  10;

----Bottom 10 Products by Profit---

select product_id, round(sum(profit),2), quantity
from team_select
group by product_id, quantity
order by sum(profit) asc, product_id desc
limit  10;


---Top 10 customers----

select customer_id, sum(profit)
from team_select
group by customer_id
order by sum(profit) desc, customer_id desc
limit  10;

----Minimum, maximum and average Profit------

select min(profit), max(profit), avg(profit)
from team_select;



-------------------Discount Behaviour-------------------------------------------------------------------------



-----Average Discount by Year and Overall----

select avg(discount)
from team_select
where order_date like '%2011';

select avg(discount)
from team_select
where order_date like '%2012';

select avg(discount)
from team_select
where order_date like '%2013';

select avg(discount)
from team_select
where order_date like '%2014';

select avg(discount)
from team_select;

------Discounted Orders------

select count(order_id)
from team_select
where discount >0;
----22281 Discounted orders (43.4%)----

select count(order_id)
from team_select
where discount =0;
------29009 Non-Discounted orders (56.5%)------



---Average Discount by Category------------------------------

----Top 10 Cities Average Discount (Minimum 1000 orders)----
select cities, sum(quantity), round( avg(discount),2)
from team_select
group by cities
having sum(quantity) >= 1000
order by avg(discount) desc
limit  10;

----Top 10 Countries Average Discount (minimum 1000 orders)----

select country, sum(quantity),round (avg(discount),2)
from team_select
group by country
having sum(quantity) >= 1000
order by avg(discount) desc
limit  10;

----Market Average Discount---

select market, sum(quantity),round( avg(discount),2)
from team_select
group by market
order by avg(discount) desc;

------Customer segment Average Discount---

select segment, sum(quantity), avg(discount)
from team_select
group by segment
order by avg(discount) desc;
---same on all 3---

---Shipping mode Average Discount----


select ship_mode, sum(quantity), avg(discount)
from team_select
group by ship_mode
order by avg(discount) desc;
---same on all 4 modes----

----Product category Average Discount---

select category, sum(quantity),round( avg(discount), 2)
from team_select
group by category
order by avg(discount) desc;

---Product sub category Average Discount---

select sub_category, sum(quantity), round( avg(discount),2)
from team_select
group by sub_category
order by avg(discount) desc;


---Top 10 customers average discount (minimum 100 orders) ----


select customer_id, sum(quantity), round( avg(discount),2)
from team_select
group by customer_id
having sum(quantity) >= 100
order by avg(discount) desc
limit  10;

----Minimum, maximum, average and standard deviation relating to Discount------

select min(discount), max(discount),round( avg(discount),2), round(stddev(discount),2)
from team_select;








-----Total Sales Revenue by Quarter-----

select *
from team_select
where order_date between '01/01/2011' and '31/03/2011'
order by order_date desc;

-----Stats----



select min(discount),max(discount), avg(discount)
from team_select;


select min(shipping_costs), max(shipping_costs), avg(shipping_costs)
from team_select;

----Summary stats that paint an overall picture of the business---

select count(sales)
from team_select;

----Number of distinct customers------

select count(distinct customer_id)
from team_select;

----Number of distinct product IDs the business used to sell items-----

select count(distinct product_id)
from team_select;

----Number of distinct product names the business used to sell items----
select count(distinct product_name)
from team_select;

----Top 10 cities based on number of orders made------

select cities, count(order_id)
from team_select
group by cities
order by count(order_id) desc, cities desc
limit  10;


----Top 10 countries based on number of orders made------

select country, count(order_id)
from team_select
group by country
order by count(order_id) desc, country desc
limit  10;

----Market performance based on orders made------

select market, count(order_id)
from team_select
group by market
order by count(order_id) desc, market desc;

---Top 10 Product IDs based on orders made-------

select product_id, count(order_id)
from team_select
group by product_id
order by count(order_id) desc, product_id desc
limit  10;

-----Top 10 customers based on number of orders made-----

select customer_id, count(order_id)
from team_select
group by customer_id
order by count(order_id) desc, customer_id desc
limit  10;

-----Frequency of shipping mode based on orders made----

select ship_mode, count(order_id)
from team_select
group by ship_mode
order by count(order_id) desc, ship_mode desc;

-----Customer segment based on orders made-----

select segment, count(order_id)
from team_select
group by segment
order by count(order_id) desc, segment desc;


-----Product category popularity based on orders made----

select category, count(order_id)
from team_select
group by category
order by count(order_id) desc, category desc;


-----Product sub category popularity based on orders made----

select sub_category, count(order_id)
from team_select
group by sub_category
order by count(order_id) desc, sub_category desc;

----Scale of order priority----

select order_priority, count(order_id)
from team_select
group by order_priority
order by count(order_id) desc, order_priority desc;


---Profit/Sales ratio--------------------------------------------------------

----Product ID----

select product_id, sales, round(team_select.profit/team_select.sales * 100) as percent
from team_select
group by product_id, sales, percent
order by percent desc ;

----Product Name---

select product_name, category, sales, round(team_select.profit/team_select.sales * 100) as percent
from team_select
group by product_name, sales, category, percent
order by percent desc ;

-----Product Category-----

select category, round(sum(team_select.profit)/sum(team_select.sales) * 100) as percent
from team_select
group by category
order by percent desc ;

----Product sub Category----

select sub_category, round(sum(team_select.profit)/sum(team_select.sales) * 100) as percent
from team_select
group by sub_category
order by percent desc ;

-----Market Performance---------

select market, round(sum(team_select.profit)/sum(team_select.sales) * 100) as percent
from team_select
group by market
order by percent desc ;








----VAR---

select stddev(sales)
from team_select;

select stddev(profit)
from team_select;



select stddev(quantity)
from team_select;

-----Min/Max-----

select *
from team_select;

----churn rate-----

select count( distinct customer_id) as cust_11, customer_name
from team_select
where order_id like '%2011%'
group by customer_name


select count( distinct customer_id) as cust_12
from team_select
where order_id like '%2012%';


select count( distinct customer_id) as cust_13
from team_select
where order_id like '%2013%';


select count( distinct customer_id) as cust_14
from team_select
where order_id like '%2014%';

select count( distinct customer_id)
from team_select;

select sub_category, category
from team_select
group by category, sub_category;