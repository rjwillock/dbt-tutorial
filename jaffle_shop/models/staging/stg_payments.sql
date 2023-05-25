
 {%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon','gift_card'] -%}

WITH payments
AS(SELECT ID AS order_id
, PaymentMethod
, Amount
, status
from test_rw.stripe_payments
)
, pvt AS (
SELECT order_id
--, {{ target.name }} as Target
{% for pm in payment_methods -%}
--, sum(case when PaymentMethod = '{{ pm }}' then amount else 0 end) as {{pm}}_amount 
, sum(case when PaymentMethod = '{{ pm }}' then {{ cents_to_dollars('amount') }} else 0 end) as {{pm}}_amount_dolls
{% endfor -%}
from payments
where status = 'success'
group by order_id
)


select * from pvt