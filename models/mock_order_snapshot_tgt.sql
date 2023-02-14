{{ config(materialized='table') }}

select *
from {{ ref('mock_orders_snapshot') }}