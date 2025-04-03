with 

source as (

    select * from {{ source('src_tpch_sf1', 'orders') }}

),

renamed as (

    select
        o_comment
        ,o_orderdate
        ,o_orderstatus
        ,o_orderkey
        ,o_custkey
        ,o_totalprice
        ,o_clerk
        ,o_orderpriority
        ,o_shippriority
    from source

)

select * from renamed