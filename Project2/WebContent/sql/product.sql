/*상품테이블 */
create table product(
p_id varchar(10),
p_name varchar(20),
p_unitPrice int,
p_description text,
p_category varchar(20),
p_manufacturer varchar(20),
p_unitsInStock long,
p_condition varchar(20),
p_fileName varchar(20),
primary key(p_id)
);

select *from product;

select * from product where p_name like '%no%';
update product set p_category='DOG' where p_condition='중고';
/*상품리스트*/
insert into product values('P1000','고양이깃털장난감','15000','고양이깃털장난감','CAT','야옹','100','신규','catToy.jpg');
insert into product values('P1001','고양이사료 4kg 10kg','15000','고양이사료','CAT','야옹','100','신규','catfood.jpg');
insert into product values('P1002','오더락 고양이모래 12kg','15000','고양이모래','CAT','오더락','150','신규','cat1.jpg');
insert into product values('P1003','반려동물 애견 셀프 자동공놀이','80000','댕댕이장난감','DOG','딩동펫','100','중고','dogToy.jpg');
insert into product values('P1004','고양이깃털장난감','15000','강아지사료','DOG','펫클럽','100','신규','dogfood.jpg');