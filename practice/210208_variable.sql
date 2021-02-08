use sqlDB;

declare @myVar1 int;
declare @myVar2 smallint, @myVal3 decimal(5, 2);
declare @myVar4 char(20);

set @myVar1 = 154234512;
set @myVar2 = 32000;
set @myVal3 = 3.14;
set @myVar4 = '가수이름==>     ';

select @myVar1;
select @myVar2 + @myVal3;
select @myVar4, userName from userTbl where height > 180; -- @myVar4가 table 값이 아니지만 혼용가능

--테이블 이름을 모를 때 ==> select * from testTbl_1(테이블이름); 부터 시작
