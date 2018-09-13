'use strict'

const mysql = require('mysql');
const express = require('express');
const app = express();
const port = 3000;
//var http = require('http');
//var https = require('https');
//var fs = require('fs');
var Regex = require('regex');

//app.set('trust proxy', true);
//app.set('trust proxy', 'loopback');
app.disable('x-powered-by');


const todaySecondsOffset = 14400000
const yesterdaySecondsOffset = 100800000


function validateGameId(gameId) {
	for (var x = 0; x < gameId.length; x++)
	{
		var c = gameId.charCodeAt(x);
		if (c < 48 || c > 57)
		{
			return false
		}
	}
	return true
}


function teamNameAcrossNetwork(str) {
  var splArr = str.split("_");

  var len = splArr.length;

  var i = 0;
  var resStr = "";

  while (i < len) {
    if (i == len - 1) {
      resStr += splArr[i];
    }
    else {
      resStr += splArr[i] + " ";
    }

    i += 1;
  }

  return resStr;
}



function makeDateStr(date) {
  var day = date.getDate();
  var month = date.getMonth() + 1;
  var year = date.getFullYear();

  if (day < 10) {
    day = "0" + String(day);
  }

  if (month < 10) {
    month = "0" + String(month);
  }

  var retStr = year + "-" + month + "-" + day;

  return retStr;

}




var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'creich',
  password : '',
  database : 'MLBLines',
  multipleStatements: true,
});

connection.connect()

app.get('/mlb/active_lines', (request, response) => {

  connection.query("select al.*, pw.team, pw.odds from MLBLines.active_lines al left outer join wagers.pending_wagers pw on (al.id = pw.active_line_id) order by al.dateOfGame asc, al.timeOfGame asc", function (error, results, fields) {
    if (error) throw error;

    console.log(response)	  
    response.send(results)

});

})

app.get('/reporting/mlb/today', (request, response) => {
    var oldDate = new Date();

    var newDate = new Date(oldDate.getTime() - todaySecondsOffset);
    var dateStr = makeDateStr(newDate);

    var q1 = "select * from mlb_reporting.season_2018 where game_date = \'" + dateStr +"\';"
    var q2 = 'select p.ticket,  p.home as home_flag, p.odds, l.away, l.away_pitcher, l.home, l.home_pitcher from wagers.pending_wagers p join rotowire_lineups.lineups_today l on (p.active_line_id = l.active_line_id) where sport = \'Baseball\';';

    connection.query(q1 + q2, function (error, results, fields) {
      if (error) throw error;
      response.send(results)
    });
})

app.get('/reporting/mlb/yesterday', (request, response) => {
  var oldDate = new Date();

  var newDate = new Date(oldDate.getTime() - yesterdaySecondsOffset);
  var dateStr = makeDateStr(newDate);

  var q1 = 'select * from mlb_reporting.season_2018 where game_date = \'' + dateStr + "\';";


  var selectStmt = q1;
  console.log(selectStmt)

  connection.query(selectStmt, function (error, results, fields) {
    if (error) throw error;
    response.send(results)
  });
})


app.get('/reporting/all_pending', (request, response) => {

  connection.query("select * from wagers.pending_wagers order by sport, accepted", function (error, results, fields) {
    if (error) throw error;
    console.log(results[0]);
    response.send(results)
  });
})

app.get('/reporting/mlb', (request, response) => {
  var q2 = "set @runtot:=0; SELECT q1.d, q1.c, (@runtot := @runtot + q1.c) AS rt FROM (SELECT game_date AS d, sum(net) AS c FROM  mlb_reporting.season_2018 GROUP  BY d ORDER  BY d) AS q1;"
  var q3 = "select count(win) from mlb_reporting.season_2018 where win = 1;"
  var q4 = "select count(win) from mlb_reporting.season_2018 where win = -1;"
  var q5 = "select avg(clv) from mlb_reporting.season_2018;"
  var q6 = "select count(*) as away from mlb_reporting.season_2018 where home = 1;"
  var q7 = "select count(*) as home from mlb_reporting.season_2018 where home = 2;"
  var q8 = "select count(*) as favs from mlb_reporting.season_2018 where odds < 0;"
  var q9 = "select count(*) as dogs from mlb_reporting.season_2018 where odds > 0;"
  var q10 = "select avg(num) from (select case when odds < 0 then odds + 100 else odds - 100 end as num from mlb_reporting.season_2018) a;"
  connection.query(q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10, function (error, results, fields) {
    if (error) throw error;

    response.send(results)
  });
})

app.get('/reporting/mlb/2018', (request, response) => {
	var q1 = "select * from mlb_reporting.running_total_2018;"
	var q2 = "select * from mlb_reporting.rollup_2018;"
	connection.query(q1+ q2, function (error, results, fields) {if (error) throw error; response.send(results)});	    
	
})

