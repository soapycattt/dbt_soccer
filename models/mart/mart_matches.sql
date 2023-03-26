{{
  config(
    materialized="table",
    alias = "matches"
  )
}}


select 
  home
  , away
  
  , fulltime_home_score
  , fulltime_away_score
  , hafltime_home_score
  , hafltime_away_score
  
  , match_date
  , fulltime
  , halftime
  , country_code
  , country
  , tier

  , case 
      when fulltime_home_score > fulltime_away_score then home
      when fulltime_home_score < fulltime_away_score then away
      else Null
    end as winner
  , case 
      when fulltime_home_score < fulltime_away_score then home
      when fulltime_home_score < fulltime_away_score then away
      else Null
    end as loser
  , case
      when hafltime_home_score > hafltime_away_score then home
      when hafltime_home_score < hafltime_away_score then away
      when hafltime_home_score = hafltime_away_score then "Drew"
      else Null
    end as halftime_lead

from {{ ref('int_matches') }} matches