with staging as(
    select *
    from {{ ref('staging_shippers')}}
),
 final as (
     select
     row_number() over (order by shipper_id) as shipper_sk, --chave surrogate auto incremental
     *
     from staging
 )

 select * from final