drop table goods;

create table goods(
gcode varchar2(20) primary key,
gname varchar2(50) not null,
gcost int not null,
gtype varchar2(20),
gfromDate date,
gtoDate date,
gterm varchar2(20),
gregDate date default sysdate,
gminQty int not null,
gmaxQty int ,
gconfirmQty int,
gdiscount int not null,
gdisRate int ,
gconfirmCost int ,
gtransit varchar2(50),
uploadFile varchar2(100),
gleader varchar2(50),
gcnt int not null,
gscore int,
gcomments varchar2(1000)
);

ALTER TABLE goods rename column updateFile TO uploadFile;
ALTER TABLE goods add gconfirmQty int NOT NULL ;
ALTER TABLE goods add gconfirmCost int NOT NULL ;
ALTER TABLE goods add gscore int ;

drop table goods;
select * from goods;
delete from goods where gname='헬기투어';
select * from board;

SELECT gconfirmQty
  FROM goods 
  WHERE gmaxQty BETWEEN gminQty AND gmaxQty;
update goods set gconfirmQty = '7' where  gcode='T200000003';
  update goods set gconfirmQty='0' where  1=1;

select concat(concat('T',to_char(sysdate,'yy')),trim(to_char(cast(substr(max(gcode),4) as int)+1,'0999999'))) from goods;

select concat(concat('T',to_char(sysdate,'yy')),nvl(trim(to_char(cast(substr(max(gcode),4) as int)+1,'0999999')),'0000001')) from goods;

select to_char(cast(substr(max(gcode),4) as int)+1,'0999999') from goods;

nvl((select max(gcode) from goods),0);

select nvl(gcode,0)+1 from goods;

select max(nvl(gcode,0))+1 from goods;

select sysdate, to_char(sysdate,'yyyy'), to_char(sysdate,'yy'),--년도
		    to_char(sysdate,'mm'), to_char(sysdate,'mon'),--월
				to_char(sysdate,'day'), to_char(sysdate,'dy'), to_char(sysdate,'d'),--요일
				to_char(sysdate,'dd'), --일
				to_char(sysdate,'yyyy-mm-dd day'),
        to_char('1234','99999'),--
        to_char('1234','09999'),--
        to_char('1234','$9999'),--
        to_char('1234','9999,99'),--
        to_char('1234','9999.99')--
	from dual;

drop sequence seq_board;
drop table board;
               
create sequence seq_board;

update goods set gcost='100000' where gtransit='도보/전용버스';
select *from goods;
update goods set gconfirmQty=gconfirmQty+'2' where ;
create table board(
bno number(10,0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate
);
alter table board add constraint pk_board primary key (bno);


select gcode,gname,gcost,gtype,gfromDate,gtoDate,gterm,gminQty,gmaxQty,
		  		 gdiscount,gdisRate,gtransit,gleader,gcnt,gcomments,uploadFile 
  from(
  		  select /*+index_desc(goods pk_goods) */ 
  		     rownum rn, gcode,gname,gcost,gtype,gfromDate,gtoDate,gterm,gminQty,gmaxQty,
		  		 						gdiscount,gdisRate,gtransit,gleader,gcnt,gcomments,uploadFile 
  		  from goods
  			where rownum<=10
  		)
where rn > 0;


insert into goods(gcode,gname,gcost,gtype,gfromDate,gtoDate,gterm,gminQty,gmaxQty,gregDate
 								 ,gdiscount,gdisRate,gtransit,gleader,gcnt,gcomments,uploadFile) 
		 	     values((select concat(concat('T',to_char(sysdate,'yy')),nvl(trim(to_char(cast(substr(max(gcode),4) as int)+1,'0999999')),'0000001')) from goods)
		 	     			 ,'동남아시아일주',560000,'페키지','2020-10-10','2020-10-16','6박7일',20,20,sysdate
		 	     	     ,0,0,'항공/버스','이기자',0,'저렴한 패키지입니다.','1saJR1Z2bXn.jpg');

insert into goods(gcode,gname,gcost,gtype,gfromDate,gtoDate,gterm,gminQty,gmaxQty,gregDate
 								 ,gdiscount,gdisRate,gtransit,gleader,gcnt,gcomments,uploadFile) 
		 	     values((select concat(concat('T',to_char(sysdate,'yy')),nvl(trim(to_char(cast(substr(max(gcode),4) as int)+1,'0999999')),'0000001')) from goods)
		 	     			 ,'하와이투어',560000,'페키지','2020-10-10','2020-10-16','6박7일',1,20,sysdate
		 	     	     ,0,0,'항공/버스','이기자',0,'저렴한 패키지입니다.','hwa2.jpg');

update goods set gscore = 0;		 	     	     
		 	    
select (gscore*5/(select max(nvl(gscore,0)) from goods))+mod((gscore*5/(select max(nvl(gscore,0)) from goods)),10)
		,(select max(nvl(gscore,0)) from goods)
		,gscore
		,ceil(gscore*5/(select max(nvl(gscore,0)) from goods))
		,mod((gscore*5/(select max(nvl(gscore,0)) from goods)),10)
		from goods;

select gcode,gname,gcost,gtype,gfromDate,gtoDate,gterm,gregDate,gminQty,gmaxQty,gconfirmQty
	  ,gdiscount,gdisRate,gconfirmCost,gtransit,gleader,gcnt,gcomments,gscore
	  ,ceil(gscore*5/(select max(nvl(gscore,0)) from goods)) as gscore1
	  ,CASE WHEN gscore>100 THEN 5 ELSE ceil(gscore/20) END as gstar
	  ,uploadFile as images
from goods;

select 98.7654,
		trunc(98.7654),--버림
		trunc(98.7654,2),--소숫점 2자리까지 버림
		trunc(98.7654,-1)--1의자리 버림
	from dual;

select 98.7654,
		ceil(98.7654),--올림
		ceil(98.1000654)--올림
		--ceil(98.7654,2),--소수점2자리까지 올림
		--ceil(98.7654,-1)-- 1의 자리 올림
	from dual;
	
select mod(10,3) from dual;

select '10을2로 나누면 몫이 '||(10/2)||'이고, 나머지가 '||mod(10,2)||'이다' from dual;
		 	     	     
		 	     	     