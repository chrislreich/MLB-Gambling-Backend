truncate table mlb_players.fangraphs_pitching_advanced_current;

insert into mlb_players.fangraphs_pitching_advanced_current
  select * from mlb_players.fangraphs_pitching_advanced_load;
