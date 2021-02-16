use sqlDB;
go

declare  cur_userTbl cursor global -- global 대신 local로 바꿔 써도 가능 후자가 더 좁은 범위
	for select userName height from userTbl;

open cur_userTbl;

declare @userName nchar(8); -- 회원이름
declare @height smallint; -- 회원의 키담는 변수
declare @cnt int = 0; -- 회원수(읽은 행수)
declare @totalHeight int = 0; -- 회원 키의 합계 변수

fetch next from cur_userTbl into @userName, @height; -- 커서 값 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0  -- fetch 상태가 0일때까지 계속 돈다
begin
	set @cnt += 1; -- 숫자가 1씩 증가
	set @totalHeight += @height;
	print concat('회원 : ', @userName, '키 : ', @height);
	fetch next from cur_userTbl into @userName, @height;
end

print @totalHeight;
print @cnt;
print concat('회원 키 평균 => ', @totalHeight / @cnt);

close cur_userTbl
deallocate cur_userTbl;

-- 사실 select sum(height) / count(height) as '회원 키 평균' from userTbl; 로 끝남