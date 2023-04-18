with customers as (
    select * from {{ ref ('covid')}}
)

select * from customers