with sample_customer as (
    select *
    from {{ source('sample', 'customer') }}
),

sample_orders as (
    select * 
    from {{ source('sample', 'orders') }}
)

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as toal_price
from sample_customer c
left join sample_orders o
    on c.c_custkey = o.o_custkey
{{group_by(3)}}