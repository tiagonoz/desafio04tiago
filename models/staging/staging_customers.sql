with source_data as (

    select 
    country,
    city,
    fax,
    address,
    postal_code,
    region,
    customer_id,
    contact_name,	
    phone,
    company_name,
    contact_title
    from {{ source('northwind_etl','customers') }}

)

select *
from source_data