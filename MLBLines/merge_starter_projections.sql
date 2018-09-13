-- Merge Starting Pitcher ZIPS and STEAMER Projections

truncate table rotowire_lineups.starter_projections_merged;

insert into rotowire_lineups.starter_projections_merged
select active_line_id,
name,
player_id,
round(coalesce((s_g + z_g)/2, s_g, z_g)),
round(coalesce((s_gs + z_gs)/2, s_gs, z_gs)),
round(coalesce((s_ip + z_ip)/2, s_ip, z_ip)),
coalesce((s_fip + z_fip)/2, s_fip, z_fip),
coalesce((s_k_9 + z_k_9)/2, s_k_9, z_k_9),
coalesce((s_bb_9 + z_bb_9)/2, s_bb_9, z_bb_9),
coalesce((s_hr_9 + z_hr_9)/2, s_hr_9, z_hr_9)
from rotowire_lineups.starter_projections;
