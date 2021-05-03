with orders as(
    select *
    from {{ ref('staging_orders')}}
),
    order_details as(
    select *
    from {{ ref('staging_order_details')}}
),
    customers as(
    select *
    from {{ ref('dim_customers')}}
),
    products as(
    select *
    from {{ ref('dim_products')}}
),
    shippers as(
    select *
    from {{ ref('dim_shippers')}}
),
    suppliers as(
    select *
    from {{ ref('dim_suppliers')}}
),


 orders_with_sk as (
     select
     orders.order_id,
     customers.customer_sk,
     shippers.shipper_sk,
     orders.order_date,
     orders.required_date,
     orders.freight
     from orders
     left join customers on orders.customer_id = customers.customer_id
     left join shippers on orders.ship_via = shippers.shipper_id
 ),

    order_details_with_sk as (
        select
        order_details.order_id,
        products.product_sk,
        order_details.discount,
        order_details.unit_price,
        order_details.quantity
    from order_details
    left join products on order_details.product_id = products.product_id
),

    final as (
        select 
        order_details.order_id,
        orders.customer_sk,
        orders.shipper_sk,
        orders.order_date,
        orders.freight,
        orders.required_date,
        order_details.product_sk,
        order_details.discount,
        order_details.unit_price,
        order_details.quantity,
        order_details.unit_price * order_details.quantity as subtotal
        from order_details_with_sk as order_details
        left join orders_with_sk as orders on order_details.order_id = orders.order_id
    )

 select * from final