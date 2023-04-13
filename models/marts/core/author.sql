with customers as (
    select * from {{ ref ('author_customers')}}
),

customer_orders as (

    select
        CATEGORY,SUBCATEGORY,
        min(QUANTITY) as min_quat,
        max(QUANTITY) as max_quant,
        sum(QUANTITY) as sub

    from customers

    group by CATEGORY, SUBCATEGORY

)


select * from customer_orders