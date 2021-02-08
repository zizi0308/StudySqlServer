USE tempdb;
go

create database sqlDB;
go

--DB 생성
use sqlDB;
go
create table userTbl -- 회원테이블
(
	userID	char(8)	not null primary key, -- 사용자아이디
	userName	nvarchar(10) not null, -- 이름
	birthYear	int not null, -- 출생년도
	addr	nchar(2) not null, -- 지역
	mobile1	char(3), -- 휴대폰 국번(010~019)
	mobile2 char(8), -- 휴대폰 나머지 (8자리)
	height	SMALLINT, -- 키
	mDate	DATE -- 회원가입일
);
go
create table buyTbl
(
	num	int identity not null primary key,
	userID	char(8)	not null
	foreign key references userTbl(userID),
	prodName	nvarchar(20) not null,
	groupName	nchar(4),
	price	int not null,
	amount	smallint not null
);
go