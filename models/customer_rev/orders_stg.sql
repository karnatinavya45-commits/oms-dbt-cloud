select
  orderid,
  orderdate,
  customerid,
  employeeid,
  storeid,
  status as statuscd,
  case
       when status = '01' then 'in progress'
       when status = '02' then 'completed'
       when status = '03' then 'cancelled'
       else NULl
    end as statusDESC,
    CASE
      WHEN StoreID = 1000 THEN 'online' 
      ELSE 'in-store'
    END AS ORDER_CHANGE,
    UPDATED_AT,
    current_timestamp as dbt_updated_at
FROM
  {{ source( 'landing', 'orders') }}