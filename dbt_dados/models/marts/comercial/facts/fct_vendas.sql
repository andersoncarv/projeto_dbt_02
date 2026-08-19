{{
    config(
        tags=['comercial']
    )
}}

with cte_vendas as (
  Select
    *
  From {{ref('int_vendas')}}
)

select * from cte_vendas

