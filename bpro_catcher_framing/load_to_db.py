import pymysql
import sys
pymysql.install_as_MySQLdb()

def addQuotes(string):
    cleaned_apostrophe = string.replace("\'", "\\\'")
    return "\'" + cleaned_apostrophe + "\'"

def cleanArr(arr):
    retArr = []
    for a in arr:
        if a == "":
            retArr.append("0")
        else:
            retArr.append(a)
    return retArr

input_file = open("/home/creich/Desktop/encompass/artifacts/bpro_catcher_framing.txt", "r")

db = db = pymysql.connect(host="localhost",  user="bpro_defense_user",  passwd="", db="bpro_catcher_framing")

cur = db.cursor()

cur.execute("truncate table bpro_catcher_framing.season_2018_load")

cma = ","

for line in input_file:
    line = line.replace(",", "")
    arr = line.split('|')

    arr[0] = addQuotes(arr[0])
    
    cleaned_arr = cleanArr(arr)
    string = ','.join(cleaned_arr).replace("\n", "")

    s1 = "insert into bpro_catcher_framing.season_2018_load values ("
    s2 = string
    s3 = ", curdate() )"
    insert_stmt = s1 + s2 + s3
    cur.execute(insert_stmt)


db.commit()
db.close()
input_file.close()

print("Data loaded to DB")
