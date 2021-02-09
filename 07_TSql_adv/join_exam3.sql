/* 
select * from StdTbl;
select * from ClubTbl;
select * from ClubRegTbl;
*/

--(Standard SQL) 일치하는 값만 보여주는 inner join
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 inner join ClubRegTbl as r
    on s.id = r.std_id
 inner join ClubTbl as c
    on r.club_id = c.id; -- 이름과 동아리이름은 겹칠 수 있으니까 PK인 ID로 join을 해야한다

-- 어떻게해도 잘만 맞추면 결과가 동일하다 (Standard SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from ClubTbl as c
 inner join ClubRegTbl as r
    on r.club_id = c.id
 inner join stdTbl as s
    on s.id = r.std_id;

-- inner join 약식 (실무에서는 이걸활용) (SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s, ClubRegTbl as r, ClubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;



--조건에 일치하지 않는 값도 보여주는 outer join(외부조인)
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 left outer join ClubRegTbl as r
    on s.id = r.std_id
 left outer join ClubTbl as c
    on r.club_id = c.id;

-- userTbl / buyTbl 구매하지 않은 사람들도 나옴
select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  left outer join buyTbl as b -- userTbl 기준 (join 왼쪽기준)
    on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  right outer join buyTbl as b -- buyTbl 기준 (join 오른쪽 기준) >> 구매한 사람만 기준을 잡아서 데이터가 충분하지않음
    on u.userID = b.userID;
-- 공통부분에는 값이 입력 아닌부분에는 null이 나옴
select userName, addr
  from userTbl;

select prodName, price
  from buyTbl;
