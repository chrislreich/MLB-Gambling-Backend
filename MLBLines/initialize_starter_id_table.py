import pymysql
import sys
pymysql.install_as_MySQLdb()

def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


def cleanStarterName(name):
    justName = name.split(" -")[0]
    if "." in justName:
        return justName.split(". ")[1].replace("\'","\\\'")
    else:
        return justName.split(" ")[1].replace("\'", "\\\'")
    

def escapeApostrophe(string):
    return string.replace("\'", "\\\'")


def insertStarterStmt(clean_name, display_name, team, active_line_id):
    q1 = "insert into rotowire_lineups.starter_player_ids (name, display_name, team, active_line_id) values ("
    q2 = addQuotes(clean_name) + "," + addQuotes(display_name) + "," + addQuotes(team) + "," + str(active_line_id) + ")"

    return q1 + q2

# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="lines",  passwd="", db="rotowire_lineups")
except:
    print("PYTHON3 EXIT -- Database connection error")
    inFile.close()
    sys.exit(2)


cur = db.cursor()

cur.execute("truncate table rotowire_lineups.starter_player_ids")


cur.execute("select * from MLBLines.active_lines")

results = cur.fetchall()

for result in results:
    active_line_id = result[0]

    away_team = result[4]
    home_team = result[5]
    

    if away_team == "American League" or away_team == "National League":
        continue

    away_starter = result[9]
    home_starter = result[10]
    
    if away_starter != "":
        cleaned_away_starter = cleanStarterName(away_starter)
    
    else:
        cleaner_away_starter = ""
    
    if home_starter != "":
        cleaned_home_starter = cleanStarterName(home_starter)
    else:
        cleaner_home_starter = ""

    
    away_starter = escapeApostrophe(away_starter)
    home_starter = escapeApostrophe(home_starter)

    cur.execute(insertStarterStmt(cleaned_away_starter, away_starter, away_team, active_line_id))

    cur.execute(insertStarterStmt(cleaned_home_starter, home_starter, home_team, active_line_id))



db.commit()
db.close()
