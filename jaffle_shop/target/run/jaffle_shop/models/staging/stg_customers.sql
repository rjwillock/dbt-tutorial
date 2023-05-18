
  
    
        create or replace table `test_rw`.`stg_customers`
      
      
    using delta
      
      
      
      
      
      
      as
      select
        id as customer_id,
        first_name,
        last_name

    from test_rw.jaffle_shop_customers
  