-- Match on name and team first to get Current Season, ZIPS ROS and STEAMER Ros


update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;


update mlb_bullpens.bullpen_player_ids p, mlb_players.zips_pitchers_ros_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;



update mlb_bullpens.bullpen_player_ids p, mlb_players.steamer_ros_pitchers_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  f.name like concat('%', p.name, '%') and p.team = m.lineup_name and m.fangraphs_name = f.team;




-- Now try to match orphans because we couldn't match on team


update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  f.name like concat('%', p.name, '%') and p.stats_id is null and f.team = '- - - ';


update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  f.name like concat('%', p.name, '%') and p.zips_id is null and f.team = '';

update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  f.name like concat('%', p.name, '%') and p.steamer_id is null and f.team = '';



-- Now remove periods for matching


update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  replace(f.name, '.','') like concat('%', replace(p.name, '.',''), '%') and p.stats_id is null;



update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  replace(f.name, '.', '') like concat('%', replace(p.name, '.', ''), '%') and p.zips_id is null;


update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  replace(f.name, '.','') like concat('%', replace(p.name, '.',''), '%') and p.steamer_id is null;


-- Now just match on last name



update mlb_bullpens.bullpen_player_ids p, mlb_players.fangraphs_pitching_standard_current f, rotowire_lineups.team_name_mapping m set p.stats_id = f.player_id where  f.name like concat('%', substring_index(p.name, ' ', -1), '%') and p.stats_id is null and  p.team = m.lineup_name and m.fangraphs_name = f.team;


update mlb_bullpens.bullpen_player_ids p, mlb_players.zips_pitchers_ros_current f, rotowire_lineups.team_name_mapping m set p.zips_id = f.player_id where  f.name like concat('%', substring_index(p.name, ' ', -1), '%') and p.zips_id is null and p.team = m.lineup_name and m.fangraphs_name = f.team;



update mlb_bullpens.bullpen_player_ids p, mlb_players.steamer_ros_pitchers_current f, rotowire_lineups.team_name_mapping m set p.steamer_id = f.player_id where  f.name like concat('%', substring_index(p.name, ' ',-1), '%') and p.steamer_id is null and p.team = m.lineup_name and m.fangraphs_name = f.team;
