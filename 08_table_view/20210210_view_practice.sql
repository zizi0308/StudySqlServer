use sqlDB;
go

create view uv_userTbl
AS
	select userID, userName, addr from userTbl;
go

select userName from uv_userTbl
 where userID = 'LSG';


create view uv_stdclubTbl
as
	select s.id, s.stdName, c.clubName, c.buildingNum
  from StdTbl as s
 inner join ClubRegTbl as r
    on s.id = r.std_id
 inner join ClubTbl as c
    on r.club_id = c.id;
go
-- 이렇게 해놓으면 밑에 것만 써도 같은 결과값 나옴 
select * from uv_stdclubTbl;

-- create로 만든 애들은 drop으로 지울 수 있음!

-- sp_helpDB = select * from sys.databases