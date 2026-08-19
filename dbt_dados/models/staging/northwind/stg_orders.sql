with cte_orders as (
    Select
        order_id,
        customer_id,
        employee_id,
        order_date,
        required_date,
        shipped_date,
        ship_via,
        freight,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country,
        case
            when
                shipped_date is null then 'Pedido Pendente'
            else
                'Pedido Enviado'
        end as status_pedido
    from {{source('northwind','orders')}}
)


Select 
    *
From cte_orders