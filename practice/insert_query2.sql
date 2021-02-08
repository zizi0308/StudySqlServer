--- testTbl insert
use sqlDB
go

select * from testTbl_1;

-- DML 중 INSERT
INSERT INTO testTbl_1 values (1, '홍길동', 25);
INSERT INTO testTbl_1 (id, userName) values (2, '조희지');
-- INSERT INTO testTbl_1 values (3, '홍길동'); << 에러
INSERT INTO testTbl_1 (id, userName) values (3, '홍길동');
INSERT INTO testTbl_1 (age, id) values (30, 4);
INSERT INTO testTbl_1 (userName, age) values ('설현', 23); --에러 PK값이 없음

INSERT INTO testTbl_1 values ('성시경', 44);

exec sp_help 'testTbl_1';

select IDENT_CURRENT('testTbl_1'); -- 현재 어떤 테이블의 가장 최신의 IDENTITY값을 알고 싶을 때

select @@IDENTITY; -- 가장 마지막 IDENTITY값을 알고 싶을 때

select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl; --다른 구역에있는 데이터를 가져올 때

-- sales.order_items 테이블 복사 이거진짜 잘씀 테이블스크립팅-create-새쿼리에 CREATE TABLE라인 복붙
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);

insert into sales_order_items -- 원래있던 테이블에 다른 데이터를 추가해서 만듦
select * from BikeStores.sales.order_items; -- 가져온 데이터를 테이블로 만듦

select * from sales_order_items;

-- update랑 DELETE는 where과 함께 써라 꼭!!
select * from testTbl_1;

update testTbl_1
   set userName = '성수경',
       age = 30
 where id = 6; -- 이거 진짜 중요!!! WHERE절 생략하면 전체 다 바뀜 이러면 !!!!사유서!!!! 씀(insert문은 지우면 삭제됨)

delete from testTbl_1
 where id = 9; -- 이거 진짜 중요!!! WHERE절 생략하면 다 삭제,,,,!!!사유서+감봉!!!