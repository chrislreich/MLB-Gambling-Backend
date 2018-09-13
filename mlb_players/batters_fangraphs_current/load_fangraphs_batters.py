import pymysql
import sys
pymysql.install_as_MySQLdb()



def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


def replaceQuote(strPassed):
    return strPassed.replace("\'", "\\\'")


cma = ","

inFile = open("/home/creich/Desktop/encompass/mlb_players/player_artifacts/fangraphs_batters_download_cleaned.csv", "r")


# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="players",  passwd="", db="mlb_players")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)

cur = db.cursor()

cur.execute("truncate table mlb_players.fangraphs_batting_stats_load")


for line in inFile:
    try:
        line = line.replace('%', '')
        strArr = line.split(",")

        s1 = "insert into mlb_players.fangraphs_batting_stats_load values ( "
        s2 = addQuotes(replaceQuote(strArr[0])) + cma + addQuotes(strArr[1]) + cma
        s3 = ""

        i = 2
        while i < 22:
            if i == 21:
                s3 += strArr[i] + ")"
            else:
                tempStr = ""
                if strArr[i] == "":
                    tempStr = "0"
                else:
                    tempStr = strArr[i]
                s3 += tempStr + cma

            i += 1

        insertStmt = s1 + s2 + s3
        cur.execute(insertStmt)
    except:
        print("PYTHON EXIT -- SQL Insert Error")
        sys.exit(2)



db.commit()
db.close()

inFile.close()

print("Fangraphs Batter data loaded into DB")
