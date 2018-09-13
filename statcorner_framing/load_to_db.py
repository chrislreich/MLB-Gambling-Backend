import pymysql
import sys
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"



# Read all scraped lines from file into variable
try:
    inFile = open("/home/creich/Desktop/encompass/artifacts/statcorner_framing.txt", "r")

except:
    print("PYTHON3 EXIT -- File Read Error")
    sys.exit(2)



# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="bpro_defense_user",  passwd="", db="bpro_defense")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)


# Create DB cursor
cur = db.cursor()


# Standard Load table truncate
cur.execute("truncate table bpro_defense.2017_statcorner_framing_load")

cma = ","

for line in inFile:
    strArr = line.split('|')

    name = strArr[0] + " " + strArr[1]

    name = addQuotes(name.replace('\'', '\\\''))

    team = strArr[3]

    if team == "D-backs":
        team = "Diamondbacks"

    team = addQuotes(team)

    sample = strArr[4]

    counter = 5
    while counter < 10:
        strArr[counter] = strArr[counter].replace("NaN", "0")
        counter += 1

    zball = strArr[5]
    ostr = strArr[6]

    calls = strArr[7]

    per_game = strArr[8]

    raa = strArr[9]

    stmt1 = "insert into bpro_defense.2017_statcorner_framing_load values ("
    stmt2 = name + cma + team + cma + sample + cma + zball + cma + ostr + cma + calls + cma + per_game + cma + raa + ")"

    insertStmt  = stmt1 + stmt2
    cur.execute(insertStmt)



db.commit()
db.close()

print("Framing stats Written to DB")
