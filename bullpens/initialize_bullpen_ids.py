import pymysql
import sys
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


def cleanName(name):
    return name.split(" (")[0].replace("\'","\\\'")


def bullpenInsertStmt(pitcher,display,team):
    s1 = "insert into mlb_bullpens.bullpen_player_ids (name, display_name, team) values ("
    s2 = addQuotes(pitcher) + "," + addQuotes(display) + "," +  addQuotes(team)  + ")"
    return s1 + s2




# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="bullpens",  passwd="", db="rotowire_lineups")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)




cur = db.cursor()

cur.execute("truncate table mlb_bullpens.bullpen_player_ids")

cur.execute("select * from mlb_bullpens.usage")


results = cur.fetchall()

cma = ","

for result in results:
    team = result[0]
    display_name = result[1]
 
    clean_name = cleanName(display_name)
    

    cur.execute(bullpenInsertStmt(clean_name, display_name.replace("\'","\\\'"),team))

db.commit()
db.close() 
