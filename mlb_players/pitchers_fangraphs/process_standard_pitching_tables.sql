truncate table mlb_players.fangraphs_pitching_standard_current;

insert into mlb_players.fangraphs_pitching_standard_current
  select * from mlb_players.fangraphs_pitching_standard_load;
