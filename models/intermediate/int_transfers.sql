{{
  config(
    materialized="view",
    alias = "transfers"
  )
}}

select 
  club
  , name
  , age
  , nationality
  , position
   , case short_pos
      when "attack" then "SS"
      when "defense" then "CB"
      when "midfield" then "CM"
      else short_pos
    end as short_pos
  , market_value
  , dealing_club
  , dealing_country
  , fee
  , movement
  , `window` as transfer_window
  , league
  , season
  , is_loan
  , loan_status
 
  
from {{ ref('stg_transfers')}}



