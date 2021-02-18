use bookrentalshop;
go
/*
select lower(Email) as 'email'
	 , Mobile as 'mobile'
	 , Names as 'name'
	 , Addr as 'addr'
  from membertbl
 order by name desc;


select Names as 'names'
	 , Author as 'author'
	 , ReleaseDate as 'releaseDate'
	 , Price as 'price'
  from bookstbl;
*/


/*
select 
       concat(right(Names, 2), ', ', left(Names, 1)) as '변경이름'
     , Levels as 'levels'     
	 , left(Addr, 2) as '도시'
     , lower(Email) as '이메일'
  from membertbl


select Idx
	 , concat(N'제목 : ', Names) as 'Names'
	 , concat(N'저자 > ', Author) as 'Author'
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일'
	 , ISBN
	 , format(Price, '#,#원') as '가격'
  from bookstbl
 order by Idx desc;
*/


/*
select b.Idx as '번호'
     , b.Division as '장르번호'
	 , d.Names as '장르'
     , b.Names as '책제목'
	 , b.Author as '저자'
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division 
   and b.Division = 'B002';

select m.Names
     , m.Levels
     , m.Addr
	 , r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
  on m.Idx = r.memberIdx
 where r.rentalDate is null;
*/


/*
select * from divtbl

begin tran;

insert into divtbl values ('I002', '자기개발서')

rollback;
commit;

select * from membertbl;

begin tran;

update membertbl
   set Addr = '부산시 해운대구', Mobile = '010-6683-7732'
 where Idx = 26

rollback;
commit;
*/


/*
select Division as 'names', sum(Price) as '총합계금액' from bookstbl
 group by rollup(Division)
*/