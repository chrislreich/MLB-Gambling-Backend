truncate table bpro_defense.2017_pade_today_export;


insert into bpro_defense.2017_pade_today_export
  select pt.team,
  pt.pade,
  pt.date,
  dt.team,
  @curRank := @curRank + 1 as rank
from bpro_defense.2017_pade_today pt
join bpro_defense.teams dt on (dt.tla = pt.team)
, (select @curRank := 0) r;
