with payments as(
    select * from {{ ref('stg_payments') }}
),

pivoted as (
    select
        order_id,
        sum(case when paymentmethod = 'bank_transfer' then amount else 0 end) as bank_transfer_amount
    from 
        payments
    where
        status='success'
    group by 1
)

select * from pivoted