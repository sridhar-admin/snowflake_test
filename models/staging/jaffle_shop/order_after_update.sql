{{ 
    config(materialized='table')
}}

SELECT
    CASE
        WHEN ID = 1 and last_name='B' THEN 'SRIDHAR'
        when id = 3 then 'BHAGYA'
        ELSE FIRST_NAME
    END AS FIRST_NAME,
    id, 
    LAST_NAME
FROM {{ ref('order_update') }}