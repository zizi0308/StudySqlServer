﻿create view uv_user177
as
	select * from userTbl where height >= 177;
go

create view uv_buyTbl
as
	select num, prodName, groupName from buyTbl where groupName= '전자';
go

select * from uv_buyTbl;

insert into uv_buyTbl values ('KKH', '기타', '악기', 4000, 1);

begin tran; --트랜잭션

delete from uv_buyTbl;

rollback; -- 원상태복귀