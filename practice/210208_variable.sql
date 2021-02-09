use sqlDB;
go

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


use sqlDB;
go

declare @myVal1 int;
declare @maVal2 smallint, @myVal3 decimal(10,6); -- 소수점을 알려줌 전체사이즈가 10인데 그중 소수점이 6자리이다.
declare @myVar4 char(20);

set @myVal1 = 154234512;
set @maVal2 = 32000;
set @myVal3 = 3.14;
set @myVar4 = '가수이름==>     ';


select @myVal1;
-- select '100' + @myVal3; -- 에러남
select '값은' + cast(@myVal3 as varchar); -- 이렇게 해야함
select @myVar4, userName from userTbl;

declare @myVal5 tinyint; --255
set @myVal5 = 3;

select top(@myVal5) userName, height from userTbl order by height desc; --@뒤에 변수명은 마음대로 지정가능 (@@는 시스템변수)

select @@VERSION


-- 형 변환함수
select convert(float, amount) as amount from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl; -- 값이 잘못나왔을 때 오류대신 null값으로 대체
select avg(convert(float, amount)) as '평균구매개수' from buyTbl; 
--avg : 평균 amount는 int이기 때문에 정수만 출력 하지만 우리는 소수점까지 알고 싶기때문에 convert로 float or decimal을 넣어 변환

select price, amount, price/amount as [단가/수량] from buyTbl; -- sql서버에서만 꺽쇠를 하면 문자열로 인식함 잘 쓰진 말길,,,

--
-- '1000' --> 숫자
select PARSE ('2021년 2월 9일' as date); -- 문자열이 아닌 date로 바뀜 년/월/일/숫자 제대로 적어야 함
select try_PARSE ('2021년 2월 39일' as date); -- 값이 잘못나왔을 때 오류대신 null값으로 대체

select PARSE('124.45' as int); -- 오류
select try_PARSE('124.45' as int);

select PARSE('124.45' as decimal(5,2));
select TRY_PARSE('124.45' as float);

-- select '값은' + cast(@myVal3 as varchar); -- 이렇게 해야함 // 35번줄


-- 스칼라함수 (단일 리턴함수)
select GETDATE() as '현재날짜'; -- 구매나 글을 올릴때 바로 현재시분초

select year(GETDATE()) as '금년';
select month(GETDATE()) as '이번달';
select day(GETDATE()) as '오늘일'; --날짜 지정할때 코딩전에 확인하고 쓰기

select abs(-100);

select ROUND(3.1415, 3);
select ROUND(1236.5678, -1);

select cast((rand() * 100) as int);

select IIF(20 > 10, '참', '거짓'); -- 이거 활용도 높음!!! 짧게 처리가능

-- 문자열 함수
select ASCII('a'), ASCII('A');
select char(98), char(66);
select UNICODE('나');
select nchar(45909);


---진짜 많이 쓰이는 문자열 함수
select CONCAT('SQL ', 'SEVER ', 2019); -- 문자열결합함수 숫자랑 문자 다 합쳐도 간단히 쓸 수 있음(CONVERT로 할 필요없음)
-- 문자열 시작위치 리텬
select CHARINDEX('Server ', 'SQL SERVER 2019'); --1부터 시작함
-- LEFT, RIGHT
select left('SQL SERVER 2019', 3), right('SQL SERVER 2019', 4);
-- 제일 많이 쓰는 함수 모든 언어에 있는 글자, 문자열을 다루는 함수
select substring('Hello World!', 7, 5);
select substring('안녕하세요, sql서버입니다!', 11, 2); --1부터 시작함 DB만 1부터 시작

select len('안녕하세요'), len('Hello World');
select len('안녕하세요'), len('Hello World     '); --len에서 뒤쪽공백은 길이를 알아서 잘라줌

select lower('abcdeFG'), upper('abcdeFG'); -- UPPER를 더 많이 씀

select len(ltrim('  Hello World!  ')), 
       len(rtrim('  Hello World!  ')),
	    len(trim('  Hello World!  '));

select replace('(2016년 발표) SQL Server 2016', '2016', '2019');

--날짜를 원하는 형태로 바꿔쓰는것 진짜진짜진짜 많이 씀
select format(getdate(), ''); -- 기본 /오전오후 글자들어감
select format(getdate(), 'dd/MM/yyyy');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss:ms'); -- 한국사람들이 많이 쓰는 데이터포맷
select format(getdate(), 'yyyy-MM-dd');
select format(getdate(), 'hh:mm:ss');


use sqlDB;
go

select * from buyTbl;

select avg(amount) as '평균구매개수' from buyTbl;

select price, amount, price * amount '총합계' from buyTbl;

select avg(convert(float, amount)) as '평균구매개수' from buyTbl; 
select avg(cast (amount as float)) as '평균구매개수' from buyTbl;

select try_parse('2021년 2월 39일' as date);
select cast('11' as int);

select getdate() as '현재날짜';

select year(getdate()) as '금년';

declare @zizi char(3);
set @zizi = '100';
select @zizi + '200'; --100200
select @zizi + 200; --300
select @zizi + 200.0 -- 300.0

declare @zizi char(3);
set @zizi = '100';
select cast(@zizi as decimal(5, 1))

-- 순번을 모르면 코딩시간이 길어진다(순위함수 꼭 숙지)

