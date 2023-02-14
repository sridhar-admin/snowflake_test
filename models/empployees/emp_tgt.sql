{{ config(materialized='table') }}

{% if var('xyz') == 'all' %}

with emp_final as (
    select * from {{ source('DEV_ORDER', 'EMP_1') }}
    union all 
    select * from {{ source('DEV_ORDER', 'EMP_2') }}
)
{% else %}
with emp_final as (select * from {{ source('DEV_ORDER', 'EMP_2') }})

{% endif %}

select * from emp_final
