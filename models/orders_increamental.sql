{{ 
    config(materialized='incremental',
    unique_key='order_id')
}}

with orders as (
	select * from  BSF01_DEV.DEV_ORDER.mock_orders_merge
	
	{% if is_incremental() %}
	where ORDER_DATE >= (select max(ORDER_DATE) from {{ this }})
	{% endif %}
)

select * from orders