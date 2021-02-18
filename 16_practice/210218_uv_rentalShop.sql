create or alter view uv_nonerentalMember
as
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

