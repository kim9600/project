/* if not exists 동일한 이름의 테이블이 없으면 생성 */
create table if not exists product(
p_id varchar(10) not null,
p_name varchar(20),
p_unitPrice integer,
p_description text,
p_category varchar(20),
p_manufacturer varchar(20),
p_unitsInStock long,
p_condition varchar(20),
p_fileName varchar(20),
primary key (p_id)
)default CHARSET=utf8;

select * from product;

insert into product values('P2001','iPhone 6s',150000,'4.7-inch, 1234X750 Retina HD display, 8-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','1saJR1Z2bXn.jpg');
			
insert into product values('P1235','LG PC 그램',150000,'13.3-inch, IPS LED display, 5rd Generation Intel Core Process',
			'Notebook','LG',1000,'Refurbished','P1235.png');
			
insert into product values('P1236','Galaxy tab S',90000,'13.3-inch, IPS LED display, 5rd Generation Intel Core Process',
			'Tablet','Samsung',1000,'Old','P1236.png');

insert into product values('P2002','iPhone 6s',110000,'2.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','2B6CNk7FTUS.jpg');
insert into product values('P2003','iPhone 6s',100000,'3.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','2kvoS2pi3zw.jpg');
insert into product values('P2004','iPhone 6s',120000,'4.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','2qyjpMD0dky.jpg');
insert into product values('P2005','iPhone 6s',130000,'5.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','2sq7yVTs7L.jpg');
insert into product values('P2006','iPhone 6s',140000,'6.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','3AphSTu255x.jpg');
insert into product values('P2007','iPhone 6s',150000,'7.7-inch, 1234X750 Retina HD display, 2-megapixel iSight Camera',
			'Smart Phone','Apple',1000,'New','8pbmmuUo0bx.jpg');

alter table product change column p_name p_name varchar(20);
select * from product;
desc product;

delete from product;

create table member(
id int not null auto_increment,
name varchar(20),
passwd varchar(20),
primary key(id)
)default charset=utf8;

insert into member(name,passwd) values ('kim','1234');
insert into member(name,passwd) values ('hong','1234');
insert into member(name,passwd) values ('kang','1234');
insert into member(name,passwd) values ('wang','1234');
insert into member(name,passwd) values ('zong','1234');
select * from member;

/* 카테고리 테이블 생성*/
create table category(
seq int not null auto_increment,
categoryName varchar(20) not null,
description varchar(30),
primary key(seq)
);

select * from category;
/*카테고리 테입블에 데이타입력*/
insert into category(categoryName,description) values('Smart Phone','Smart Phone');
insert into category(categoryName,description) values('Notebook','Notebook');
insert into category(categoryName,description) values('Tablet','Tablet');

select categoryName from category order by seq;

/*주문 테이블*/
create table sale(
seq int not null auto_increment,
saledate varchar(20),
sessionId varchar(50),
productId varchar(20),
unitprice int,
saleqty int,
status  int, /* 1.결재완료 2.배송접수 3.배송중 4.배송완료. 5.수령완료 */
primary key(seq)
) default charset=utf8;

alter table sale add column status int;   /* field(status) 추가 */

select * from sale;
update sale set status = 1;

select productId, case when status = 1 then '결재완료'
                       when status = 2 then '배송접수'
                       when status = 3 then '배송중'
                       when status = 4 then '배송완료'
                       when status = 2 then '수령완료' else '미정' end
       from sale;

/*배송 테이블*/
create table delivery(
seq int not null auto_increment,
sessionId varchar(50),
name varchar(20),
deliverydate varchar(20),
nation varchar(20),
zipcode varchar(5),
address varchar(200),
primary key(seq)
) default charset=utf8;

select * from sale;
select * from delivery;
select * from product;

select * from sale s, delivery d, product p
 where s.sessionId = d.sessionId
   and s.productid = p.p_id;





