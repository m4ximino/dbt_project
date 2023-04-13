with customers as (
    select * from {{ ref ('pay_test_sustomers')}}
),

orders as (
    select
        Id,
        Age,
        Gender,
        Education

    from customers
),

customer_orders as (

    select
        Id,
        YEAR(CURRENT_DATE) - Age AS year_date,
        TO_VARCHAR(TO_DATE(Date_Effective, 'MM/%d/%Y'), '%d/%m/%Y') as new_date,
        TO_VARCHAR(TO_DATE(Date_Due, 'MM/%d/%Y'), '%d/%m/%Y') as new_date_due

    from orders
    
    left join customers using (id)

),

final as (

    select
        customers.Id,
        customer_orders.year_date,
        customers.Age,
        customers.GENDER,
        customers.EDUCATION,
        customer_orders.new_date,
        customer_orders.new_date_due

    from customers

    left join customer_orders using (id)

)

select * from final