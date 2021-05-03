with staging as(
    select *
    from {{ ref('staging_suppliers')}}
),
 final as (
     select
     row_number() over (order by supplier_id) as supplier_sk, --chave surrogate auto incremental
     *
     from staging
 )

 select * from final