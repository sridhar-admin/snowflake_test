
{{ config(materialized='table') }}


select *
from  {{ ref('SF_STG_CONTACT') }}


