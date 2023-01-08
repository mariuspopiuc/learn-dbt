with orders as (
    select *
    from {{ source('sample', 'orders') }}
)

select 
    o_orderdate,
    o_totalprice,
    sum(o_totalprice) over (order by o_orderdate) as cumulative_total_price
from orders

order by o_orderdate