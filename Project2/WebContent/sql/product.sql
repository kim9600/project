create table product(
p_id varchar(10),
p_name varchar(20),
p_unitPrice int,
p_description text,
p_category varchar(20),
p_manufacturer varchar(20),
p_unitsInStock long,
p_condition varchar(20),
p_fileName varchar(20),
primary key(p_id)
);

select *from product;

select * from product where p_name like '%no%';