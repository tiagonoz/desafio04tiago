with source_data as (

    select 
    phone,
    company_name,
    shipper_id
    from {{ source('northwind_etl','shippers') }}

)

select *
from source_data