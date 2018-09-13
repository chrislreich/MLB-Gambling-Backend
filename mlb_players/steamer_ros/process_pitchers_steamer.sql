truncate table mlb_players.steamer_ros_pitchers_current;

insert into mlb_players.steamer_ros_pitchers_current
  select * from mlb_players.steamer_ros_pitchers_load;
