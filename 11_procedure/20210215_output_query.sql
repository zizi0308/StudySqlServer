USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:54 ******/
create or ALTER procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output -- 값이 입력되는 파라미터가 아님 값을 다시 리턴받는 파라미터임
	
	
as
	insert into testTbl values (@txtValue);
	select outValue = IDENT_CURRENT('testTbl'); -- testTbl의 현재 identity값 리턴
go

