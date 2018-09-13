truncate table mlb_players.zips_pitchers_ros_current;

insert into mlb_players.zips_pitchers_ros_current
  select * from mlb_players.zips_pitchers_ros_load;
