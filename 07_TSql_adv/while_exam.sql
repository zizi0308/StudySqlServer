declare @i int, @hap bigint = 0; -- 1~100
set @i = 0; --@i는 null

while (@i <= 100)
begin
	set @hap += @i;
	set @i += 1;
end

print @hap;


declare @i int, @hap bigint = 0; -- 1~100
set @i = 1; --@i는 null값이므로 지정해줌

while (@i <= 100)
begin
	if(@i % 10 = 0) -- 10의 배수
	begin
		print concat('10의 배수, ', @i);
		set @i += 1;
		continue;
    end

	set @hap += @i;
	if (@hap > 1000) break;
	set @i += 1;
end

print @hap;