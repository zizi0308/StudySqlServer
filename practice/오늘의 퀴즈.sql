select * from sales.customers
where last_name like 'S%'
  and state = 'NY'
  and phone is not null
order by first_name asc;

-- sales.customers에서 phone is not null, last_name S 로 시작 state가 NY인 사람들의 first_name을 오름차순으로 정렬하시오