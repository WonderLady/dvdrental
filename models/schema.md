{% docs customer_table %}
## About Table:
This table contains information about customers details, including full names.

| column_name |  description                                                    |  data_type |
|-------------|-----------------------------------------------------------------|----------- |
| customer_id | This is the primary key of the table                            |  integer   |
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
| address     | This is the first line of customers' address                                                            |  varchar   |
| district    | This is the district where customers' live in.                                                          |  varchar   |
| postal_code | This is the postal or zip code of customers' address                                                    |  varchar   |
| city_id     | This is a foreign key from the city table that represents unique ID for the city of customers' residence|  integer   |
    
{% enddocs %}

{% docs city_table %}
## About Table:
This table contains information about cities in which the customers reside in.

| column_name |  description                                                                                            |  data_type |
|-------------|---------------------------------------------------------------------------------------------------------|----------- |
| city_id     | This is the primary key of the table                                                                    |  integer   |
| city        | This is the name of the city customer's live in                                                         |  varchar   |
| country_id  | This foreign key is a primary key in the country table                                                  |  integer   |
    
{% enddocs %}

{% docs country_table %}
## About Table:
This table contains information about the countries in which customers reside in.

| column_name  |  description                                                                                            |  data_type |
|--------------|---------------------------------------------------------------------------------------------------------|----------- |
| country_id   | This is the primary key of the table                                                                    |  integer   |
| country      | This is the country in which rental customers reside in                                                 |  varchar   |
| last_updated | This is the date in which the countries table was last updated                                          |  date      |
    
{% enddocs %}

{% docs payment_table %}
## About Table:
This table contains information about payment transactions from film rentals

| column_name   |  description                                                                                            |  data_type |
|---------------|---------------------------------------------------------------------------------------------------------|----------- |
| payment_id    | This is the primary key of the table.                                                                   |  integer   |
| customer_id   | This foreign key is a primary key in the customer table.                                                |  integer   |
| staff_id      | This foreign key is a primary key in the staff table.                                                   |  integer   |
| rental_id     | This foreign key is a primary key in the rental table.                                                  |  integer   |
| amount        | This is a foreign key from the city table that represents unique ID for the city of customers' residence|  float     |
| payment_date  | This is a foreign key from the city table that represents unique ID for the city of customers' residence|  date      |
    
{% enddocs %}

{% docs film_table %}
## About Table:
This table contains information about all rental films.

| column_name       |  description                                                                                                          |  data_type |
|-------------------|-----------------------------------------------------------------------------------------------------------------------|----------- |
| film_id           | This is the primary key of the table.                                                                                 |  integer   |
| title             | This is the name of the film rented.                                                                                  |  varchar   |
| description       | This provides brief information about the film.                                                                       |  varchar   |
| release_year      | This is the year the rented film was released.                                                                        |  integer   |
| language_id       | This is a foreign key in the language table that represents unique ID for the language in which the film is subtitled |  integer   |
| rental_duration   | This is the maximum duration in which a film can be rented for.                                                       |  integer   |
| rental_rate       | This is the rental amount for the film.                                                                               |  float     |
| length            | This is the duration of the film rented.                                                                              |  integer   |
| replacement_cost  | This is the amount it costs to replace a lost or damaged film which was rented.                                       |  float     |
| rating            | This is the rating for each film to put restrictions as to films for all age groups.                                  |  varchar   |
| last_updated      | This is the date the film table was last updated.                                                                     |  date      |
    
{% enddocs %}

{% docs inventory_table %}
## About Table:
This table contains information about inventories.

| column_name   |  description                                                                                             |  data_type |
|---------------|----------------------------------------------------------------------------------------------------------|----------- |
| inventory_id  | This is the primary key of the table.                                                                    |  integer   |
| film_id       | This foreign key is a primary key in the film table.                                                     |  integer   |
| store_id      | This foreign key is a primary key in the store table.                                                    |  integer   |
| last_update   | This is date the inventory table was last updated.                                                       |  date      |
    
{% enddocs %}

{% docs rental_table %}
## About Table:
This table contains information about all rentals.

| column_name   |  description                                                                                            |  data_type |
|---------------|---------------------------------------------------------------------------------------------------------|----------- |
| rental_id     | This is the primary key of the table.                                                                   |  integer   |
| rental_date   | This is the date the film was rented.                                                                   |  date      |
| inventory_id  | This foreign key is a primary key in the inventory table.                                               |  integer   |
| customer_id   | This foreign key is a primary key in the customer table.                                                |  integer   |
| return_date   | This is the date the rented film was returned.                                                          |  date      |
| staff_id      | This is a foreign key in the staff table.                                                               |  integer   |
| last_update   | This is the date the rental table was last updated.                                                     |  date      |
    
{% enddocs %}

{% docs category_table %}
## About Table:
This table contains information about the different film genres.

| column_name   |  description                                                                                            |  data_type |
|---------------|---------------------------------------------------------------------------------------------------------|----------- |
| category_id   | This is the primary key of the table.                                                                   |  integer   |
| name          | This contains information on the different genres available.                                            |  varchar   |
| last_update   | This is the date the category table was last updated.                                                   |  date      |
    
{% enddocs %}

{% docs film_category_table %}
## About Table:
This table contains information about the genres of films for rent.

| column_name   |  description                                                                                            |  data_type |
|---------------|---------------------------------------------------------------------------------------------------------|----------- |
| film_id       | This is the primary key of the table.                                                                   |  integer   |
| category_id   | This foreign key is a primary key in the category table.                                                |  integer   |
| last_update   | This is a foreign key from the city table that represents unique ID for the city of customers' residence|  date      |
    
{% enddocs %}