use BikeStores;
go

-- 자전거 리스트
select p.product_id, p.product_name,
       /*p.brand_id,*/ b.brand_name,
       /* p.category_id,*/ ct.category_name,
	   p.model_year, 
	   format(p.list_price, '$ #,#.00') as list_price -- price 단위처리 (, 와 $)
  from production.products as p -- 1. 기니까 줄이기
 inner join production.categories as ct
	on p.category_id = ct.category_id -- 2. id는 번호기 때문에 식별할 수 없음 같은 것끼리 묶어서 처리 후 select라인 주석처리 
 inner join production.brands as b
	on p.brand_id = b.brand_id;


select od.order_id, concat(ct.first_name, ' ', ct.last_name) as full_name, 
       case od.order_status
	   when 1 then '주문완료'
	   when 2 then '결제완료'
	   when 3 then '배송전'
	   when 4 then '배송완료'
	   else '이상상태'
	  end as '주문단계',
       od.order_date, od.required_date, od.shipped_date,
	   od.store_id, od.staff_id, concat(st.first_name, ' ', st.last_name) as staff_name
  from sales.orders as od
 inner join sales.customers as ct
	on od.customer_id = ct.customer_id
 inner join sales.staffs as st
    on od.staff_id = st.staff_id
 inner join sales.stores as sr
    on od.store_id = sr.store_id