create table customers(
customer_id serial primary key,
customer_name varchar,
city varchar,
phone_number bigint,
email varchar,
registration_date date
)


create table orders(
order_id serial primary key,
customer_id	int references customers(customer_id),
order_date	 date,
order_amount int,
delivery_city varchar,	
payment_mode varchar

)


create table products(
product_id serial primary key,
product_name varchar,
category varchar,
price int,
stock_quantity int,
supplier_name varchar,
supplier_city varchar,
supply_date date


)
create table order_items(
order_item_id serial primary key,
order_id int references orders(order_id),
product_id int references products(product_id),
quantity int,
total_price int

)
copy customers from 'A:/Table.1--customers.csv' delimiter ',' csv header
copy orders from 'A:/orders.csv' delimiter ',' csv header
copy products from 'A:/products.csv' delimiter ',' csv header
copy order_items from 'A:/Table.4--order_items.csv' delimiter ',' csv header


-- 1. JOINS


1.
select customer_name, city, order_date from customers inner join orders on customers.customer_id=orders.customer_id
where  extract(year from order_date) = 2023;

2.
select product_name, category, total_price from customers inner join orders on customers.customer_id=orders.customer_id
join order_items on orders.order_id=order_items.order_id
join products on products.product_id=order_items.product_id 
where city='mumbai'

3.
select  payment_mode,customers.customer_name, orders.order_date, sum(order_items.total_price) as total_price
from customers
join orders on customers.customer_id = orders.customer_id
join order_items on order_items.order_id = orders.order_id
where orders.payment_mode = 'Credit Card'
group by payment_mode,customers.customer_name, orders.order_date;

4.
select order_date product_name, category, sum(total_price) as total_price from orders join order_items on orders.order_id=order_items.order_id
join products on products.product_id=order_items.product_id
where order_date between '2023-01-01' and '2023-06-30'
group by order_date,product_name, category

5.
select customer_name,sum(quantity) from customers join orders on customers.customer_id=orders.customer_id
join order_items on orders.order_id=order_items.order_id
group by customer_name


-- 2. DISTINCT

1.
select   distinct city from customers

2.
select distinct supplier_name from products

3.
select distinct payment_mode from orders

4.
select distinct category from products

5.
select distinct supplier_city from products



-- 3. ORDER BY

1. select* from customers order by customer_name asc
2. select *from order_items order by total_price desc
3. select* from products order by price asc, category desc
4. select order_id,customer_id, order_date from orders order by order_date desc
5. select city, count(*) AS total_orders from customers join  orders on customers.customer_id = orders.customer_id group by city
order by city asc;

-- 4. LIMIT & OFFSET

1. select* from customers order by customer_name asc limit 10 
2. select* from products order by price desc limit 5 
3. select* from customers order by  customer_id limit 10 offset 10
4. select order_id, order_date, customer_id from orders where extract(year from order_date) = 2023
order by order_date asc limit 5;
5. select distinct city from customers order by city asc limit 10 offset 10;

-- 5. AGGREGATE FUNCTIONS

1. select count(*) as total_no_of_orders
2. select sum(order_items.total_price) as total_revenue from orders join order_items on orders.order_id = order_items.order_id
where orders.payment_mode = 'UPI'
3.select avg(price)  from products
4. select max(total_price) as max_total_price, min(total_price) as min_total_price from order_items
join orders on orders.order_id = order_items.order_id
where extract(year from order_date) = 2023
5.select product_id, sum(quantity) as total_quantity from order_items group by product_id

-- 6.SET OPERATIONS

1. select customer_id from orders
where extract (year from order_date)=2022
intersect 
select customer_id from orders
where extract (year from order_date)=2023

2.
select product_id
from  order_items oi
join orders o on  oi.order_id = o.order_id
where extract (year from o.order_date) = 2022
except
select product_id
from order_items oi
join orders o on oi.order_id = o.order_id
where extract(year from o.order_date) = 2023;

3.select supplier_city from products
except
select city from customers

4. select supplier_city from products
union
select city from customers

5. select  product_name
from products
where product_id in ( select product_id from order_items
intersect
select product_id
from order_items oi
join orders o on oi.order_id = o.order_id
where extract(year from o.order_date) = 2023
)


7. SUBQUERIES

1. select c.customer_name from customers c join orders o on c.customer_id = o.customer_id
where o.order_amount > (select avg(order_amount)FROM orders)

2. select product_name from products where product_id in (select product_id from order_items group by product_id, order_id having count(*) > 1)

3. select product_name from products where product_id in (select oi.product_id from order_items oi join orders o on oi.order_id = o.order_id
where o.customer_id in(select customer_id from customers where city = 'Pune'))

4. select order_id, order_amount from orders where order_amount in (select distinct order_amount from orders order by order_amount desc limit 3)

5. select customer_name from customers where customer_id in ( select distinct o.customer_id from orders o join order_items oi on o.order_id = oi.order_id
where oi.product_id in (select product_id from products where price > 30000));


