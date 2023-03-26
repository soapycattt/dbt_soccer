{{
  config(
    materialized="view",
    alias = "transfers"
  )
}}

select *
from {{ source('src_eu_football', 'transfers')}}



