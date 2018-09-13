truncate table mlb_players.zips_ros_current;

insert into mlb_players.zips_ros_current (
  `name` ,
  `team` ,
  `games` ,
  `pa` ,
  `ab` ,
  `h` ,
  `2b` ,
  `3b` ,
  `hr` ,
  `r` ,
  `rbi` ,
  `bb` ,
  `so` ,
  `hbp` ,
  `sb` ,
  `cs` ,
  `avg` ,
  `obp` ,
  `slg` ,
  `ops` ,
  `woba` ,
  `fld` ,
  `bsr` ,
  `war` ,
  `player_id`
)
  select * from mlb_players.zips_ros_load;
