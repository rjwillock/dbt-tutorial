create or replace view `test_rw`.`my_second_dbt_model`
  
  
  as
    -- Use the `ref` function to select from other models

select *
from `test_rw`.`my_first_dbt_model`
where id = 1
