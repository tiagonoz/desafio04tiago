with staging as(
    select *
    from {{ ref('staging_products')}}
),
 final as (
     select
     row_number() over (order by product_id) as product_sk, --chave surrogate auto incremental
     *
     from staging
 )

 select * from final