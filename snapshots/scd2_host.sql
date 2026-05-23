{% snapshot scd2_host %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='host_id',

        strategy='check',
        check_cols=['host_name', 'response_rate', 'is_superhost']
    )
}}

select
    host_id,
    host_name,
    host_since,
    is_superhost,
    response_rate,
    created_at
from {{ ref('s_host') }}

{% endsnapshot %}