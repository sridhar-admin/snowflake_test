import snowflake.snowpark.functions as f
from snowflake.snowpark.functions import col

def model(dbt, session):
    dbt.config(materialized = "table")
    
    df_cust = dbt.ref("stg_customer")
    df_ord = dbt.ref("stg_orders")

    df_customer_orders = df_ord.group_by(col("customer_id")).agg([f.min(col("order_date")).alias("first_order"), f.max("order_date").alias("most_recent_order"), f.count("order_id").alias("number_of_orders")]) 
    return df_customer_orders