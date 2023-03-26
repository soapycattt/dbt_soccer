{{
  config(
    materialized="view",
    alias = "matches"
  )
}}

select 
  coalesce(home.club, matches.home) as home
  , coalesce(away.club, matches.away) as away
  
  , cast(split(matches.fulltime, "-")[safe_offset(0)] as integer) as fulltime_home_score
  , cast(split(matches.fulltime, "-")[safe_offset(1)] as integer) as fulltime_away_score
  , cast(split(matches.halftime, "-")[safe_offset(0)] as integer) as hafltime_home_score
  , cast(split(matches.halftime, "-")[safe_offset(1)] as integer) as hafltime_away_score
  
  , matches.match_date
  , matches.fulltime
  , matches.halftime
  , matches.country_code
  , matches.tier

  , country_code.country

from {{ ref('stg_matches') }} matches
left join {{ ref('club_codes') }} home on matches.home = home.code
left join {{ ref('club_codes') }} away on matches.away = away.code
left join {{ ref('country_codes')}} country_code on matches.country_code = country_code.code



