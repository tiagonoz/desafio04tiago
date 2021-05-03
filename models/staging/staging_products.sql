with source_data as (

    select 
    product_id,
    units_in_stock,
    category_id,
    unit_price,
    reorder_level,
    product_name,
    quantity_per_unit,
    supplier_id,
    units_on_order,
    case
        when discontinued = 0 then 'Não'
        else 'Sim'
    end as is_discontinued
    
    from {{ source('northwind_etl','products') }}

)

select *
from source_data