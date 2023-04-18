with customers as (

    select 
        $1 as COUNTRY_REGION,
        $2 as PROVINCE_STATE,
        $3 as DATE,
        $4 as POSITIVE,
        $5 as NEGATIVE,
        $6 as INCONCLUSIVE

    from COVID19_EPIDEMIOLOGICAL_DATA.PUBLIC.CDC_TESTING

),

cases as(
    select
        COUNTRY_REGION,
        PROVINCE_STATE,
        to_date(replace(DATE, 'T00:00:00', ''),'YYYY-MM-DD HH24:MI:SS.FF3') as DATE,
        COALESCE(POSITIVE, 0) as POSITIVE,
        COALESCE(NEGATIVE, 0) as NEGATIVE,
        COALESCE(INCONCLUSIVE, 0) as INCONCLUSIVE
    from customers
),

final as (

    SELECT 
        cases.COUNTRY_REGION, 
        cases.PROVINCE_STATE, 
        cases.DATE, 
        cases.POSITIVE, 
        cases.NEGATIVE, 
        cases.INCONCLUSIVE
    FROM cases
    GROUP BY  COUNTRY_REGION, PROVINCE_STATE, DATE, POSITIVE, NEGATIVE, INCONCLUSIVE
    -- HAVING COUNT(*) > 1
    
)

select * from final
