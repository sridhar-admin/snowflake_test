{{ config(materialized='table') }}

with emp as (
select * from {{ source('DEV_ORDER', 'EMP_2') }}
)

select * from emp