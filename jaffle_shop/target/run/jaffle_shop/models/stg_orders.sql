
  
    
        create or replace table `test_rw`.`stg_orders`
      
      
    using delta
      
      
      
      
      
      
      as
      select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from test_rw.jaffle_shop_orders
  