app.param('teamName', function(req, res, next, teamName) {

  var network_name = teamNameAcrossNetwork(teamName)

  var q1 = "select * from mlb_reporting.season_2018 where team = \'" + network_name + "\' order by game_date desc;";
  var q2 = "select starter, sum(net), avg(clv), avg(odds), count(*) from mlb_reporting.season_2018 where team = \'" + network_name + "\' group by 1 order by count(*) desc;";
  var q3 = "select count(win) from mlb_reporting.season_2018 where win = 1 and team = \'" + network_name + "\';"
  var q4 = "select count(win) from mlb_reporting.season_2018 where win = -1 and team = \'" + network_name + "\';"
  var q5 = "select avg(clv) from mlb_reporting.season_2018 where team = \'" + network_name + "\';"
  var q6 = "select count(*) as away from mlb_reporting.season_2018 where home = 1 and team = \'" + network_name + "\';"
  var q7 = "select count(*) as home from mlb_reporting.season_2018 where home = 2 and team = \'" + network_name + "\';"
  var q8 = "select count(*) as favs from mlb_reporting.season_2018 where odds < 0 and team = \'" + network_name + "\';"
  var q9 = "select count(*) as dogs from mlb_reporting.season_2018 where odds > 0 and team = \'" + network_name + "\';"
  var q10 = "select avg(num) as av from (select case when odds < 0 then odds + 100 else odds - 100 end as num from mlb_reporting.season_2018 where team = \'" + network_name + "\') a;"
  var q11 = "select sum(net) from mlb_reporting.season_2018 where team = \'" + network_name + "\';"
  connection.query(q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10 + q11, function (error, results, fields) {
    if (error) throw error;
    res.send(results)
  })

  next();

});

app.get('/reporting/mlb/byTeam/:teamName', (req, res) => {

})

app.param('id', function (req, res, next, id) {
  var gameId = String(id)
  if (!validateGameId(gameId)) {
	  res.send({})
	  return
  }
  var q1 = "select away_lineup,home_lineup from rotowire_lineups.lineups_today where active_line_id = " + gameId + ";";
  var q2 = "select h1_line as away_opening, h2_line as home_opening from MLBLines.mlb_" + gameId + " where tstamp = (select min(tstamp) from MLBLines.mlb_" + gameId + ");";
  var q3 = "select h1_line as away_now, h2_line as home_now from MLBLines.mlb_" + gameId + " where tstamp = (select max(tstamp) from MLBLines.mlb_" + gameId + ");";
  var q4 = 'select u.* from mlb_bullpens.usage u, MLBLines.active_lines al where al.h1_name = u.team and al.id =' + gameId + ";";
  var q5 = 'select u.* from mlb_bullpens.usage u, MLBLines.active_lines al where al.h2_name = u.team and al.id =' + gameId + ";";
  var q6 = "select * from mlb_bullpens.date_info;"
  var q7 = "select h1_line, h2_line, tstamp from MLBLines.mlb_" + gameId + " order by tstamp asc;"
  var q8 = "select accepted from wagers.pending_wagers where active_line_id = " + gameId + ";"
  var q9 = "select derived_team_name, rank, pade from bpro_defense.2017_pade_today_export exp join MLBLines.active_lines al on (exp.derived_team_name = al.h1_name or exp.derived_team_name = al.h2_name) where al.id =" + gameId + ";";
  var q10 = "select name, team, sample, per_game from bpro_defense.2017_statcorner_framing cf join MLBLines.active_lines al on (al.h1_name like concat('%',cf.team,'%') or al.h2_name like concat('%',cf.team,'%')) where al.id =" + gameId + " order by team, per_game desc;";
  var q11 = "select * from rotowire_lineups.batter_stats where active_line_id =" + gameId + ";";
  var q12 = "select * from rotowire_lineups.batter_projections_merged where active_line_id = " + gameId + ";";
  var q13 = "select * from rotowire_lineups.starter_stats where active_line_id = " + gameId + ";";
  var q14 = "select * from rotowire_lineups.starter_projections_merged where active_line_id = " + gameId + ";";
  var q15 = "select b.* from mlb_bullpens.bullpen_stats b, MLBLines.active_lines al where (al.h1_name = b.team or al.h2_name = b.team) and al.id = " + gameId + ";";
  var q16 = "select b.* from mlb_bullpens.bullpen_projections_merged b, MLBLines.active_lines al where (al.h1_name = b.team or al.h2_name = b.team) and al.id = " + gameId + ";"; 
  var totalStr = q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10 + q11 + q12 + q13 + q14 + q15 + q16;
  connection.query(totalStr, function (error, results, fields) {
    if (error) throw error;

    var lineResult = results[6];
    var cleanedLineMovement = [];
    var len = lineResult.length;
    var tempLine = 1000000;

    for (var i = 0; i < len; i++) {
      var linePoint = lineResult[i];
      var line;
      if (linePoint.h2_line < 0) {
        line = linePoint.h2_line + 100;
      }
      else {
        line = linePoint.h2_line - 100;
      }
      if (line == tempLine && i != len - 1) continue;
      else {
        var tempArr = {"date": linePoint.tstamp, "value":line};
        cleanedLineMovement.push(tempArr);
        tempLine = line;
      }
    }

    results[6] = cleanedLineMovement;
    res.send(results)

})
  next();
});

