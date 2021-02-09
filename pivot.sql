use sqlDB;
go

select row_number() over(order by height desc, userName asc) as '키큰순위', userName, addr, height 
  from userTbl;  -- 마우스 올렸을때 함수나오면 기본제공함수(이름 만들어줘야함)

-- 같은 순위가 겹칠때
select dense_rank() over(order by height desc) as '키큰순위', userName, addr, height 
  from userTbl;
select rank() over(order by height desc) as '키큰순위', userName, addr, height 
  from userTbl;

  select rank() over(partition by addr order by height desc) as '키큰순위', userName, addr, height 
  from userTbl; -- order by 지정된 컬럼을 기준으로 partition by 

 -- PIVOT
 /*
 create table pivotTbl
 (
	userName nvarchar(10),
	season nvarchar(2),
	amount int
 );

 insert into pivotTbl values ('김범수', '겨울',10),
						     ('윤종신', '여름',15),
							 ('김범수', '가을',25),
							 ('김범수', '봄',3),
							 ('김범수', '봄',37),
							 ('윤종신', '겨울',40),
							 ('김범수', '여름',14),
							 ('김범수', '겨울',22),
							 ('윤종신', '여름',64);
 go
 */
 insert into pivotTbl values ('성시경','여름',30);
 
 select * from pivotTbl;

 select * from pivotTbl
  pivot (sum(amount)
         for season
		 in ([봄], [여름], [가을], [겨울])) as resultPivot; --세로로 나온 데이터를 통계를 내면서 가로로 만들어줌 + 월별로도 만들어보기

-- JSON : []는 배열을 {}는 속성과 값을 나타냄
select userName, height, addr
  from userTbl
   for json auto;


-- varchar(2) => '겨울' / '겨'   nvarchar(2) => '겨울' / '겨울'