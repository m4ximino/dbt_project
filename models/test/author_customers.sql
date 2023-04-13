with customers as (

    select 
        ORDER_ID as id,
        AMOUNT as quat,
        PROFIT,
        QUANTITY,
        CATEGORY,
        SUBCATEGORY
    from DBT_TEST.DBT_MAXIMINO.ORDERS

)

select * from customers