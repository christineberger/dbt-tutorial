select
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    orders.order_status,
    sum(payments.amount)
from {{ source('shop', 'orders') }} as orders
left join {{ source('shop', 'payments' )}} as payments on orders.order_id = payments.payment_id
