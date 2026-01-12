
{{ config(materialzed='table')}}

SELECT
   os.customerid,
   c.customername,
   SUM(os.ordercount) AS ordercount,
   SUM(os.revenue) AS revenue
FROM {{ ref('orders_fact') }} os
JOIN {{ ref('customers_stg') }} c
   ON os.customerid = c.customerid
GROUP BY
   os.customerid,
   c.customername

  