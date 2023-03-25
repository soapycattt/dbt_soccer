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
  , split(fulltime, "-")[safe_offset(0)] as fulltime_home_goals
  , split(fulltime, "-")[safe_offset(1)] as fulltime_away_goals
  , halftime
  , split(halftime, "-")[safe_offset(0)] as hafltime_home_goals
  , split(halftime, "-")[safe_offset(1)] as hafltime_away_goals
  , country_code
  , tier
from {{ source('src_eu_football', 'matches')}}



