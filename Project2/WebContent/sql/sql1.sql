select *from product;


select concat('P', cast(substr(max(p_id),2)as unsigned)+1) from product;

select distinct p_category from product; 

/*카테고리 테이블 생성*/
create table category(
seq int not null auto_increment,
categoryName varchar(20) not null,
description varchar(30),
primary key(seq)
);

delete from category where categoryName='Home';
select * from category;


/*카테고리 테이블에 데이타 입력*/
insert into category(categoryName,description) values('CAT', 'CAT');
insert into category(categoryName,description) values('DOG', 'DOG');
insert into category(categoryName,description) values('ETC', 'ETC');



/*배송 테이블*/
create table sale(
seq int not null auto_increment,
saledate varchar(20),
sessionId varchar(50),
productId varchar(20),
unitprice int,
saleqty int,
status int, 
primary key(seq)
)default charset=utf8;

alter table sale add column status int;

delete from sale; where seq;
alter table sale auto_increment=1;
select *from sale;
set @count=0;
update sale set seq= @count:=@count+1;

select productId,if(status=1,'결제완료','미정') from sale;




/*주문 테이블*/
create table delivery(
seq int not null auto_increment,
sessionId varchar(50), 
name varchar(20),
deliverydate varchar(20),
nation varchar(20),
zipcode varchar(5),
address varchar(200),
primary key(seq)
)default charset=utf8;

delete from delivery;
select* from delivery;

select * from sale s, delivery d, product p where s.sessionId=d.sessionId
and s.productid=p.p_id;
