BEGIN;
	INSERT INTO MLBLines.line_movement
	SELECT *
	FROM MLBLines.line_movement_load lml
	;
COMMIT;

BEGIN;
	INSERT INTO MLBLines.line_movement_cleaned
	SELECT *
	FROM MLBLines.line_movement_load lml
	WHERE lml.h2_line <> (SELECT h2_line FROM MLBLines.line_movement_cleaned lmc2 where lmc2.id = lml.id ORDER BY tstamp DESC LIMIT 1)
	OR 0 = (SELECT COUNT(*) FROM MLBLines.line_movement_cleaned lmc3 WHERE lmc3.id = lml.id) 
	;
COMMIT;

BEGIN;
	TRUNCATE TABLE MLBLines.line_movement_network;

	INSERT INTO MLBLines.line_movement_network
	SELECT id, tstamp, CASE WHEN h2_line > 0 THEN h2_line - 100 ELSE h2_line + 100 END AS home_line
	FROM MLBLines.line_movement_cleaned
	;
COMMIT;


BEGIN;
	UPDATE MLBLines.most_recent mr, MLBLines.line_movement_load lml
	SET mr.tstamp = lml.tstamp,
        mr.h1_line = lml.h1_line,
        mr.h2_line = lml.h2_line
        WHERE mr.id = lml.id
	;

	INSERT INTO MLBLines.most_recent
	SELECT *
	FROM MLBLines.line_movement_load lml
	WHERE NOT EXISTS (SELECT 'x' FROM MLBLines.most_recent mr WHERE mr.id = lml.id)
	;	

COMMIT;


begin;
truncate table MLBLines.historic_lines_load;

-- Move lines that are no longer active to historic
insert into MLBLines.historic_lines_load
  select * from MLBLines.active_lines al
  where al.id not in (select id from MLBLines.active_lines_load);

-- delete lines that are no longer active
delete from MLBLines.active_lines
  where id not in (select id from MLBLines.active_lines_load);


-- update active lines
update MLBLines.active_lines al, MLBLines.active_lines_load lal
  set al.timeOfGame = lal.timeOfGame,
      al.last_updated = lal.last_updated,
      al.h1_line = lal.h1_line,
      al.h2_line = lal.h2_line,
      al.h1_starter = lal.h1_starter,
      al.h2_starter = lal.h2_starter,
      al.h1_name = lal.h1_name,
      al.h2_name = lal.h2_name
  where al.id = lal.id;

-- Insert new lines not previously active
insert into MLBLines.active_lines
  select * from MLBLines.active_lines_load lal
  where lal.id not in (select id from MLBLines.active_lines);


-- update any lines that were previously inserted into historic table
-- but were re-activated for any reason
update MLBLines.historic_lines hl, MLBLines.historic_lines_load lhl
  set hl.timeOfGame = lhl.timeOfGame,
      hl.last_updated = lhl.last_updated,
      hl.h1_final_line = lhl.h1_final_line,
      hl.h2_final_line = lhl.h2_final_line,
      hl.h1_starter = lhl.h1_starter,
      hl.h2_starter = lhl.h2_starter
  where hl.id = lhl.id;


-- Insert newly historic lines
insert into MLBLines.historic_lines
  select * from MLBLines.historic_lines_load lhl
  where lhl.id not in (select id from MLBLines.historic_lines);


commit;

	

