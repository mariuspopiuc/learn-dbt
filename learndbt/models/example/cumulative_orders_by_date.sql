

select 
    o_orderdate,
    o_totalprice,
    sum(o_totalprice) over (order by o_orderdate rows between unbounded preceding and current row) as cumulative_total_price
from snowflake_sample_data.tpch_sf1.orders