top_rented as (
    select c.name as genre, count(cs.customer_id) as total_demand
    from {{ source('public', 'category') }} as c
    join from {{ source('public', 'film_category') }} using(category_id)
    join from {{ source('public', 'film') }} using(film_id)
    join from {{ source('public', 'inventory') }} using(film_id)
    join from {{ source('public', 'rental') }} using(inventory_id)
    join from {{ source('public', 'customer') }} as cs using(customer_id)
    group by 1
    order by 2 desc
),

total_sold as (
    select genre, sum(p.amount) as total_sales
    from {{ source('public', 'category') }} as c 
    join from {{ source('public', 'film') }} using(film_id)
    join from {{ source('public', 'inventory') }} using(film_id)
    join from {{ source('public', 'rental') }} using(inventory_id)
    join from {{ source('public', 'payment') }} as p using(rental_id)
    group by 1
    order by 2 desc
),

final as (
    select total_sold.genre, top_rented.total_demand, total_sold.total_sales
    from top_rented
    join total_sold using(genre)
)

select * from final