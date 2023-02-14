{{ 
    config(materialized='table')
}}

WITH soft_deletes AS (
    SELECT
        *,
        CASE
            WHEN status IS NULL THEN true
            ELSE false
        END AS to_delete
    FROM {{ ref('stg_orders') }}
)

SELECT * FROM soft_deletes WHERE to_delete = false