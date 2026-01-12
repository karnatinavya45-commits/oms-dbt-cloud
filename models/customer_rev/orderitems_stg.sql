select
   orderitemID,
   orderID,
   productID,
   quantity,
   unitprice,
   quantity * unitprice as totalprice,
   UPDATED_AT
from
   {{ source('landing', 'orderitems')}}