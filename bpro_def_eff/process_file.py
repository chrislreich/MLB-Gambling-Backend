import pymysql
import sys
import time
pymysql.install_as_MySQLdb()


def addQuotes(strPassed):
    return "\'" + strPassed + "\'"




# Read all scraped lines from file into variable
try:
    inFile = open("/home/creich/Desktop/encompass/artifacts/def_eff.txt", "r")
except:
    print("PYTHON3 EXIT -- File Read Error")
    sys.exit(2)




today = time.strftime("%d/%m/%Y")
print(today)

cma = ","

# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="bpro_defense_user",  passwd="", db="bpro_defense")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)



cur = db.cursor()

pre_truncate_stmt = "insert into bpro_defense.2017_pade select * from bpro_defense.2017_pade_today pt where not exists (select 'x' from bpro_defense.2017_pade p where p.team = pt.team and p.date = pt.date)"
cur.execute(pre_truncate_stmt)
db.commit()

cur.execute("truncate table bpro_defense.2017_pade_today")

for line in inFile:
    strArr = line.split("|")

    team = strArr[3]
    pade = strArr[14]

    insertStr = "insert into bpro_defense.2017_pade_today values ( " + addQuotes(team) + cma + pade + cma + "str_to_date(" + addQuotes(today) + ", \'%d/%m/%Y\'))"
    cur.execute(insertStr)

db.commit()
db.close()
inFile.close()

print("Defensive Numbers inserted into DB")
