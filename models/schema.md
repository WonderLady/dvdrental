{% docs customer_table %}
## About Table:
This table contains information about customer details, including full names.

| column_name |  description                                                    |  data_type |
|-------------|-----------------------------------------------------------------|----------- |
| customer_id | This is the primary key of the table                            | integer    |
| store_id    | This is the id of the store where customers rent films from     |  integer   |
| first_name  | This is the first name of the customer who rented a film        |  varchar   |
| last_name   | This is the last name of the customer who rented a film         |  date      |
| email       | This is the email address of the customer who rented a film     |  varchar   |
    
{% enddocs %}

{% docs address_table %}
## About Table:
This table contains information about customer address details including first line address and postcode.

| column_name |  description                                                                                            |  data_type |
|-------------|---------------------------------------------------------------------------------------------------------|----------- |
| address_id  | This is the primary key of the table                                                                    |  integer   |
| address     | This is the first line of customers' address                                                            |  integer   |
| district    | This is the district where customers' live in.                                                          |  varchar   |
| postal_code | This is the postal or zip code of customers' address                                                    |  date      |
| city_id     | This is a foreign key from the city table that represents unique ID for the city of customers' residence|  integer   |
    
{% enddocs %}