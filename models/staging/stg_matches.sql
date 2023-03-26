{{
  config(
    materialized="view",
    alias = "matches"
  )
}}

select 
  match_date
  , team_1 as home
  , team_2 as away
  , fulltime
  , halftime
  , country_code
  , tier
from {{ source('src_eu_football', 'matches')}}



