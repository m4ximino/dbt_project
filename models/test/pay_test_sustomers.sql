with customers as (

    select 
        $1 as ID,
        $2 as Status,
        $3 as Principal,
        $4 as Terms,
        $5 as Date_Effective,
        $6 as Date_Due,
        $7 as Paid_Off_Time,
        $9 as Age,
        $10 Education,
        $11 Gender
    from DBT_TEST.DBT_MAXIMINO.LOAN_PAYMENT

)

select * from customers