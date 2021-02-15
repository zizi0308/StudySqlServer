﻿use sqlDB;
go

create or alter procedure plusNew
	@p1 int, -- 입력 파라미터
	@p2 int, -- 입력 파라미텨
	@pout int output -- 출력(리턴) 파라미터
as
	select @pout = @p1 + @p2;

go

-- 아래와 위가 같다 output이 출력역할을 한다  프린트와 같은 역할
declare @newResult int;
set @newResult = 0;
exec plusNew 3, 4, @newResult output;
print concat('PlusNew(3, 4) = ', @newResult);