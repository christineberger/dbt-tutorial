select *
from {{ source('shop', 'payments') }}
