select u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
	from userTbl as u
   inner join buyTbl as b
	  on u.userID = b.userID
   where height > 170
     for json auto;  -- for xml auto; 두가지 다 데이터 전송을 위한 형식이다