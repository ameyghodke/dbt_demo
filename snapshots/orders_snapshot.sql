{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      strategy='check',
      unique_key='id',
      check_cols='all',
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}