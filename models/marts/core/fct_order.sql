
with orders as (
  select * from {{ ref('stg_orders')}}
),

payments as (
    select * from {{ ref('stg_payment')}}
),

payments as (
    select * from {{ ref('dim_customers')}}
),


fct_orders as (
    select order_id,
            payment_id,
            amount
        from orders o
        left join payments p ON o.order_id=p.payment_id
    )

    select * from fct_orders

