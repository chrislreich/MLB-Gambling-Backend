import pymysql
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


cma = ","

db = pymysql.connect(host="localhost",
                  user="lineups",
                   passwd="",
                   db="mlb_lineups")


cur = db.cursor()

cur.execute("set sql_mode = \'\'")

cur.execute("truncate table mlb_lineups.lineups_today_load")

inFile = open("/home/creich/Desktop/encompass/artifacts/lineups.txt", "r")

for line in inFile:
    lineArr = line.split("|")

    date = lineArr[0]

    time = lineArr[1]


    away_team = lineArr[2]
    away_pitcher = lineArr[3]
    away_lineup = lineArr[4]
    home_team = lineArr[5]
    home_pitcher = lineArr[6]
    home_lineup = lineArr[7][:-1]



    insertStr = "insert into mlb_lineups.lineups_today_load values(STR_TO_DATE(" + addQuotes(date) + ", \'%W, %b %e %Y\'), " + addQuotes(away_team) + cma + addQuotes(away_pitcher) + cma + addQuotes(away_lineup) + cma + addQuotes(home_team) + cma + addQuotes(home_pitcher) + cma + addQuotes(home_lineup) + ")"
    cur.execute(insertStr)


db.commit()
db.close()
