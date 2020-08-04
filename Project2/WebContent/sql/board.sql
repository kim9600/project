/*board테이블 생성*/
create table board(
num int not null auto_increment,
id varchar(20) not null,
name varchar(20) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit int,
ip varchar(30),
primary key(num)
)default charset=utf8;

/*테이블 내용조회*/
select * from board;
/*테이블 구조 확인*/
desc board;
/*테이블 삭제*/
delete table board;
delete from board where id='im';
select * from board where subject like '%길동%';
select count(*) from board where content like '%길동%';
update board set subject ='환불 문의합니다' where subject='제목4';

select count(*) from board;
/*데이타 입력*/



insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','회원가입 문의합니다','가입이 안됩니다','20200729', 0, '127.0.0.1');

insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','회원가입 문의합니다','가입이 안되요','20200729', 0, '127.0.0.1');

insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','상품 문의합니다','고양이 깃털장난감 사고싶어요','20200729', 0, '127.0.0.1');

insert into board(id,name,subject,content,regist_day,hit,ip) 
values('hong','홍길동','환불 문의합니다','환불요청!!','20200729', 0, '127.0.0.1');

insert into board(id,name,subject,content,regist_day,hit,ip) 
values('illjimae','일지매','환불 문의합니다','환불요청!!','20200729', 0, '127.0.0.1');

insert into board(id,name,subject,content,regist_day,hit,ip) 
values('illjimae','일지매','회원가입 문의합니다','가입이안되요!','20200729', 0, '127.0.0.1');



select *from member;
delete from member where name ='임꺽정';
insert into member 
 (select 'hong','1234','홍길동',gender,birth,mail,phone,
        postcode,address,detailAddress,extraAddress,regist_day 
 from member where id='hwang');
 
insert into board(id,name,subject,content,regist_day,hit,ip) 
select id,name,subject,content,regist_day,hit,ip from board;
