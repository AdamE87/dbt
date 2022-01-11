with payments as(
    select 
        id as payment_id,
        orderid as order_id,
        status,
        {{ cents_to_dollars('amount') }} as amount,
        created as created_at,
        paymentmethod
    from 
        {{ source('stripe','payment')}}
)
select * from payments