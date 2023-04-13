with orders as (

    select
        $1 as Id,
        $9 as Age,
        $11 Gender,
        $10 Education

    from DBT_TEST.DBT_MAXIMINO.LOAN_PAYMENT

)

select * from orders