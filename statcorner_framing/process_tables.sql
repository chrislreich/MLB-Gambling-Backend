BEGIN;
	insert into bpro_defense.2017_statcorner_framing_historic
  select curdate() as day,
  f.name,
  f.team,
  f.sample,
  f.zball,
  f.ostr,
  f.calls,
  f.per_game,
  f.raa
from bpro_defense.2017_statcorner_framing f
 where not exists (select 'x' from bpro_defense.2017_statcorner_framing_historic h where h.day = curdate() and h.name = f.name);


truncate table bpro_defense.2017_statcorner_framing;


insert into bpro_defense.2017_statcorner_framing
  select * from bpro_defense.2017_statcorner_framing_load;
COMMIT;
