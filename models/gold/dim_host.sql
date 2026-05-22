select
    host_id,
    host_name,
    host_since,
    is_superhost,
    response_rate,
    datediff('year',host_since,current_date) as years_as_host
from {{ref('scd2_host')}}