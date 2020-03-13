{% macro get_payment_methods() %}

{{ return(get_column_values('payment_method', ref('stg_jaffleshop_payments'))) }}

{% endmacro %}
