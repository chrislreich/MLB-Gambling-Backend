truncate table mlb_reporting.season_2018_load;


insert into mlb_reporting.season_2018_load
  select hw.ticket as ticket,
  hw.accepted as time_accepted,
  hl.dateOfGame as game_time,
  hw.game_number as team_game_number,
  hw.team as team,
  case
    when hw.home = 1 then hl.h2_name
    else hl.h1_name
  end as opponent,
  case
    when hw.home = 1 then hl.h1_starter
    else hl.h2_starter
  end as starter,
  case
    when hw.home = 1 then hl.h2_starter
    else hl.h1_starter
  end as opponent_starter,
  hw.risk as risk,
  hw.reward as reward,
  hw.odds as odds,
  case
    when hw.home = 1 then mr.h1_line
    else mr.h2_line
  end as closing_line,
  case
    when hw.home = 1 then case when hw.odds > 0 then hw.odds - 100 else hw.odds + 100 end - case when mr.h1_line > 0 then mr.h1_line - 100 else mr.h1_line + 100 end
    else case when hw.odds > 0 then hw.odds - 100 else hw.odds + 100 end - case when mr.h2_line > 0 then mr.h2_line - 100 else mr.h2_line + 100 end
 end as clv,
  case
    when hw.outcome = "Win" then 1
    when hw.outcome = "Loss" then -1
    else 0
  end as win,
  hw.net as net,
  hw.home as home,
  hw.active_line_id as active_line_id
  from wagers.historic_wagers hw
  join MLBLines.historic_lines hl on (hl.id = hw.active_line_id)
  join MLBLines.most_recent mr on (mr.id = hl.id)
  where hw.sport = 'Baseball'
  and year(hw.accepted) = 2018;



insert into mlb_reporting.season_2018
  select * from mlb_reporting.season_2018_load sl
  where sl.ticket not in (select ticket from mlb_reporting.season_2018);
