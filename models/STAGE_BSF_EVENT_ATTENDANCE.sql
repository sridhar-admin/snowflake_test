
{{ config(materialized='table') }}

with tgt_STAGE_BSF_EVENT_ATTENDANCE as
(
SELECT * 

FROM 

BSF01_DEV.BSF01_SALESFORCE.STAGE_BSF_EVENT_ATTENDANCE
  LIMIT 10
)

select * from tgt_STAGE_BSF_EVENT_ATTENDANCE








