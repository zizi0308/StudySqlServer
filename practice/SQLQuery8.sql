-- SELECT memberID, memberName from memberTbl;
-- WHERE memberID like 'J%';

USE Bikestores;

SELECT * from Sales.customers;

SELECT * from production.products;

--DB조회
exec sp_helpdb;

--테이블조회
exec sp_tables @table_type = "'table'";

--열이름조회
exec sp_columns @table_name = 'stocks',
                @table_owner = 'production';