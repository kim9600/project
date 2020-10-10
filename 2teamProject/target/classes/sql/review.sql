drop table review;

drop sequence seq_review;

/* 테이블 생성 */
 create table review(
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate,
  updatedate date default sysdate,
  uploadFile varchar2(100)
  );

select * from review;

/* primary key 제약조건 추가*/
alter table  review add constraint pk_review primary key(bno);

/* sequence  생성*/
create sequence seq_review;

insert into review
select seq_review.nextval, title,content,writer,regdate,updatedate,uploadFile
  from review;
  
insert into review values('1','하와이 여행 너무 좋아요!!','또 가고싶은 여행이었어요.','홍길동',sysdate,sysdate,'hwa2.jpg');
insert into review values('2','싸고 저렴하게 잘다녀왔어요!!','코로나가 끝나면 또 가고싶네요.','홍길동',sysdate,sysdate,'hwa8.jpg'); 

///cut
select bno,title,content,writer,regdate,updateDate,uploadFile as images
from
   (
      select /*+index_desc(review pk_review) */ 
            rownum rn, bno,title,content,writer,regdate,updateDate,uploadFile
      from review
        where
      rownum<=10
   )
   where rn > 0