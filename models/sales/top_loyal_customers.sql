with customers as (
    select first_name, 
        last_name
    from {{ source('public', 'customer') }}
),

address as (
    select address,
        phone 
    from {{ source('public', 'address') }}
),

city as (
    select * 
    from {{ source('public', 'city') }}
),

country as (
    select country
    from {{ source('public', 'country') }}
),

payments as (
    select amount
    from {{ source('public', 'payment') }}
),

customer_info as (
    
    select concat(first_name, ' ', last_name) as full_name,
        email,
        address,
        phone, 
        city, 
        country
    from customers
    join address using(address_id)
    join city using(city_id)
    join country using(country_id)
),

final as (
    select full_name, 
        email, 
        address, 
        phone, 
        city, 
        country,
        sum(amount) as total_purchase
    from customer_info
    join payments using(customer_id)
    group by 1, 2, 3, 4, 5, 6
    order by 7 DESC
    limit 10
)

select * from final