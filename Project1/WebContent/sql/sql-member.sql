drop table member;

select *from member;
create table member(
id varchar(10) not null,
password varchar(10) not null,
name varchar(10) not null,
gender varchar(4),
birth varchar(10),
mail varchar(30),
phone varchar(20),
postcode varchar(5),
address varchar(200),
detailAddress varchar(100),
extraAddress varchar(50),
regist_day varchar(50),
primary key(id)
)default charset=utf8;

select *from member;