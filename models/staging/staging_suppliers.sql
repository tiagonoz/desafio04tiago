with source_data as (

    select
    country,
    city,
    fax,
    postal_code,
    homepage,
    address,
    region,
    supplier_id,	
    contact_name,		
    phone,
    company_name,	
    contact_title
    from {{ source('northwind_etl','suppliers') }}

)

select *
from source_data