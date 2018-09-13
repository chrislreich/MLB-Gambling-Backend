-- Truncate and insert Current Season Batter stats

truncate table rotowire_lineups.batter_stats;

insert into rotowire_lineups.batter_stats
select p.active_line_id,
p.display_name,
f.pa,
f.wrc_plus,
f.avg,
f.babip,
f.obp,
f.bsr,
f.slg,
f.iso,
f.so_pct,
f.bb_pct,
f.player_id
from rotowire_lineups.batter_player_ids p
join mlb_players.fangraphs_batting_stats_current f on (f.player_id = CAST(p.stats_id as UNSIGNED));

-- Truncate and insert Zips first, then Steamer

truncate table rotowire_lineups.batter_projections;

insert into rotowire_lineups.batter_projections
select p.active_line_id,
p.display_name,
z.pa,
z.`wrc+`,
z.avg,
z.babip,
z.obp,
z.bsr,
z.slg,
z.iso,
z.kk_pct,
z.bb_pct,
s.pa,
s.`wrc+`,
s.avg,
s.babip,
s.obp,
s.bsr,
s.slg,
s.iso,
s.kk_pt,
s.bb_pct,
s.player_id
from rotowire_lineups.batter_player_ids p
left join mlb_players.zips_ros_current z on (z.player_id = CAST(p.zips_id as UNSIGNED))
left join mlb_players.steamer_ros_batter_current s on (s.player_id = p.steamer_id);
