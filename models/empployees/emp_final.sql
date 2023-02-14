{{ config(materialized='table') }}

with emp_1 as (
select * from {{ ref('emp_1_dbt') }}
),

emp_2 as (
select * from {{ ref('emp_2_dbt') }}
)

emp_final as (
select * from emp_1
union all
select * from emp_2
)

select * from emp_final
