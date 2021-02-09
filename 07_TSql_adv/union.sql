-- union
select clubName, buildingNum as bLocation from ClubTbl
union
select stdName, region from StdTbl;

-- union all
select stdName, region from StdTbl
union all
select stdName, region from StdTbl;

-- except 2 번째 쿼리만 제외하고
select clubName, buildingNum as bLocation from ClubTbl
except
select stdName, region from StdTbl;

--intersect 2번째 쿼리만 해당하는 것만 조회
select clubName, buildingNum as bLocation from ClubTbl
intersect
select stdName, region from StdTbl;