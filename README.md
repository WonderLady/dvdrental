# DVD Rental Analytics Project
### Description:
The goal of this project is to assess rental performance, identify the top rented film genres and recognise the top 10 loyal customers.

On execution, data was extracted from the Postgres database and staged into a dedicated database on Snowflake using Airbyte. DBT Core was employed to create models that captures rental performance, top rented film genres and top 10 loyal customers. This transformed data was loaded into the production database on Snowflake in form of views. DBT Cloud was utilised for scheduling and orchestrating the execution of the above models. This project includes scripts, workflows to execute the project and schema.md file that contains comprehensive documentation/details on tables, relationships and fields.

### Pre-requisite:
In order to run the program, you will first need to download the required data and store in a database called 'dvdrental' on Postgres.
Install and configure Airbyte including setting up connections and credentials.
Create Snowflake account and a dedicated database to receive raw and transformed data.
Install and configure DBT Core
Create DBT cloud(optional)

### Setting-up environment:
Follow the steps below to setup your environment for running the program:

Clone this repository

Change directory into the project directory using the command: cd dvdrental

Create and activate a virtual environment by running the code below:

python3 -m venv name-of-virtual-environment --- (Create virtual environment)
source ./name-of-virtual-environment/bin/activate --- (Activate environment.)
dbt init --- (Create a new DBT project)

Set up a profile for DBT (profiles.yml) to store credentials that helps connect to the database by running:
cd ~ --- (Root Directory)
cd .dbt --- (Change to dbt directory)
code . --- (Open code session)

profiles.yml
Your .yml file should contain the code below. Replace the value of the variables with your credentials.

PROJECT_NAME=your_dbt_project_name
ACCOUNT=your_snowflake_account_url_number
DATABASE=your_snowflake_database_name
PASSWORD=snowflake_password
ROLE=your_snowflake_role
SCHEMA=your_snowflake_schema
THREADS=no_of_threads
TYPE=your_data_warehouse_type
USER=your_snowflake_username
WAREHOUSE=your_snowflake_warehouse
TARGET=your_target_snowflake_database


### Running the program:
To run the programe from the command line, run below code:

dbt run
dbt test
dbt docs generate
dbt docs serve

### Output:
The materialised tables or views can be found in the schema in the warehouse.
