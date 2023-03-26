{{
  config(
    materialized="table",
    alias = "clubs"
  )
}}

select *
from {{ ref('club_codes') }}