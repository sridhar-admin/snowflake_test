
{{
    config(
        materialized='incremental',
        unique_key='orders_id',
        incremental_strategy='merge',
        merge_update_columns = ['status', 'created_at']
    )
}}


WITH using_clause AS (
    SELECT
		orders_id ,
		status,
		created_at ,
		updated_at
    FROM BSF01_DEV.DEV_ORDER.mock_orders_merge

    {% if is_incremental() %}
        WHERE updated_at > (SELECT max(updated_at) FROM {{ this }})
    {% endif %}
),


updates AS (
    SELECT
		orders_id ,
		status,
		created_at ,
		updated_at
    FROM using_clause

    {% if is_incremental() %}
        WHERE orders_id IN (SELECT orders_id FROM {{ this }})
    {% endif %}
),

inserts AS (
    SELECT
		orders_id ,
		status,
		created_at ,
		updated_at
    FROM using_clause
    WHERE orders_id NOT IN (SELECT orders_id FROM updates)
)


SELECT * FROM updates 
UNION 
SELECT * FROM inserts