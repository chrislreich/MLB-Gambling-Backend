truncate table mlb_players.fangraphs_batting_stats_current;

insert into mlb_players.fangraphs_batting_stats_current
  select * from mlb_players.fangraphs_batting_stats_load;
