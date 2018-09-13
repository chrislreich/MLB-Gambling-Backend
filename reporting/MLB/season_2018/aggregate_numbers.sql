BEGIN;
	TRUNCATE TABLE mlb_reporting.running_total_2018;
	TRUNCATE TABLE mlb_reporting.rollup_2018;

	SET @runtot:=0;

	INSERT INTO mlb_reporting.running_total_2018
	SELECT q1.d, q1.c, (@runtot := @runtot + q1.c) AS rt
	FROM (SELECT game_date AS d, SUM(net) AS c FROM mlb_reporting.season_2018 GROUP BY d ORDER BY d) AS q1
	;

	INSERT INTO mlb_reporting.rollup_2018
	SELECT q1.wins, q2.losses, q3.average_clv, q4.away_count, q5.home_count, q6.favorite_count, q7.dog_count, q8.average_line
	FROM (SELECT COUNT(win) AS wins FROM mlb_reporting.season_2018 WHERE win = 1) q1,
	(SELECT COUNT(win) AS losses FROM mlb_reporting.season_2018 WHERE win = -1) q2,
	(SELECT AVG(clv) AS average_clv FROM mlb_reporting.season_2018) q3,
	(SELECT COUNT(*) AS away_count FROM mlb_reporting.season_2018 WHERE home = 1) q4,
	(SELECT COUNT(*) AS home_count FROM mlb_reporting.season_2018 WHERE home = 2) q5,
	(SELECT COUNT(*) AS favorite_count FROM mlb_reporting.season_2018 WHERE odds < 0) q6,
	(SELECT COUNT(*) AS dog_count FROM mlb_reporting.season_2018 WHERE odds > 0) q7,
	(SELECT AVG(num) AS average_line FROM (SELECT CASE WHEN odds < 0 then odds + 100 else odds - 100 end as num from mlb_reporting.season_2018) a) q8
	;

COMMIT;
