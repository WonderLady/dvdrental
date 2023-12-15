with date_diff as (
    select *,
    DATE_PART('day', return_date - rental_date) as date_difference
    from {{ source('public', 'rental') }}
),

status as (
    select film_id,
    case
        when rental_duration > date_difference then 'Returned early'
        when rental_duration = date_difference then 'Returned on time'
        else 'Returned late'
    end as return_status
    from {{ source('public', 'film') }}
    join from {{ source('public', 'inventory') }} using(film_id)
    join date_diff using(inventory_id)
),

final as (
    select return_status,
    count(film_id) as total_films
    from status
    group by 1
)

select * from final