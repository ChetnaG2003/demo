create table customers(
CustomerID serial primary key,
Name varchar,
City varchar
)

create table orders(
OrderID serial primary key,
CustomerID int references customers(customerid),
OrderDate date,
Amount int
)


create table products(
ProductID serial primary key,
ProductName varchar,
Price  int,
OrderID int references orders(orderid)
)
select* from customers
copy customers from 'A:/customers_data.csv' delimiter ',' csv header
copy orders from 'A:/orders_data.csv' delimiter ',' csv header
copy products from 'A:/productdata.csv' delimiter ',' csv header



1. select c.customerid, name ,city from customers c join orders o on c.customerid=o.customerid
2. select o.orderid ,orderdate,amount from orders o join products p on o.orderid=p.orderid
3. select o.orderid,o.customerid,orderdate,amount from orders o left join customers c on o.customerid=c.customerid
4. select c.customerid ,c.name from customers c right join orders o on c.customerid=o.customerid where o.orderid is null
5. select * from customers cross join orders
6. select name,city from customers c join orders o on c.customerid=o.customerid 
7. select name ,count(c.customerid) from customers c join orders o on c.customerid=o.customerid group by name
8. select name from customers full join orders on customers.customerid=orders.customerid 
9. select name, city ,orderdate from customers join orders on  customers.customerid=orders.customerid where orderdate >'2024-01-06'
10. select name, city from customers inner join orders ON customers.customerid = orders.customerid order by name asc