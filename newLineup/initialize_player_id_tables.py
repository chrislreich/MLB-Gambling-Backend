import pymysql
import sys
pymysql.install_as_MySQLdb()

nonBreakSpace = u'\xa0'

def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


def cleanStarter(pitcher):
    return pitcher.split(" (")[0].replace("\'","\\\'")

        

def cleanLineup(lineup):
    if lineup == '':
        return ''

    retArr = []
    players = lineup.split("^")
    for player in players:
        tempPlayer = player.split(" (")[0].replace(nonBreakSpace, " ")
        if (tempPlayer[0] == 'C' and tempPlayer[1] == ' '):
            tempPlayer = tempPlayer[2:]
        elif tempPlayer[0] == 'P':
            tempPlayer = tempPlayer[2:]
        else:
            tempPlayer = tempPlayer[3:]
        if ". " in tempPlayer:
            tempPlayer = tempPlayer.split(". ")[1]
        retArr.append([tempPlayer.replace("\'", "\\\'"), player])


    return retArr


def findBatterId(batterName):
    b1 = "select player_id from mlb_players.steamer_ros_batter_current "
    b2 = "where name like \'%" + batterName + "%\'"

    return b1 + b2


def findPitcherId(pitcherName):
    p1 = "select player_id from mlb_players.steamer_ros_pitchers_current "
    p2 = "where name like \'%" + pitcherName + "%\'"

    return p1 + p2


def cleanedUnmatchedBatter(batter, team):
    tempName = batter.split(". ")[1]

    b1 = "select player_id from mlb_players.steamer_ros_batter_current "
    b2 = "where name like \'%" + tempName + "%\' and " + team + " like \'% || team || %\'"



    return b1 + b2


def starterInsertStmt(pitcher,display,team, active_line_id):
    s1 = "insert into rotowire_lineups.starter_player_ids (name, display_name, team, active_line_id) values ("
    s2 = addQuotes(pitcher) + "," + addQuotes(display) + "," +  addQuotes(team) + "," + str(active_line_id) + ")"
    return s1 + s2

def batterInsertStmt(batter, display,team, active_line_id):
    s1 = "insert into rotowire_lineups.batter_player_ids (name,display_name, team, active_line_id) values ("
    s2 = addQuotes(batter) + "," + addQuotes(display) + "," + addQuotes(team) + "," + str(active_line_id) + ")"
    return s1 + s2





# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="lines",  passwd="", db="rotowire_lineups")
except:
    print("PYTHON3 EXIT -- Database connection error")
    inFile.close()
    sys.exit(2)



cur = db.cursor()

cur.execute("truncate table rotowire_lineups.batter_player_ids")
#cur.execute("truncate table rotowire_lineups.starter_player_ids")

cur.execute("Select * from rotowire_lineups.lineups_today where active_line_id is not null")


results = cur.fetchall()

cma = ","

batter_no_match = []




for result in results:
    away = result[1]
    active_line_id = result[7]
    away_starter = cleanStarter(result[2])
 #   cur.execute(starterInsertStmt(away_starter, result[2].replace("\'","\\\'"),away, active_line_id))


    away_lineup  = cleanLineup(result[3])
    for p in away_lineup:
        cur.execute(batterInsertStmt(p[0],p[1].replace("\'","\\\'"), away, active_line_id))
    home = result[4]
    home_starter = cleanStarter(result[5])


  #  cur.execute(starterInsertStmt(home_starter,result[5].replace("\'","\\\'"), home, active_line_id))



    home_lineup = cleanLineup(result[6])
    for h in home_lineup:
        cur.execute(batterInsertStmt(h[0],h[1].replace("\'", "\\\'"), home, active_line_id))
    active_line_id = result[7]




db.commit()
db.close()
