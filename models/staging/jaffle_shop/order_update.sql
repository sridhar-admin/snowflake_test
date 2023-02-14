{{ 
    config(materialized='table')
}}

WITH orders AS (
    SELECT * FROM raw.jaffle_shop.customers_delete
)

select * from orders

