use sqlDB;
go

create trigger trg_backupUserTbl
on userTbl
-- 여기에 with encryption 을 쓰면 암호화
after update, delete
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED() > 0) -- 엽데이트
	begin
		set @modType = '수정';
	end
	else -- delete
	begin
		set @modType = '삭제';
	end

	insert into backup_userTbl

	SELECT [userID], [userName], [birthYear], [addr], [mobile1], [mobile2], 
		   [height], [mDate], @modType, getdate(), user_name() 
		   FROM deleted; -- 시스템상의 변경된 데이터의 원본데이터

GO