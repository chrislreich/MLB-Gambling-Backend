truncate table mlb_players.steamer_ros_batter_current;


insert into mlb_players.steamer_ros_batter_current (
  `name`,
 `team`,
 `g` ,
 `pa`,
 `ab` ,
 `h`,
 `2b`,
 `3b` ,
 `hr` ,
 `r` ,
 `rbi` ,
 `bb`,
 `so` ,
 `hbp` ,
 `sb` ,
 `cs` ,
 `unknown_1` ,
 `avg` ,
 `obp`,
 `slg` ,
 `ops` ,
 `woba` ,
 `unknown_2` ,
 `wrc+` ,
 `bsr` ,
 `fld` ,
 `unknown_3` ,
 `off` ,
 `def` ,
 `war` ,
 `player_id`
)
select * from mlb_players.steamer_ros_batter_load;
