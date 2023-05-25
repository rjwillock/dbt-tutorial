{{
  config(
    materialized='table'
  )
}}

{%- set dtPart = "day" -%}

WITH as_of_date AS (
    {{ dbt_utils.date_spine(dtPart, 
                            start_date="TO_DATE('2023/01/01', 'yyyy/mm/dd')",
                            end_date="TO_DATE('2023/05/25', 'yyyy/mm/dd')") }}
)

SELECT DATE_{{dtPart}} as AS_OF_DATE FROM as_of_date