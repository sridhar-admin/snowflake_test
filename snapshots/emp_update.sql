{% snapshot scd_raw_listings %}

{{
  config(
        target_schema='DEV1',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=TRUE
        )
}}

select * FROM {{ sources('BSF01_DEV', 'emp_alias') }}

{% endsnapshot %}