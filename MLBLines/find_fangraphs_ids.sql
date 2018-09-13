-- --------------------------------------------------------------------------
-- -------- STARTING PITCHER SECTION ----------------------------------------
-- --------------------------------------------------------------------------


-- Match on name and team to find IDs for in-season, Zips ROS and Steamer ROS

update rotowire_lineups.starter_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;


update rotowire_lineups.starter_player_ids p, mlb_players.zips_pitchers_ros_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;



update rotowire_lineups.starter_player_ids p, mlb_players.steamer_ros_pitchers_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;





-- Now try to match orphans because we couldn't match on team

update rotowire_lineups.starter_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  f.name like concat('%', p.name, '%') and p.stats_id is null and f.team = '- - - ';


update rotowire_lineups.starter_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  f.name like concat('%', p.name, '%') and p.zips_id is null and f.team = '';

update rotowire_lineups.starter_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  f.name like concat('%', p.name, '%') and p.steamer_id is null and f.team = '';
