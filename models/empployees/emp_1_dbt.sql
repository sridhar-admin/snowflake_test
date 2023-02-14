{{ config(materialized='table') }}

with emp as (
select * from {{ source('DEV_ORDER', 'EMP_1') }}
)

select * from emp