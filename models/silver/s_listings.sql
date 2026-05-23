with source as (
    select *
    from {{ source('bronze', 'LISTINGS') }}
),
cleaned as (
    select
        
        listing_id,
        host_id,

        
        case 
            when property_type is null or trim(property_type) = '' 
            then 'UNKNOWN'
            else trim(property_type)
        end as property_type,

        case 
            when room_type is null or trim(room_type) = '' 
            then 'UNKNOWN'
            else trim(room_type)
        end as room_type,

        case 
            when city is null or trim(city) = '' 
            then 'UNKNOWN'
            else trim(city)
        end as city,

        case 
            when country is null or trim(country) = '' 
            then 'UNKNOWN'
            else trim(country)
        end as country,

        
        case
            when accommodates is null 
              or trim(cast(accommodates as varchar)) = ''
              or accommodates = 0
            then 1
            else accommodates
        end as accommodates,

        case
            when bedrooms is null 
              or trim(cast(bedrooms as varchar)) = ''
              or bedrooms = 0
            then 1
            else bedrooms
        end as bedrooms,

        case
            when bathrooms is null 
              or trim(cast(bathrooms as varchar)) = ''
              or bathrooms = 0
            then 1
            else bathrooms
        end as bathrooms,

        case
            when price_per_night is null 
              or trim(cast(price_per_night as varchar)) = ''
              or price_per_night = 0
            then 0
            else price_per_night
        end as price_per_night,

        coalesce(created_at, current_timestamp) as created_at

    from source
    where listing_id is not null
      and trim(cast(listing_id as varchar)) != ''  
      and host_id is not null
      and trim(cast(host_id as varchar)) != ''     
)
select * from cleaned