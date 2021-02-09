select * from userTbl;
select * from buyTbl;

select *from userTbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK';

-- INNER JOIN
select * 
  from buyTbl
  inner join userTbl
     on buyTbl.userID = userTbl.userID --PK  다 합친다음에 (WHERE절 없어도 JOIN됨)
     where buyTbl.userID = 'JYP'; --FK (그중 userID가 JYP인것을 찾음)
-- 여기서 문제 아이디 중복 num 필요없음 우리한테 필요한건 userName, addr, amount

select userTbl.userName, userTbl.addr,
       concat(userTbl.mobile1, userTbl.mobile2) as mobile,
	   buyTbl.prodName, buyTbl.price, buyTbl.amount
  from buyTbl
  inner join userTbl
     on buyTbl.userID = userTbl.userID --PK  다 합친다음에 (WHERE절 없어도 JOIN됨)
     where buyTbl.userID = 'JYP';


-- 근데 보기에 모바일에 '-'이 필요한 것 같음
select userTbl.userName, userTbl.addr,
       concat(userTbl.mobile1, '-',left(userTbl.mobile2, 4), '-', right(userTbl.mobile2, 4) ) as mobile,
	   buyTbl.prodName, buyTbl.price, buyTbl.amount
  from buyTbl
  inner join userTbl
     on buyTbl.userID = userTbl.userID --PK  다 합친다음에 (WHERE절 없어도 JOIN됨)
     where buyTbl.userID = 'JYP';

-- 적다보니까 userTbl.mobile2 이거 너무 길다 별명만들자 as 뒤에 별명 u,b
select u.userName, u.addr,
       concat(u.mobile1, '-',left(u.mobile2, 4), '-', right(u.mobile2, 4) ) as mobile, --이것도 mobile이라는 별명붙임
	   b.prodName, b.price, b.amount
  from buyTbl as b
  inner join userTbl as u
     on b.userID = u.userID --PK  여기까지 누가 뭘 샀는지 확인됨
     where b.userID = 'JYP';