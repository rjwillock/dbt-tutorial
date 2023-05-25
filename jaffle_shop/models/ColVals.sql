{% set payment_methods = dbt_utils.get_column_values(table=source('src','stripe_payments'), column='PaymentMethod') %}
--{% set payment_methods = dbt_utils.get_column_values(table=ref('payments'), column='PaymentMethod') %}

WITH all as (
    select * from {{ source('src','stripe_payments') }}
)
, vals AS (
{% for pm in payment_methods %}
    SELECT '{{pm}}' AS VAL
    {% if not loop.last %} UNION  {% endif %}
{% endfor %}

)

select * from vals