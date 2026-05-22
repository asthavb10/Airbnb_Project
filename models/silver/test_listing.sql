select *
from {{source('bronze','LISTINGS')}}
limit 10