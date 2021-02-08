use sqlDB;
go


-- 이름이 김경호인사람 조회
select * from userTbl
where userName = '김경호';

-- 1970이후 출생 키 182 이상인 사람 아이디, 이름만 조회 and는 계속 여러조건을 더하면서 찾을 수 있음
SELECT userID,	userName, height
	from userTbl
   where birthYear >= 1970
	and	height >= 182;

-- 1970 이후 출생이거나 키가 182이상이거나 인 사람들 모두
select userID,	userName, height
	from userTbl
   where birthYear >= 1970
	or	height >= 182;

-- 키가 180~183사이인 사람만 조회 (아래와 같은 결과물 나옴)
select userID,	userName, height
	from userTbl
   where height >= 180
	and	height <= 183;
--between ~ and
select userID,	userName, height
	from userTbl
   where height between 180 and 183;

-- 지역이 경남, 전남, 경북
select userID,	userName, addr
	from userTbl
 where addr = '경남'
	or addr = '전남'
	or addr = '경북';

-- 값이 여러개있을 때 쓰는 in
select userID,	userName, addr
	from userTbl
	where addr in ('경남', '전남', '경북') ;

-- like 성뒤에 %들어가면 김으로 시작하는 사람전부
select userID,	userName, addr
	from userTbl
	where userName like '김%';

-- %를 주로 씀 (_는 데이터 성능을 떨어뜨리기 떄문에 잘 안씀)
select userID,	userName, addr
	from userTbl
	where userName like '_종신';

-- SUBQUERY
select userName, height
  from userTbl
 where height > 177; 

-- 서브쿼리안쪽에는 WHERE절에 있는 값만 SUBQUERY에 들어갈 수 있다. + SUBQUERY의 값은 하나이다
 select userName, height
  from userTbl
 where height >
	  ( select height from userTbl where userName = '김경호');

select userName, height
  from userTbl
 where height in
	  ( select height from userTbl where addr = '경남'); --170,173 


-- order by : 정렬
select userName, mDATE
  from userTbl
 order by mDate desc; --desc(내림차순) asc(오름차순)

select *
  from userTbl
 order by userID desc;

-- destinct : 중복을 제거하고 결과를 볼 때
select distinct addr
  from userTbl;
-- top : 상위 n 개만 출력
select top(5) *
  from userTbl
order by mDate desc;

-- offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;

 --select into
 select * into buyTbl2 from buyTbl; -- 복사한 테이블은 pk키 없음(제약조건은 복사x)
 select userID, prodName into buyTbl3 from buyTbl; -- 필요한 것만 복사할 수 있음 but 중복은 오류남 

 -- group by

 select userID, amount
   from buyTbl
  order by userID;

select userID, sum(amount) as '구매합계' -- sum(amount)에 대한 값을 구매합계라고 부른다라고 ''안에 넣어줌(꼭 필요) + sum안에 들어갈 수 있는 값들은 숫자임
   from buyTbl
  group by userID;

--MIN, MAX (집계함수만 쓸 경우에는 group by안해도 상관없음 but 일반값 넣을때는 써야함)
select min(height) as '최소키', max(height) as '큰키'
 from userTbl
group by userID, userName;

select userID, userName
  from userTbl
 where height = (select min(height) from userTbl)
    or height = (select max(height) from userTbl)

-- 총 데이터의 개수
select count(*) as '회원수' from userTbl; --10 (userID 넣어도 되지만 더 편하게 *씀 <<값 몰라도 쓸 수 있음)
select count(*) as '구매내역수' from buyTbl; --12

