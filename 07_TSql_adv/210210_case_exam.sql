declare @point int, @credit char;
set @point = 99; -- 99점

set @credit =
  case
	when (@point >= 90) then 'A'
	when (@point >= 80) then 'B'
	when (@point >= 70) then 'C'
	when (@point >= 60) then 'D'
	else 'F'
  end 

print concat(N'취득점수 ==> ', @point); -- concat함수가 편함 그냥 ,만 써서 붙여버리면 됨
print concat(N'학점 ==> ', @credit); --N은 유니코드표현