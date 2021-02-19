-- 1-1
select lower(m.Email) as 'Email', m.Mobile, m.Names, m.Addr 
  from membertbl as m
 order by m.Names desc;

-- 1-2
select b.Names, b.Author, b.ReleaseDate, b.Price
  from bookstbl as b;

-- 2-1
select top(10) 
	   concat(right(m.Names, 2), ', ', left(Names, 1)) as '변경이름', 
	   m.Levels,
	   left(m.addr, 2) as '도시',
	   lower(m.Email) as 'Email'
  from membertbl as m;

-- 2-2
select b.Idx, 
	   concat('제목 : ', b.Names) as Names, 
	   concat('', b.Author) as Author, 
	   format(b.ReleaseDate, 'yyyy년 MM월 dd일') as '출판일',
	   b.ISBN, 
	   format(b.Price, '#,#원') as '가격'
  from bookstbl as b
 order by b.idx desc;

-- 3-1
select b.Idx as '번호'
     , b.Division as '장르번호'
	 , d.Names as '장르'
     , b.Names as '책제목'
	 , b.Author as '저자'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division 
 where b.Division = 'B002';

-- 3-1 문제를 다르게 푸는 방법1
select b.Idx 번호
     , b.Division 장르번호
	 , d.Names 장르
     , b.Names 책제목
	 , b.Author 저자
  from bookstbl  b
     , divtbl  d
 where b.Division = d.Division 
   and b.Division = 'B002';

-- 3-1 문제를 다르게 푸는 방법2
select b.Idx as '번호'
     , b.Division as '장르번호'
	 --, d.Names as '장르'
	 , (select Names from divtbl where Division = b.Division) as '장르'
     , b.Names as '책제목'
	 , b.Author as '저자'
  from bookstbl as b
 where b.Division = 'B002';

-- 3-2
select m.Names, m.Levels, m.Addr, 
       r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
    on m.Idx = r.memberIdx
 where r.rentalDate is null;

-- 3-2 다르게 풀기
select m.Names
     , m.Levels
	 , m.Addr
	 , null as rentalDate
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r);

-- 4-1
insert into divtbl values ('I002', '자기개발서')

-- 4-2
update membertbl
   set Addr = '부산시 해운대구', Mobile = '010-6683-7732'
 where Idx = 26

-- 5
select d.Names, sum(b.Price) as '총합계금액' 
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division 
 group by rollup(d.Names);


-- 5
select (select names from divtbl where Division = a.Division) as names
	    , a.sum_price as '총합계금액'
  from
     (select b.Division, sum(b.Price) as sum_price 
		from bookstbl as b
	   group by Division) as a
union all
select null, sum(price)
  from bookstbl
