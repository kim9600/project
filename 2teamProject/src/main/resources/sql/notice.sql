drop table notice;
drop table notice_reply;
drop sequence seq_notice;
drop sequence seq_reply2;

/* 테이블 생성 */
 create table notice(
  nno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate,
  updatedate date default sysdate
  );

select * from notice;

/* primary key 제약조건 추가*/
 alter table  notice add constraint pk_notice primary key(nno);
 
/* sequence  생성*/
create sequence seq_notice;

insert into notice(nno, title, content, writer)
select seq_notice.nextval,title||seq_notice.currval,content||seq_notice.currval,writer
  from notice;
  
  create table notice_reply(
    rno number(10,0),
    nno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply2;

alter table notice_reply add constraint pk_reply2 primary key (rno);

select *from notice_reply order by rno;
select *from notice order by nno;

select * from notice_reply;

insert into notice values('1','[공지]공지사항!','공지사항입니다!','관리자',sysdate,sysdate);
insert into notice values('2','[공지]알로하오예','여행 상담 일정은 전화주세요!','관리자',sysdate,sysdate);
