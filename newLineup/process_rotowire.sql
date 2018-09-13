insert into rotowire_lineups.historic_lineups
  select * from rotowire_lineups.lineups_today
  where dateOf < curdate();



delete from rotowire_lineups.lineups_today
  where dateOf < curdate();


update rotowire_lineups.lineups_today lt, rotowire_lineups.lineups_today_load ltl
  set lt.away_lineup = ltl.away_lineup,
      lt.home_lineup = ltl.home_lineup,
      lt.away_pitcher = ltl.away_pitcher,
      lt.home_pitcher = ltl.home_pitcher
  where lt.dateOf = ltl.dateOf
  and (lt.away_pitcher = ltl.away_pitcher or lt.home_pitcher = ltl.home_pitcher)
  and lt.away = ltl.away
  and lt.home = ltl.home;


insert into rotowire_lineups.lineups_today (dateOf, away, away_pitcher, away_lineup, home, home_pitcher, home_lineup)
  select * from rotowire_lineups.lineups_today_load ltl
  where not exists (select 'x' from rotowire_lineups.lineups_today lt
                    where ltl.dateOf = lt.dateOf and (ltl.away_pitcher = lt.away_pitcher or ltl.home_pitcher = lt.home_pitcher) and ltl.away = lt.away and ltl.home = lt.home);


update rotowire_lineups.lineups_today lt
  set lt.active_line_id = (select id from MLBLines.active_lines al
                            where lt.dateOf = al.dateOfGame
                            and (
                              lt.away_pitcher like concat('%',substring_index(substring_index(al.h1_starter, ' -', 1), '. ', -1 ), '%') or lt.home_pitcher like concat('%',substring_index(substring_index(al.h2_starter, ' -', 1), '. ', -1 ), '%'))
                            and al.h1_name =  lt.away
                            and al.h2_name = lt.home
                          )
 where lt.active_line_id is null;
