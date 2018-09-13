import pymysql
import sys
pymysql.install_as_MySQLdb()

def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


cma = ","


# Read all scraped lines from file into variable
try:
    inFile = open("/home/creich/Desktop/encompass/artifacts/rotowire_lineups.txt", "r")
except:
    print("PYTHON3 EXIT -- File Read Error")
    sys.exit(2)


# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="lines",  passwd="", db="rotowire_lineups")
except:
    print("PYTHON3 EXIT -- Database connection error")
    inFile.close()
    sys.exit(2)



cur = db.cursor()

cur.execute("set sql_mode = \'\'")

cur.execute("truncate table rotowire_lineups.lineups_today_load")





for line in inFile:
    try:
        lineArr = line.split("|")

        date = lineArr[0]



        away_team = lineArr[1].replace("\'", "\\\'")
        away_pitcher = lineArr[2].replace("\'", "\\\'")
        away_lineup = lineArr[3].replace("\'", "\\\'")
        home_team = lineArr[4].replace("\'", "\\\'")
        home_pitcher = lineArr[5].replace("\'", "\\\'")
        home_lineup = lineArr[6][:-1].replace("\'", "\\\'")

        away_team = away_team.replace("A\\\'s", "Athletics")
        home_team = home_team.replace("A\\\'s", "Athletics")



        insertStr = "insert into rotowire_lineups.lineups_today_load values(STR_TO_DATE(" + addQuotes(date) + ", \'%M %e, %Y\'), " + addQuotes(away_team) + cma + addQuotes(away_pitcher) + cma + addQuotes(away_lineup) + cma + addQuotes(home_team) + cma + addQuotes(home_pitcher) + cma + addQuotes(home_lineup) + ")"
        cur.execute(insertStr)
    except:
        print("PYTHON EXIT -- SQL Insert Error")
        sys.exit(2)


db.commit()
db.close()
inFile.close()

print("Lineups Loaded into DB")
