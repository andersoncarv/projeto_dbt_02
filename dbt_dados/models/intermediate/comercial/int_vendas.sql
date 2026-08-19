
{{
    config(
        tags=['comercial']
    )
}}

with cte_vendas as (
    Select
        extract(month from order_date) as mes,
        extract(year  from order_date) as ano,
        concat(extract(year  from order_date),'-',extract(month from order_date)) as ano_mes,
        freight as total_frete
    From {{ref('stg_orders')}}
),

cte_vendas_agrupadas as (
    Select
        mes,
        ano,
        ano_mes,
        sum(total_frete) as total_frete
    from cte_vendas
    group by
        mes,
        ano,
        ano_mes

)


Select * from cte_vendas_agrupadas