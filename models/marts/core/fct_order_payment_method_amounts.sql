{%- set payment_methods = dbt_utils.get_column_values(
    table=ref('raw_payments'),
    column='payment_method'
) -%}

select
  order_id,

  {%- for payment_method in payment_methods %}
  sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method }}_amount
  {%- if not loop.last %},{% endif -%}
  {% endfor %}

  -- sum(amount) as total_amount
from {{ ref('stg_jaffleshop_payments') }}
group by 1
