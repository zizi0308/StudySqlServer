use sqlDB;
go


-- �̸��� ���ȣ�λ�� ��ȸ
select * from userTbl
where userName = '���ȣ';

-- 1970���� ��� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ and�� ��� ���������� ���ϸ鼭 ã�� �� ����
SELECT userID,	userName, height
	from userTbl
   where birthYear >= 1970
	and	height >= 182;

-- 1970 ���� ����̰ų� Ű�� 182�̻��̰ų� �� ����� ���
select userID,	userName, height
	from userTbl
   where birthYear >= 1970
	or	height >= 182;

-- Ű�� 180~183������ ����� ��ȸ (�Ʒ��� ���� ����� ����)
select userID,	userName, height
	from userTbl
   where height >= 180
	and	height <= 183;
--between ~ and
select userID,	userName, height
	from userTbl
   where height between 180 and 183;

-- ������ �泲, ����, ���
select userID,	userName, addr
	from userTbl
 where addr = '�泲'
	or addr = '����'
	or addr = '���';

-- ���� ���������� �� ���� in
select userID,	userName, addr
	from userTbl
	where addr in ('�泲', '����', '���') ;

-- like ���ڿ� %���� ������ �����ϴ� �������
select userID,	userName, addr
	from userTbl
	where userName like '��%';

-- %�� �ַ� �� (_�� ������ ������ ����߸��� ������ �� �Ⱦ�)
select userID,	userName, addr
	from userTbl
	where userName like '_����';

-- SUBQUERY
select userName, height
  from userTbl
 where height > 177; 

-- �����������ʿ��� WHERE���� �ִ� ���� SUBQUERY�� �� �� �ִ�. + SUBQUERY�� ���� �ϳ��̴�
 select userName, height
  from userTbl
 where height >
	  ( select height from userTbl where userName = '���ȣ');

select userName, height
  from userTbl
 where height in
	  ( select height from userTbl where addr = '�泲'); --170,173 


-- order by : ����
select userName, mDATE
  from userTbl
 order by mDate desc; --desc(��������) asc(��������)

select *
  from userTbl
 order by userID desc;

-- destinct : �ߺ��� �����ϰ� ����� �� ��
select distinct addr
  from userTbl;
-- top : ���� n ���� ���
select top(5) *
  from userTbl
order by mDate desc;

-- offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
  from userTbl
 order by birthYear
 offset 4 rows;

 --select into
 select * into buyTbl2 from buyTbl; -- ������ ���̺��� pkŰ ����(���������� ����x)
 select userID, prodName into buyTbl3 from buyTbl; -- �ʿ��� �͸� ������ �� ���� but �ߺ��� ������ 

 -- group by

 select userID, amount
   from buyTbl
  order by userID;

select userID, sum(amount) as '�����հ�' -- sum(amount)�� ���� ���� �����հ��� �θ��ٶ�� ''�ȿ� �־���(�� �ʿ�) + sum�ȿ� �� �� �ִ� ������ ������
   from buyTbl
  group by userID;

--MIN, MAX (�����Լ��� �� ��쿡�� group by���ص� ������� but �Ϲݰ� �������� �����)
select min(height) as '�ּ�Ű', max(height) as 'ūŰ'
 from userTbl
group by userID, userName;

select userID, userName
  from userTbl
 where height = (select min(height) from userTbl)
    or height = (select max(height) from userTbl)

-- �� �������� ����
select count(*) as 'ȸ����' from userTbl; --10 (userID �־ ������ �� ���ϰ� *�� <<�� ���� �� �� ����)
select count(*) as '���ų�����' from buyTbl; --12

