with source as (
  select * from {{ source('shop', 'customers') }}
),

renamed as (
  select
      id as customer_id,
      first_name,
      last_name
  from {{ source('shop', 'customers') }}
)

select * from renamed
