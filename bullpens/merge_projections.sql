truncate table mlb_bullpens.bullpen_projections_merged;

insert into mlb_bullpens.bullpen_projections_merged
select team,
name,
player_id,
s_g,
s_gs,
s_ip,
coalesce((z_fip + s_fip)/2, s_fip, z_fip),
coalesce((s_k_9 + z_k_9)/2, s_k_9, z_k_9),
coalesce((s_bb_9 + z_bb_9)/2, s_bb_9, z_bb_9),
coalesce((s_hr_9 + z_hr_9)/2, s_hr_9, z_hr_9)
from mlb_bullpens.bullpen_projections;
