-- outer join 쿼리
select r.rentalIdx
	 --, r.memberIdx
     , m.memberName
     --, r.bookidx
	 --, b.cateidx
	 , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as rentalDt
     , format(r.returnDt, 'yyyy-MM-dd') as returnDt
     ,dbo.ufn_getState(r.rentalState) as '대여상태'
  from RentalTbl as r
 right outer join MemberTbl as m -- member기준 조인 얘부터 만들고
	on r.memberIdx = m.memberidx
/*right outer join BooksTbl as b
	on r.bookIdx = b.bookidx;  << 앞에 member가 기준이 된 가상의 테이블에 또 right join 하면 오른쪽에 있는 book이 기준이 됨 */
  left outer join BooksTbl as b
	on r.bookIdx = b.bookidx
  left outer join CateTbl as c
	on c.cateidx = b.cateidx
 where r.rentalIdx is null;

 --데이터 입력
insert into BooksTbl
(
	cateidx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
)
values
(
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
);

-- 책 테이블 위 책 정보 중 설명, 등록일자 수정
begin tran; -- 제발제발  update 전에는 begin tran / rollback / commit

select * 
  from BooksTbl; 

update BooksTbl
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
	 , regDate = '2021-02-18'
 where bookidx = 11; -- 이거 진짜 없음 큰일남 업데이트에 where절 없으면 이게 맞는지 의심해봐야함 절대 물어봐야함

rollback;
commit; -- begin tran이후 꼭꼭 rollback / commit 까먹지 말고하기

-- 카테고리 입력
begin tran;
insert into CateTbl /*(cateidx, cateName)*/ values ('I0001', '대화/협상'), -- 짦으면 생략가능
												   ('I0002', '성공/처세'),
												   ('I0003', '시간관리');

select * from CateTbl;

rollback;
commit;

--
begin tran;
delete from CateTbl where cateidx = 'I0003';

delete from CateTbl where cateidx in ('I0001', 'I0002'); -- 두개이상 지울 때

select * from CateTbl;

rollback;
commit;

-- delete update 는 where 꼭꼭확인하고 begin tran / rollback / commit 하기


