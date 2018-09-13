import pymysql
import sys
pymysql.install_as_MySQLdb()



def addQuotes(strPassed):
    return "\'" + strPassed + "\'"

def replaceQuote(strPassed):
    return strPassed.replace("\'", "\\\'")


cma = ","

inFile = open("/home/creich/Desktop/encompass/mlb_players/player_artifacts/zips_pitchers_download_cleaned.csv", "r")


# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="players",  passwd="", db="mlb_players")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)



cur = db.cursor()

cur.execute("truncate table mlb_players.zips_pitchers_ros_load")



for line in inFile:

    line = line.replace("%", "")

    strArr = line.split(",")

    s1 = "insert into mlb_players.zips_pitchers_ros_load values ( "
    s2 = addQuotes(replaceQuote(strArr[0])) + cma + addQuotes(strArr[1]) + cma
    s3 = ""

    i = 2
    while i < 19:
        if i == 18:
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



db.commit()
db.close()

inFile.close()
