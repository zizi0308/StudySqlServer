use sqlDB;
go

select b.userID, 
       u.userName,
	   sum(price * amount) as '총 구매금액'
  from buyTbl as b
 inner join userTbl as u
    on b.userID = u.userID
 group by b.userID, u.userName
 order by sum(price * amount) desc;


select * 
  from userTbl;

select b.userID, 
       u.userName,
	   sum(price * amount) as '총 구매금액'
  from buyTbl as b
 left outer join userTbl as u -- 기준이 buyTbl임 userID 자체에 이승기 등등이 없기 때문에 변하지 않는다. 
    on b.userID = u.userID
 group by b.userID, u.userName
 order by sum(price * amount) desc;

select b.userID, 
       u.userName,
	   sum(price * amount) as '총 구매금액'
  from buyTbl as b
 right outer join userTbl as u -- userTbl 자체에 성시경~조관우까지 있기때문에 가져와야 하는 buyTbl과 join해 빈공간에 null이 생기게 된다
    on b.userID = u.userID
 group by b.userID, u.userName
 order by sum(price * amount) desc;

-- b.userID를 u.userID로 바꿈 확실하게 이해되는 방법
 select u.userID, 
       u.userName,
	   sum(price * amount) as '총 구매금액'
  from buyTbl as b
 right outer join userTbl as u
    on b.userID = u.userID
 group by u.userID, u.userName
 order by sum(price * amount) desc;

 -- null값을 0으로 바꿔줌
 select u.userID, 
       u.userName,
	   iif(sum(price * amount) is null, 0, sum(price * amount)) as '총 구매금액'
  from buyTbl as b
 right outer join userTbl as u
    on b.userID = u.userID
 group by u.userID, u.userName
 order by sum(price * amount) desc;

select u.userID, 
       u.userName,
	   iif(sum(price * amount) is null, 0, sum(price * amount)) as '총 구매금액',
	   case -- select 사이에도 case를 넣을 수 있음
	    when (sum(price * amount) >= 1500) then 'VVIP'
		when (sum(price * amount) >= 1000) then 'VIP'
		when (sum(price * amount) >= 1) then 'Person'
		else 'Ghost'
	   end as '고객레벨'
  from buyTbl as b
 right outer join userTbl as u
    on b.userID = u.userID
 group by u.userID, u.userName
 order by sum(price * amount) desc;