app.get('/mlb/:id', (req, res) => {

})


app.param('game_id', function (req, res, next, game_id) {
  var game_id = String(game_id)
  if (!validateGameId(game_id)) {
	  res.send({})
	  return
  }
  var q1 = "select away_lineup,home_lineup from rotowire_lineups.lineups_today where active_line_id = " + game_id + ";";
  var q2 = "select h1_line as away_opening, h2_line as home_opening from MLBLines.line_movement_cleaned where id = " + game_id + " LIMIT 1;"
  var q3 = "select h1_line as away_now, h2_line as home_now from MLBLines.line_movement_cleaned where id = " + game_id + " ORDER BY tstamp DESC LIMIT 1;" 
  var q4 = 'select u.* from mlb_bullpens.usage u, MLBLines.active_lines al where al.h1_name = u.team and al.id =' + game_id + ";";
  var q5 = 'select u.* from mlb_bullpens.usage u, MLBLines.active_lines al where al.h2_name = u.team and al.id =' + game_id + ";";
  var q6 = "select * from mlb_bullpens.date_info;"
  var q7 = "select tstamp, home_line from MLBLines.line_movement_network where id = " + game_id + " ;"
  var q8 = "select accepted from wagers.pending_wagers where active_line_id = " + game_id + ";"
  var q9 = "select derived_team_name, rank, pade from bpro_defense.2017_pade_today_export exp join MLBLines.active_lines al on (exp.derived_team_name = al.h1_name or exp.derived_team_name = al.h2_name) where al.id =" + game_id + ";";
  var q10 = "select name, team, sample, per_game from bpro_defense.2017_statcorner_framing cf join MLBLines.active_lines al on (al.h1_name like concat('%',cf.team,'%') or al.h2_name like concat('%',cf.team,'%')) where al.id =" + game_id + " order by team, per_game desc;";
  var q11 = "select * from rotowire_lineups.batter_stats where active_line_id =" + game_id + ";";
  var q12 = "select * from rotowire_lineups.batter_projections_merged where active_line_id = " + game_id + ";";
  var q13 = "select * from rotowire_lineups.starter_stats where active_line_id = " + game_id + ";";
  var q14 = "select * from rotowire_lineups.starter_projections_merged where active_line_id = " + game_id + ";";
  var q15 = "select b.* from mlb_bullpens.bullpen_stats b, MLBLines.active_lines al where (al.h1_name = b.team or al.h2_name = b.team) and al.id = " + game_id + ";";
  var q16 = "select b.* from mlb_bullpens.bullpen_projections_merged b, MLBLines.active_lines al where (al.h1_name = b.team or al.h2_name = b.team) and al.id = " + game_id + ";"; 
  var totalStr = q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10 + q11 + q12 + q13 + q14 + q15 + q16;
  connection.query(totalStr, function (error, results, fields) {
    if (error) throw error;
    res.send(results)
    }
  )
  next();
});

app.get('/mlb/games/:game_id', (req, res) => {

})

app.get('/reporting/mlb/2017', (req, res) => {
  var q2 = "set @runtot:=0; SELECT q1.d, q1.c, (@runtot := @runtot + q1.c) AS rt FROM (SELECT game_date AS d, sum(net) AS c FROM  mlb_reporting.season_2017 GROUP  BY d ORDER  BY d) AS q1;"
  var q3 = "select count(win) from mlb_reporting.season_2017 where win = 1;"
  var q4 = "select count(win) from mlb_reporting.season_2017 where win = -1;"
  var q5 = "select avg(clv) from mlb_reporting.season_2017;"
  var q6 = "select count(*) as away from mlb_reporting.season_2017 where home = 1;"
  var q7 = "select count(*) as home from mlb_reporting.season_2017 where home = 2;"
  var q8 = "select count(*) as favs from mlb_reporting.season_2017 where odds < 0;"
  var q9 = "select count(*) as dogs from mlb_reporting.season_2017 where odds > 0;"
  var q10 = "select avg(num) from (select case when odds < 0 then odds + 100 else odds - 100 end as num from mlb_reporting.season_2017) a;"
  connection.query(q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10, function (error, results, fields) {
    if (error) throw error;

    res.send(results)
  })
})

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
