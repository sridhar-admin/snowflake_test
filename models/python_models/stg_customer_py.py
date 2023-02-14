import snowflake.snowpark.functions as f
from snowflake.snowpark.functions import col

def model(dbt, session):
    dbt.config(materialized = "table")

    df = dbt.ref("stg_customer")
    df_new = df.select(df.customer_id,df.first_name,df.last_name)
    return  df_new
 