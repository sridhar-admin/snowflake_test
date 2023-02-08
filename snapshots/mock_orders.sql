
{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='BSF01_DEV',
      target_schema='snapshots',
      unique_key='orders_id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from BSF01_DEV.DEV_ORDER.mock_orders

{% endsnapshot %}