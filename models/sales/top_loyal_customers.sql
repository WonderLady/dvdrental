customer_info as (
    
    select concat(first_name, ' ', last_name) as full_name,
        email,
        address,
        phone, 
        city, 
        country
    from {{ source('public', 'customer') }}
    join from {{ source('public', 'address') }} using(address_id)
    join from {{ source('public', 'city') }} using(city_id)
    join from {{ source('public', 'country') }} using(country_id)
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
    join from {{ source('public', 'payment') }} using(customer_id)
    group by 1, 2, 3, 4, 5, 6
    order by 7 DESC
    limit 10
)

select * from final