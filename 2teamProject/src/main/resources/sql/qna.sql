drop table qna;
drop table qna_reply;

drop sequence seq_qna;
drop sequence seq_qna_reply;
drop sequence seq_reply;

/* 테이블 생성 */
 create table qna(
  qno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate,
  updatedate date default sysdate
  );

select * from qna;

/* primary key 제약조건 추가*/
 alter table  qna add constraint pk_qna primary key(qno);

/* sequence  생성*/
create sequence seq_qna;

insert  into qna(qno, title, content, writer)
select seq_qna.nextval, title||seq_qna.currval,content||seq_qna.currval,writer
from qna;
    
  create table qna_reply(
    rno number(10,0),
    qno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);
select * from qna_reply where qno=1;

create sequence seq_reply;

alter table qna_reply add constraint pk_reply primary key (rno);
//여기까지
insert into qna values('1','문의사항 게시판입니다.','전화상담 가능합니다!','관리자',sysdate,sysdate);
insert into qna values('2','궁금합니다!!','상품 예약이 가능한가요?','홍길동',sysdate,sysdate);
insert into qna values('3','예약문의드립니다','현재 패키지 상품이 예약가능하나요','홍길동',sysdate,sysdate);

/* 외래키 설정(tbl_board 테이블 참조)*/
/*alter table qna add constraint fk_reply_qna
foreign key (qno) references qna (qno);*/

commit;

/* tbl_board에 댓글 갯수 저장 칼럼 추가 */
alter table qna add(replycnt number default 0);

update qna set replycnt =(select count(rno) from qna_reply where qna_reply.qno=qna.qno);
commit
select * from qna_reply;


select *from qna_reply order by rno;
select *from qna order by qno;

select *from user_sequences;

