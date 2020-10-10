create table users(
id varchar(20) primary key,
password varchar(20) not null,
name varchar(20) not null,
eng_Lastname varchar(20) not null,
eng_Firstname varchar(20) not null,
gender varchar(4),
birth varchar(20),
email varchar(30),
phone varchar(20),
role varchar(20)
);
select * from users ;


select * from orders where user_id='hong12';
insert into orders(order_id,amount,user_id) values('1234','1000','hong12')

select *from orders where 1=1;
delete from orders where user_id='hong';
update users set password='123123' where id='hong';

insert into users values('admin1','admin1234','관리자','관','리자','M','19190101','admin@gmail.com','01012345678','admin');
INSERT INTO USERS VALUES('hong','123123','홍길동','홍','길동','M','20000101','HONG@NAVER.COM','01012345678','USER');
INSERT INTO USERS VALUES('wa2030','wa0819','김상빈','김','상빈','M','19960819','ya2030@naver.com','01012345678','USER');
INSERT INTO USERS VALUES('hong12','123123','김길동','홍','길동','M','20000101','HONG@NAVER.COM','01012345678','USER');
INSERT INTO USERS VALUES('hong34','123123','박길동','홍','길동','M','20000101','HONG@NAVER.COM','01012345678','USER');
/* 권한 테이블 */
create table roles(
role varchar2(20) primary key,
roleName varchar2(30),
description varchar2(50)
);

select * from roles;

insert into roles values('admin','admin','관리자권한');
insert into roles values('user','user','일반권한');


drop table roles;
drop table users;
drop table orders;
/*주문테이블 생성*/
CREATE TABLE orders (
order_id varchar(30) PRIMARY KEY,    
order_date date default sysdate,
user_id varchar(20) not null,
gcode varchar(20) not null,
amount INTEGER,
gname varchar(50),
gtransit varchar(50),
images varchar2(100),
gconfirmQty int ,
gfromDate date,
gtoDate date,
flag int default 0 not null
);

select *from orders;

drop table orders;



/*주문테이블 user_id와 유저테이블 id 외래키설정*/
/*alter table orders add constraint fk_id foreign key (user_id) references users(id);

/*주문테이블 gcode와 상품테이블 gcode 외래키설정  */ 
alter table orders add constraint fk_code foreign key (gcode) references goods(gcode);

/*외래키설정 제거*/
alter table orders drop constraint fk_id;
alter table orders drop constraint fk_code;
*/
select * from orders  where user_id='wa2030';
select * from orders  where user_id=#{user_id}