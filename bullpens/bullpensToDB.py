import pymysql
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


teamDict = {
"team t108": "Los Angeles Angels",
"team t117": "Houston Astros",
"team t133": "Oakland Athletics",
"team t141": "Toronto Blue Jays",
"team t114": "Cleveland Indians",
"team t136": "Seattle Mariners",
"team t110": "Baltimore Orioles",
"team t140": "Texas Rangers",
"team t139": "Tampa Bay Rays",
"team t111": "Boston Red Sox",
"team t118": "Kansas City Royals",
"team t116": "Detroit Tigers",
"team t142": "Minnesota Twins",
"team t145": "Chicago White Sox",
"team t147": "New York Yankees",
"team t144": "Atlanta Braves",
"team t158": "Milwaukee Brewers",
"team t138": "St. Louis Cardinals",
"team t112": "Chicago Cubs",
"team t109": "Arizona Diamondbacks",
"team t119": "Los Angeles Dodgers",
"team t137": "San Francisco Giants",
"team t146": "Miami Marlins",
"team t121": "New York Mets",
"team t120": "Washington Nationals",
"team t135": "San Diego Padres",
"team t143": "Philadelphia Phillies",
"team t134": "Pittsburgh Pirates",
"team t113": "Cincinnati Reds",
"team t115": "Colorado Rockies"
}


cma = ","

db = pymysql.connect(host="localhost",
                  user="bullpens",
                   passwd="",
                   db="mlb_bullpens")


cur = db.cursor()

cur.execute("set sql_mode = \'\'")

cur.execute("truncate table mlb_bullpens.date_info")

cur.execute("truncate table mlb_bullpens.usage")


readFile = open("/home/creich/Desktop/encompass/artifacts/bullpens.txt", "r")
dateFile = open("/home/creich/Desktop/encompass/artifacts/dateFile.txt", "r")



for line in dateFile:
    lineArr = line.split(",")

    date  = lineArr[1]
    day0 = lineArr[2]
    day1 = lineArr[3]
    day2 = lineArr[4]

    dateStr = "insert into mlb_bullpens.date_info values ( STR_TO_DATE( " + addQuotes(date) + ", \'%b %e %Y\'), " + addQuotes(day0) + cma + addQuotes(day1) + cma + addQuotes(day2) + ")"
    cur.execute(dateStr)


for line in readFile:
    lineArr = line.split(",")

    team = teamDict[lineArr[0]]

    player = lineArr[1]
    player = player.replace('\'', "\\\'")
    c0 = lineArr[2]
    c1 = lineArr[3]
    c2 = lineArr[4]

    c2 = c2.replace("\n", "")



    insertStr = "insert into mlb_bullpens.usage values ( " + addQuotes(team) + cma + addQuotes(player) + cma + addQuotes(c0) + cma + addQuotes(c1) + cma + addQuotes(c2) + ")"
    cur.execute(insertStr)

db.commit()
db.close()


readFile.close()
dateFile.close()
