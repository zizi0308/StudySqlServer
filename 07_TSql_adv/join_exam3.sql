/* 
select * from StdTbl;
select * from ClubTbl;
select * from ClubRegTbl;
*/

--(Standard SQL) 일치하는 값만 보여주는 inner join >> 교집합
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



--조건에 일치하지 않는 값도 보여주는 outer join(외부조인) >> 합집합
select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 left outer join ClubRegTbl as r
    on s.id = r.std_id
 left outer join ClubTbl as c
    on r.club_id = c.id;

-- userTbl / buyTbl 구매하지 않은 사람들도 나옴
select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  left outer join buyTbl as b -- userTbl 기준 (join 왼쪽기준) userTbl안에 있는 모든 열 + buyTbl에 있는 공통부분을 얻게됨
    on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
  from userTbl as u
  right outer join buyTbl as b -- buyTbl 기준 (join 오른쪽 기준) >> buyTbl안에 있는 모든 열 + userTbl에 있는 공통부분을 얻게됨
    on u.userID = b.userID;
 -- 공통부분은 똑같이 출력되지만 기준 밖에 있는 것들은 NULL로 입력된다.

select *
  from buyTbl
