begin try
	insert into userTbl values ('LSG', '이상구', 1988, '경기', NULL, NULL, 170, GETDATE());
	print '저장성공';
end try

begin catch
	print '저장실패, 관리자에게 문의요망'; --pk 중복
end catch