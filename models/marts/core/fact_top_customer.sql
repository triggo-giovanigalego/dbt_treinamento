with top_customers as (
    select
        o_custkey
        ,sum(o_totalprice) as totalprice
    from {{ref('stg_src_tpch_sf1__orders')}}
    group by all
)


select
    dim.c_name
    ,totalprice as top_orders
from top_customers as top_cus
inner join {{ref('dim_customer')}} as dim on dim.c_custkey = top_cus.o_custkey
qualify rank() over(order by totalprice desc) <= 5

