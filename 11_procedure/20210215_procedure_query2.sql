use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)
as
	declare @birthYear int; -- 출생년도 저장변수 프로시저 안에서 쓰기위한 변수선언
	select @birthYear = birthYear --userTbl에서 가져온 변수에서 쓰니까
	  from userTbl
	 where userName = @userName;

	 if (@birthYear >= 1980)
	 begin
		print '아직 젊군요...'
	 end
	 else
	 begin
		print '나이가 지긋...'
	 end
go

exec usp_ifelse '이승기';