-- Merge Batter ZIPS and STEAMER projections


truncate table rotowire_lineups.batter_projections_merged;

insert into rotowire_lineups.batter_projections_merged
select active_line_id,
name,
player_id,
round(coalesce((s_pa + z_pa)/2, s_pa, z_pa)),
round(coalesce((`s_wrc+` + `z_wrc+`)/2, `s_wrc+`, `z_wrc+`)),
coalesce((s_avg + z_avg)/2, s_avg, z_avg),
coalesce((s_babip + z_babip)/2, s_babip, z_babip),
coalesce((s_obp + z_obp)/2, s_obp, z_obp),
coalesce((s_bsr + z_bsr)/2, s_bsr, z_bsr),
coalesce((s_slg + z_slg)/2, s_slg, z_slg),
coalesce((s_iso + z_iso)/2, s_iso, z_iso),
coalesce((s_kk_pct + z_kk_pct)/2, s_kk_pct, z_kk_pct),
coalesce((s_bb_pct + z_bb_pct)/2, s_bb_pct, z_bb_pct)
from rotowire_lineups.batter_projections;


