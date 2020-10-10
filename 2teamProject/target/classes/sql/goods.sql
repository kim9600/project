
/* 시연용 자료 입력 */

drop table goods;

create table goods(
gcode varchar2(20) primary key,
gname varchar2(100) not null,
gcost int not null,
gtype varchar2(50),
gfromDate date,
gtoDate date,
gterm varchar2(50),
gregDate date default sysdate,
gminQty int not null,
gmaxQty int not null,
gconfirmQty int not null,
gdiscount int not null,
gdisRate int not null,
gconfirmCost int not null,
gtransit varchar2(100),
uploadFile varchar2(100),
gleader varchar2(100),
gcnt int not null,
gscore int,
gcomments varchar2(1000)
);


insert into goods values('T200000001','하와이',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',1,20,0,0,0,1000000,'항공편/고속열차','hwa1.jpg','이미자',3,5,'하와이 여행 패키지 입니다.');
insert into goods values('T200000002','하와이1 패키지',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',1,20,0,0,0,1000000,'항공편/고속열자/도보','hwa2.jpg','홍길동',1,5,'여행하기 좋은 상품입니다.');
insert into goods values('T200000003','하와이2 패키지',1000000,'패키지 상품','20/10/01','20/10/07','6박7일','20/09/24',1,20,0,0,0,1000000,'항공편/고속열자','hwa3.jpg','강아지',3,5,'패키지상품입니다.');
insert into goods values('T200000004','하와이3 여행',1000000,'패키지 상품','20/10/01','20/10/07','6박7일','20/09/24',1,1,0,0,0,100000,'항공/도보','hwa4.jpg','강아지',0,5,'상쾌한 가을 좋은 패키지 상품');
insert into goods values('T200000005','하와이4 여행',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',1,20,0,0,0,1000000,'항공편/고속열자/도보','hwa5.jpg','강부장',0,5,'패키지상품입니다.');
insert into goods values('T200000006','하와이5 여행',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',2,20,0,0,0,1000000,'항공편/고속열자/도보','hwa6.jpg','강부장',1,5,'패키지');
insert into goods values('T200000007','하와이6',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',20,20,0,0,0,1000000,'항공편/고속열자/도보','hwa7.jpg','홍길동',0,5,'좋은상품');
insert into goods values('T200000008','하와이7',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',1,10,0,0,0,1000000,'항공/도보','hwa8.jpg','이미자',0,5,'패키지');
insert into goods values('T200000009','하와이8',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',2,20,0,0,0,1000000,'항공/도보','hwa9.jpg','강부장',0,5,'도보');
insert into goods values('T200000010','하와이9',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/24',2,20,0,0,0,1000000,'항공/도보','hwa10.jpg','강부장',0,5,'항공편제공');
insert into goods values('T200000011','하와이10',1000000,'패키지 상품','20/10/01','20/10/30','30박31일','20/09/24',4,50,0,0,0,1000000,'항공/도보','hwa11.jpg','이미자',0,5,'순례자의길');
insert into goods values('T200000012','하와이11',1000000,'패키지 상품','20/10/01','20/10/20','20박21일','20/09/25',2,20,0,0,0,1000000,'항공편/고속열자','hwa12.jpg','홍길동',0,0,'자료입력');
insert into goods values('T200000013','하와이12',1000000,'패키지 상품','20/10/10','20/10/25','15박16일','20/09/25',3,35,0,0,0,1000000,'항공편/고속열자','hwa13.jpg','강부장',1,0,'즐거운여행되삼');
commit;

select * from goods;
update goods set gconfirmQty=0 where gcode='T200000006';
update orders set uploadFile = (select uploadFile from goods g where g.gcode = orders.gcode)  where order_id = 'V200001';

select *from orders;

select order_id from orders where orders.gcode = goods.gcode;