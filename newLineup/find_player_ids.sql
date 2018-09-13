-- -----------------------------------------------------------
-- ------ BATTER SECTION--------------------------------------
-- -----------------------------------------------------------

-- First match name and team for current season stats, Zips ROS, and Steamer Ros IDs

update rotowire_lineups.batter_player_ids b, mlb_players.fangraphs_batting_stats_current f, rotowire_lineups.team_name_mapping m set b.stats_id = f.player_id where f.name like concat('%', b.name, '%') and b.team = m.lineup_name and m.fangraphs_name = f.team;

update rotowire_lineups.batter_player_ids b, mlb_players.zips_ros_current f, rotowire_lineups.team_name_mapping m set b.zips_id = f.player_id where f.name like concat('%', b.name, '%') and b.team = m.lineup_name and m.fangraphs_name = f.team;


update rotowire_lineups.batter_player_ids b, mlb_players.steamer_ros_batter_current f, rotowire_lineups.team_name_mapping m set b.steamer_id = f.player_id where f.name like concat('%', b.name, '%') and b.team = m.lineup_name and m.fangraphs_name = f.team;


-- Now check try to match orphans for each ID because of Team Change


update rotowire_lineups.batter_player_ids b, mlb_players.fangraphs_batting_stats_current f, rotowire_lineups.team_name_mapping m set b.stats_id = f.player_id where f.name like concat('%', b.name, '%') and b.stats_id is null and f.team = '- - -';


update rotowire_lineups.batter_player_ids b, mlb_players.zips_ros_current f, rotowire_lineups.team_name_mapping m set b.zips_id = f.player_id where f.name like concat('%', b.name, '%') and b.zips_id is null and f.team = '';


update rotowire_lineups.batter_player_ids b, mlb_players.steamer_ros_batter_current f, rotowire_lineups.team_name_mapping m set b.steamer_id = f.player_id where f.name like concat('%', b.name, '%') and b.steamer_id is null and f.team = '';





