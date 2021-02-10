use schemaDB;
go

-- 편리성을 위한 스키마( DB 리딩을 수월하게 도와줌)

create table users.userTbl (id int not null);
go
create table sales.buyTbl (id int not null);
go
create table sales.prodTbl (pid int);
go

create table normalTbl (nid int not null);
go


select * from users.userTbl;
select * from sales.buyTbl;
select * from dbo.normalTbl;