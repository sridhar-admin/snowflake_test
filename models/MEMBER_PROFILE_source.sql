{{ config(materialized='table') }}

with stg_MEMBER_PROFILE as 
(
select * from BSF01_DEV.BSF01_MEMBER.MEMBER_PROFILE limit 10
)

select * from stg_MEMBER_PROFILE