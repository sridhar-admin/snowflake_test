{{ config(materialized='table') }}

with parts_data as (

select 1 as id, 'part1' as partname ,current_timestamp as loaddate
union all 
select 2 as id, 'part2' as partname ,current_timestamp as loaddate
union all
select 3 as id, 'part3' as partname ,current_timestamp as loaddate
)


select * from parts_data

