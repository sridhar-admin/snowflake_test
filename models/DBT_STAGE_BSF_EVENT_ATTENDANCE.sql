{{ config(materialized='table') }}

with tgt_STAGE_BSF_EVENT_ATTENDANCE(
select
  *
from {{ source('BSF01_SALESFORCE', 'STAGE_BSF_EVENT_ATTENDANCE')}}
)

select * from tgt_STAGE_BSF_EVENT_ATTENDANCE