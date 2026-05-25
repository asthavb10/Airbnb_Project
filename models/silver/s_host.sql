with source as (
    select *
    from {{ source('bronze', 'HOSTS') }}
),

cleaned as (
    select
        host_id,

        case 
            when host_name is null or trim(host_name) = '' 
            then 'UNKNOWN_HOST'
            else trim(host_name)
        end as host_name,

        case 
            when host_since is null or trim(cast(host_since as varchar)) = ''
            then date '1900-01-01'
            else host_since
        end as host_since,

        case 
            when is_superhost is null or trim(cast(is_superhost as varchar)) = ''
            then false
            else is_superhost
        end as is_superhost,

        case 
            when response_rate is null 
              or trim(cast(response_rate as varchar)) = ''
              or response_rate = 0
            then 50
            else response_rate
        end as response_rate,

        coalesce(created_at, current_timestamp) as created_at

    from source
    where host_id is not null
      and trim(cast(host_id as varchar)) != ''  
)

select * from cleaned