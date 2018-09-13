truncate table mlb_bullpens.bullpen_stats;

insert into mlb_bullpens.bullpen_stats
select p.team,
p.display_name,
s.games,
s.started,
s.innings,
s.era,
a.fip,
a.siera,
a.`k/9`,
a.`bb/9`,
a.`hr/9`,
s.gb_pct,
a.babip,
s.`hr/fb`,
a.k_pct,
a.bb_pct,
s.player_id
from mlb_bullpens.bullpen_player_ids p
join mlb_players.fangraphs_pitching_standard_current s on (s.player_id = CAST(p.stats_id as UNSIGNED))
join mlb_players.fangraphs_pitching_advanced_current a on (a.player_id = CAST(p.stats_id as UNSIGNED));



-- Truncate and insert bullpen projection numbers

truncate table mlb_bullpens.bullpen_projections;


insert into mlb_bullpens.bullpen_projections
select p.team,
p.display_name,
z.games,
z.started,
z.innings,
z.fip,
z.`k/9`,
z.`bb/9`,
(z.hr/z.innings) * 9.0,
s.games,
s.started,
s.innings,
s.fip,
s.`k/9`,
s.`bb/9`,
(s.hr/s.innings) * 9.0,
s.player_id
from mlb_bullpens.bullpen_player_ids  p
left join mlb_players.zips_pitchers_ros_current z on (z.player_id = CAST(p.zips_id as UNSIGNED))
left join mlb_players.steamer_ros_pitchers_current s on (s.player_id = p.steamer_id or trim(replace(s.player_id, '\n', '')) = p.steamer_id);
