{{ config(materialized='table') }}

with emp as (
select 
md5(EMPNAME || LOCATION || EMP_ID) as unique_id,
* 
from {{ source('DEV_ORDER', 'EMP_1') }}
)

select * from emp