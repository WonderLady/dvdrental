with customer_info as (
    
    select concat(first_name, ' ', last_name) as full_name,
    customer_id,
    email,
    address,
    phone,
    city, 
    country
    from {{ source('public', 'customer') }}
    join {{ source('public', 'address') }} using(address_id)
    join {{ source('public', 'city') }} using(city_id)
    join {{ source('public', 'country') }} using(country_id)
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
    join {{ source('public', 'payment') }} using(customer_id)
    group by 1, 2, 3, 4, 5, 6
    order by 7 DESC
    limit 10
)

select * from final