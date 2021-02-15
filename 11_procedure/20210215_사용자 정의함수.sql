-- 사용자 정의함수를 사용 안한 것
select *,
	  (year(getdate()) - birthYear) + 1 as 나이
	from userTbl;

-- 사용자 정의함수를 사용
select *,
	dbo.ufn_getAge(birthYear) as 나이,
	dbo.ufn_getZodiac(birthYear) as 띠
   from userTbl;