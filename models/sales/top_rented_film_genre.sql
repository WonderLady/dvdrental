with top_rented as (
    select 
    name, count(customer_id) as total_rent_demand
    from {{ source('public', 'category') }}
    join {{ source('public', 'film_category') }} using(category_id)
    join {{ source('public', 'film') }} using(film_id)
    join {{ source('public', 'inventory') }} using(film_id)
    join {{ source('public', 'rental') }} using(inventory_id)
    join {{ source('public', 'customer') }} using(customer_id)
    group by 1
    order by 2 desc
),

total_sold as (
    select name, sum(amount) as total_sales
    from {{ source('public', 'category') }}
    join {{ source('public', 'film_category') }} using(category_id)
    join {{ source('public', 'film') }} using(film_id)
    join {{ source('public', 'inventory') }} using(film_id)
    join {{ source('public', 'rental') }} using(inventory_id)
    join {{ source('public', 'payment') }} using(rental_id)
    group by 1
    order by 2 desc
),

final as (
    select name, 
    total_rent_demand, 
    total_sales
    from top_rented
    join total_sold using(name)
)

select * from final