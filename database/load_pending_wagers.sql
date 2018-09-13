-- Create mapping table for GameIDs and Team Names
truncate table MLBLines.team_id_pairs;

insert into MLBLines.team_id_pairs
  select h1_id, h1_name, "1"
  from MLBLines.active_lines;

insert into MLBLines.team_id_pairs
  select h2_id, h2_name, "2"
  from MLBLines.active_lines;




truncate table wagers.historic_wagers_load;

-- Get all the tickets in pending_wagers that are no longer pending
-- And move them into historic_wagers_load

insert into wagers.historic_wagers_load (ticket, accepted, type, risk, reward, sport, game_number, team, wager, odds, over_under, competition, active_line_id, home)
  select * from wagers.pending_wagers
  where ticket not in (select ticket from wagers.pending_wagers_load);


insert into wagers.historic_wagers_middle
  select * from historic_wagers_load
  where ticket not in (select ticket from wagers.historic_wagers_middle);

-- Now delete the same wagers that were inserted above from the pending_wagers table

delete from wagers.pending_wagers where ticket not in (select ticket from wagers.pending_wagers_load);


-- Insert new tickets into pending_wagers table

insert into wagers.pending_wagers (ticket, accepted, type, risk, reward, sport, game_number, team, wager, odds, over_under, competition)
  select * from wagers.pending_wagers_load pwl
  where not exists (select 'x' from wagers.pending_wagers pw  where pw.ticket = pwl.ticket);

-- Find the foreign key from the active_lines table that exists in the MLBLines schema
-- and update newly inserted tickets

update wagers.pending_wagers pw
  set pw.active_line_id = (select id from MLBLines.active_lines al where pw.game_number = al.h1_id or pw.game_number = al.h2_id)
  where pw.active_line_id is null
  and pw.sport = 'Baseball';


  update wagers.pending_wagers pw
    set pw.active_line_id = (select id from MLBLines.historic_lines al
                            where (pw.game_number = al.h1_id or pw.game_number = al.h2_id)
                            and  now() < ADDTIME(al.last_updated, '05:00:00') 
		            order by created desc limit 1)
    where pw.active_line_id is null
    and pw.sport = 'Baseball';




-- Use the mapping table created at the top of the file to insert the team name for new tickets

update wagers.pending_wagers pw
  set pw.team = (select team_name from MLBLines.team_id_pairs p where pw.game_number = p.game_id)
  where pw.team is null
  and pw.sport = 'Baseball';


-- Use same mapping table to insert Home vs. Away

update wagers.pending_wagers pw
  set pw.home = (select home from MLBLines.team_id_pairs p where pw.game_number = p.game_id)
  where pw.home is null
  and pw.sport = 'Baseball';




truncate table MLBLines.team_id_pairs;

insert into MLBLines.team_id_pairs
  select distinct h1_id, h1_name, "1"
  from MLBLines.historic_lines hl
  where now() < ADDTIME(hl.last_updated, '05:00:00');

insert into MLBLines.team_id_pairs
  select distinct h2_id, h2_name, "2"
  from MLBLines.historic_lines hl
  where now() < ADDTIME(hl.last_updated, '05:00:00');




  update wagers.pending_wagers pw
    set pw.team = (select team_name from MLBLines.team_id_pairs p where pw.game_number = p.game_id)
    where pw.team is null
    and pw.sport = 'Baseball';


  -- Use same mapping table to insert Home vs. Away

  update wagers.pending_wagers pw
    set pw.home = (select home from MLBLines.team_id_pairs p where pw.game_number = p.game_id)
    where pw.home is null
    and pw.sport = 'Baseball';





-- Insert into graded_wages table

insert into wagers.graded_wagers
  select * from wagers.graded_wagers_load gwl
  where gwl.ticket not in (select ticket from wagers.graded_wagers);
