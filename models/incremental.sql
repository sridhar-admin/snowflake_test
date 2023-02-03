{{
config(
materialized = 'incremental',
on_schema_change='fail'
)
}}
WITH emp_src AS (
SELECT * FROM  {{ ref('emp_src') }}
)
SELECT * FROM emp_src
WHERE ID is not NULL
{% if is_incremental() %}
AND LOADDATE > (select max(LOADDATE) from {{ this }})
{% endif %}

