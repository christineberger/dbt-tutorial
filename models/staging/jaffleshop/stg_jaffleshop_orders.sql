with source as (
  select * from {{ source('shop', 'orders') }}
),

renamed as (
  select
      id as order_id,
      user_id as customer_id,
      order_date,
      status,
      sum(payments.amount) as total_amount
  from source
  left join {{ ref('stg_jaffleshop_payments') }} as payments on source.id = payments.order_id
  group by 1, 2, 3, 4
)

select * from renamed
