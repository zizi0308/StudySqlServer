/*
use sqlDB;
go
*/

-- create table testTbl (num int); 테이블 생성
-- drop table testTbl; 테이블 삭제

/*use tempdb;
go*/
/*
drop database tableDB;
go
create database tableDB;
*/
 --한번 실행하면 주석 꼭처리


use tableDB;
go

drop table buyTbl;
drop table userTbl;

go
create table userTbl
(
	userID		char(8)			NOT NULL primary key,	-- 아이디
	userName	nvarchar(10)	NOT NULL,	-- 이름
	birthYear	int				NOT NULL default year(getdate()),	-- 출생년도
	addr		nchar(2)		NOT NULL default '서울',   -- 지역
	mobile1		char(3)			NULL,		-- 휴대폰국번
	mobile2		char(8)			NULL,		-- 휴대폰번호
	height		smallint		NULL default '180',		-- 키
	email		varchar(150)	NOT NULL	unique, -- d
	mDate		date			NULL		-- 회원가입일 (밑에 추가할때 ,꼭 추가)
);
go
create table buyTbl
(
	num			int				NOT NULL identity(1, 1) primary key,
	userID		char(8)			NOT NULL
		foreign key references userTbl(userID),
	prodName	nchar(6)		NOT NULL,
	groupName	nchar(4)		NULL,
	price		int				NOT NULL,
	amount		smallint		NOT NULL
);
go

select * from userTbl;