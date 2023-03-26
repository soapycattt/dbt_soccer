{{
  config(
    materialized="table",
    alias = "transfers"
  )
}}

select *
from {{ ref('int_transfers') }}