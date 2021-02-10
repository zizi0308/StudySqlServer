/*
use sqlDB;
go
*/

-- create table testTbl (num int); 테이블 생성
-- drop table testTbl; 테이블 삭제

use tempdb;
go
/*
drop database tableDB;
go
create database tableDB;
*/
 --한번 실행하면 주석 꼭처리

use tableDB;
go
create table userTbl
(
	userID		char(8),		-- 아이디
	userName	nvarchar(10),	-- 이름
	birthYear	int,			-- 출생년도
	addr		nchar(2),		-- 지역
	mobile1		char(3),		-- 휴대폰국번
	mobile2		char(8),		-- 휴대폰번호
	height		smallint,		-- 키
	mDate		date			-- 회원가입일

);
go
create table buyTbl
(
);
go