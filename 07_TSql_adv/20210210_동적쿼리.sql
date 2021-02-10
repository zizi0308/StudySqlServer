use sqlDB;
go
--exec sp_helpDB;
declare @sql varchar(100);-- 사이즈 넣고(100)
set @sql = 'select * from userTbl where userID = ''EJW''; '; -- 홑따음표를 넣기위해 홑따옴표를 두번 넣음
exec(@sql); -- 저장 프로시져가 아닌 동적 쿼리인 exec이므로 ()파라미터 값을 넣어야 한다

-- WHY? select * from userTbl where userID = 'EJW' 안쓸까??  쿼리문을 다양한 동작을 하면서 바꿔야 할 때가 있기 때문에 ex) pivot