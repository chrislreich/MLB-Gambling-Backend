import pymysql
import sys
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"



def checkMem(aid, cur):
    for mem in cur:

        if aid == str(mem[0]):
            return True

    return False



# Read all scraped lines from file into variable
try:
    foread = open("/home/creich/Desktop/encompass/artifacts/pairs.txt", "r")
    lines = foread.readlines()
    foread.close()
except:
    print("PYTHON3 EXIT -- File Read Error")
    sys.exit(2)


if len(lines) == 0:
    print("PYTHON ERROR -- No lines in file")
    sys.exit(2)

# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="lines",  passwd="", db="MLBLines")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)


# Create DB cursor
cur = db.cursor()

# Set sql_mode to accept Time in str_to_date
cur.execute("set sql_mode = \'\'")











# Standard Load table truncate
cur.execute("truncate table MLBLines.active_lines_load")
cur.execute("truncate table MLBLines.line_movement_load")

# Array to hold all lines in file that are Money Lines
goodStrArr = []

# Find all Money Lines in file and insert into array
for line in lines:
    if line.split("|")[5] == "0":
        goodStrArr.append(line)

# Light check for change in BetOnline scrape content
if len(goodStrArr) == 0:
    print("PYTHON3 EXIT -- No Money Lines written to TXT")
    print("NOTE: Potential BetOnline changed their website and scrape needs updating")
    sys.exit(2)




cma = ","
cnt = len(goodStrArr)
i = 0
while i < cnt:
    try:
        line1 = goodStrArr[i].split("|")

        line2 = goodStrArr[i + 1].split("|")

        gameID = line1[8]

        gameDateTime = line1[17].split(" ")

        gameDate = gameDateTime[0]

        gameTime = gameDateTime[1] + " " + gameDateTime[2]

        h1_string = line1[3].split(" - ")[0].split(" Game ")[0]
        h1_id = line1[2]
        h1_line = line1[6]
        h1_starter = line1[14].replace("\'", "\\\'")

        h2_string = line2[4].split(" - ")[0].split(" Game ")[0]
        h2_id = line2[2]
        h2_line = line2[6]
        h2_starter = line2[15].replace("\'", "\\\'")

        c1 = h1_line[0]


    except:
        print("PYTHON3 EXIT -- String processing error")
        sys.exit(2)


    try:
        activeLineStmt = "insert into active_lines_load values ( " + gameID + cma + "str_to_date(" + addQuotes(gameDate) + cma + "\'%m/%e/%Y\'), str_to_date(" + addQuotes(gameTime) + cma + "\'%l:%i:%s %p\'), " + "now()," +  addQuotes(h1_string) + cma + addQuotes(h2_string) + cma + addQuotes(h1_id) + cma + addQuotes(h2_id) + cma + "now()" + cma + addQuotes(h1_starter) + cma + addQuotes(h2_starter) + cma + h1_line + cma + h2_line + ")"
        cur.execute(activeLineStmt)




        lq1 = "insert into MLBLines.line_movement_load values ( "
        lq2 = gameID + ", NOW(), " + h1_line + cma + h2_line + ")"

        line_movement_insert = lq1 + lq2
        cur.execute(line_movement_insert)



    except:
        print("PYTHON EXIT -- SQL Insert Error")
        sys.exit(2)


    i += 2





db.commit()
db.close()

print("MLB Lines Written to DB")
