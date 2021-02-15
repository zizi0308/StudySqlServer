USE [tempdb]
GO

/*
	UPDATE [dbo].[bankbook]
	   SET uMoney = uMoney - 500  WHERE uName = '구매자';
	   
	UPDATE [dbo].[bankbook]	  
	   SET  uMoney = uMoney + 500  WHERE uName = '판매자';
	   select * from bankbook;
*/

begin try
	begin tran

	UPDATE [dbo].[bankbook]
	   SET uMoney = uMoney - 600  WHERE uName = '구매자';
	   
	UPDATE [dbo].[bankbook]	  
	   SET  uMoney = uMoney - 600  WHERE uName = '판매자';
	commit tran
end try
begin catch
	rollback;
end catch
	select * from bankbook;
go



