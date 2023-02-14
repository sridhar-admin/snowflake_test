

SELECT {{ is_even('id') }}   as is_even ,id ,FIRST_NAME,LAST_NAME
FROM {{ ref('order_update') }} 