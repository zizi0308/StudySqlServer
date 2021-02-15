USE [sqlDB]
GO

BEGIN TRY
	begin tran

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'권지용'
			   ,1988
			   ,'한양'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,getdate())


	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GJY'
			   ,'선글라스'
			   ,null
			   ,500000
			   ,1)

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK;
end catch -- 이거 꼭 활용 실무에서 진짜 많이 쓰임 이거쓰면 오류난거는 안들어감

GO


