-- 실제 회원정보 불러오기
use BookRentalShopDB;
go

select memberID, memberName, levels, mobile, email
  from MemberTbl
 where levels <> 'S' -- 아니다 라는 뜻을 <>로 씀
 order by levels, memberName; -- 이름 순/ 알파벳 순으로 정리 내림차순은 desc

-- 책정보
select cateidx, bookName, author, 
       interpreter, company, price
  from BooksTbl
 order by price desc; -- 가격 비싼 순으로 정렬

-- 카테고리
select * from CateTbl;

-- formating을 통해 사용자가 원하는대로 요구사항을 수렴함 (시스템 함수사용 쿼리)
select memberID, memberName, levels, mobile, email
  from MemberTbl
 where levels <> 'S' -- 아니다 라는 뜻을 <>로 씀
 order by levels, memberName; -- 이름 순/ 알파벳 순으로 정리 내림차순은 desc

-- 책정보
select cateidx, bookName, author, 
       interpreter, company, price
  from BooksTbl
 order by price desc; -- 가격 비싼 순으로 정렬

-- 카테고리
select * from CateTbl;

-- formating을 통해 사용자가 원하는대로 요구사항을 수렴함 (시스템 함수사용 쿼리)
select memberID, 
       concat(right(memberName, 2), ' ,', left(memberName, 1)) as '미국식이름', 
	   case levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
	   end as '회원레벨', 
	   mobile, 
	   upper(email) as '이메일' -- 대문자로 변환
  from MemberTbl
 where levels <> 'S'
 order by levels, memberName; 

-- 사용자 정의 함수사용 쿼리
select memberID, 
       concat(right(memberName, 2), ' ,', left(memberName, 1)) as '미국식이름', 
	   dbo.ufn_getLevel(levels) as '회원레벨',-- 이걸 사용자 정의로 바꿔준거임
	   mobile, 
	   upper(email) as '이메일' -- 대문자로 변환
  from MemberTbl
 where levels <> 'S'
 order by levels, memberName;

-- 책 정보, 시스템 함수, 포멧 함수 쿼리 / ctrl + h 꺽쇠 없앨 수 있음  / shift + delete 한줄 삭제 / format을 많이 활용하기
SELECT bookidx
     , cateidx
     , concat(N'책제목 > ', bookName) as bookName
     , author
     , isnull(interpreter, '(역자없음)') as '번역가'
     , company
     , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
     , format(price, '#,#.0원') as '가격' -- #,#00은 소수점 2자리
  FROM BooksTbl

  -- 책정보 조인
SELECT b.bookidx
      --,b.cateidx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM dbo.BooksTbl as b
 inner join CateTbl as c
    on b.cateidx = c.cateidx;

-- 대여된 책의 정보 보는 쿼리 조인
SELECT r.rentalIdx
      --,r.memberIdx (인덱스는 숫자라 정보식별이 어려우므로)
      -- ,r.bookIdx
	  ,m.memberName -- 새로추가
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,format(r.returnDt, 'yyyy-MM-dd') as '반납일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTbl as r
 inner join BooksTbl as b
	on r.bookIdx = b.bookidx
 inner join MemberTbl as m
	on r.memberIdx = m.memberidx;

-- outer join >> 테이블 내에서 특정(빌린)행위를 안한것들을 찾는 것!!! 회원을 기준으로 해야 안빌린 사람을 찾음(기준이 되는 속성을 선별)
SELECT r.rentalIdx
      --,r.memberIdx (인덱스는 숫자라 정보식별이 어려우므로)
      -- ,r.bookIdx
	  ,m.memberName -- 새로추가
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTbl as r
 left outer join BooksTbl as b -- 사실 얘는 기준이 아님 렌탈은 안한 행동이 아님
	on r.bookIdx = b.bookidx
 right outer join MemberTbl as m -- left랑 right바꿔가면서 결과 확인하고 맞는거 쓰면됨
	on r.memberIdx = m.memberidx
 where r.rentalIdx is null;

 -- 우리 책 대여점에 없는 소설장르를 보는 방법
 select c.cateIdx
	  , c.cateName
	  , b.bookName
   from CateTbl as c
   left outer join BooksTbl as b
     on c.cateidx = b.cateidx 
