docker run --name Umuzi -e POSTGRES_PASSWORD=pass -d -p 5432:5432 postgres:alpine
docker ps
docker exec -it Umuzi bin/bash

psql -U postgres
create database umuzi;
\c umuzi

create table customers (customer_id int primary key, first_name varchar (50),last_name varchar (50), gender varchar, address varchar (200), phone integer, email varchar (100), city varchar (20), country varchar (50));
create table employees (employees_id int primary key, first_name varchar (50), last_name varchar (50), email varchar (100), job_title varchar (20));
create table orders (order_id int primary key, product_id int, payment_id int, fulfilled_by_employee_id int, date_required date, date_shipped date, status varchar (20));
create table payments(customer_id int primary key, payment_id int, payment_date date, amount decimal);
create table products (product_id int primary key, product_name varchar (100), description varchar (300), buy_price decimal);

alter table payments add foreign key (customer_id) references customers(customer_id);
alter table orders add foreign key (product_id) references products(product_id);
alter table orders add foreign key (payment_id) references payments(payment_id);
alter table orders add foreign key (fulfilled_by_employee_id) references employees(employees_id);

insert into customers (customer_id,first_name,last_name, gender, address, phone , email, city, country) values (1,'John','Hibert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South Africa');
insert into customers (customer_id,first_name,last_name, gender, address, phone , email, city, country) values (2,'Thando','Sithole','Female','240 Sect 1',0794445584,'thando@gmail.com','Cape Town','South Africa');
insert into customers (customer_id,first_name,last_name, gender, address, phone , email, city, country) values (3,'Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa');
insert into customers (customer_id,first_name,last_name, gender, address, phone , email, city, country) values (4,'Charl','Muller','Male','290A Dorset Ecke',44856872553','Charl.muller@yahoo.com','Berlin','Germany');
insert into customers (customer_id,first_name,last_name, gender, address, phone , email, city, country) values (5,'Julia','Stein','Female','2 Wernerring',448672445058,'Js234@yahoo.com','Frankfurt','Germany');

insert into employees (employees_id, first_name , last_name, email, job_title ) values (1,'Kani','Matthew','mat@gmail.com','Manager');
insert into employees (employees_id, first_name , last_name, email, job_title ) values (2,'Lesly','Cronje','LesC@gmail.com','Clerk');
insert into employees (employees_id, first_name , last_name, email, job_title ) values (3,'Gideon','Maduku','m@gmail.com','Accountant');

insert into orders (order_id, product_id, payment_id, fulfilled_by_employee_id, date_required, date_shipped, status) values (1,1,1,2,'05-09-2018',null,'Not shipped');
insert into orders (order_id, product_id, payment_id, fulfilled_by_employee_id, date_required, date_shipped, status) values (2,1,2,2,'04-09-2018','03-09-2018','Shipped');	
insert into orders (order_id, product_id, payment_id, fulfilled_by_employee_id, date_required, date_shipped, status) values (3,3,3,3,'06-09-2018',null,'Not shipped');

insert into payments(customer_id, payment_id, payment_date, amount) values (1,1,'01-09-2018',150.75);
insert into payments(customer_id, payment_id, payment_date, amount) values (5,2,'03-09-2018',150.75);
insert into payments(customer_id, payment_id, payment_date, amount) values (4,3,'03-09-2018',700.60);

insert into products (product_id, product_name, description, buy_price) values (1,'Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75);
insert into products (product_id, product_name, description, buy_price) values (2,'Classic Car','Turnable front wheels, steering function',550.75);
insert into products (product_id, product_name, description, buy_price) values (3,'Sports car','Turnable front wheels, steering function',700.60);


select * from customers;
select first_name, last_name from customers;
select first_name, last_name from customers where customer_id = 1;
update customers set first_name = 'Lerato', last_name = 'Mabitso' where customer_id = 1;
delete from customers where customer_id = 2;
select count (distinct status) from orders;
select max(amount) from payments;
select * from customers order by country;
SELECT * FROM products WHERE buy_price BETWEEN 100 AND 600;
SELECT * FROM customers WHERE country = 'Germany' AND city = 'Berlin';
SELECT * FROM customers WHERE city = 'Cape Town' OR city = 'Durban';
SELECT * FROM product WHERE buy_price > 500;
SELECT SUM(amount) FROM payments;
select count (status) from orders where status = 'Shipped';
SELECT AVG(buy_price)*12 FROM products;
SELECT * FROM payments INNER JOIN customers ON payments.customer_id = customers.customer_id;
SELECT * FROM products WHERE description LIKE 'Turnable%';









