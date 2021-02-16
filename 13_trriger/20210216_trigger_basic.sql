USE	sqlDB;
go

create or alter trigger trg_testTbl
on testTbl
after delete, insert, update -- 삭제 수정할 때 트리거 발생
as
	print '새트리거 발생'; -- 여기에 수행하는 일을 입력하면 됨

insert into testTbl values ('또롱'); -- delete, insert, update 발생 이후에 실행을 하면 트리거 발생
select * from testTbl where txt = '마마무';
update testTbl set txt = '마마무뉴!' where id = 4;
delete testTbl where id = 3;