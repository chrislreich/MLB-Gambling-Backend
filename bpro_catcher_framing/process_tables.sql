INSERT INTO bpro_catcher_framing.season_2018_historic
SELECT *
FROM bpro_catcher_framing.season_2018 s
WHERE NOT EXISTS (
	SELECT 'x'
	FROM bpro_catcher_framing.season_2018_historic h
	WHERE TO_DATE(h.dbdate) = CURDATE()
	AND h.name = s.name
)
;

TRUNCATE TABLE bpro_catcher_framing.season_2018;

INSERT INTO bpro_catcher_framing.season_2018
(name, framing_chances, csaa, csaa_sd, framing_runs, framing_runs_sd, blocking_chances, epaa, blocking_runs, steal_attemps, sraa, traa, throwing_runs, fraa_adj, fraa, dbdate)
SELECT *
FROM bpro_catcher_framing.season_2018_load;



