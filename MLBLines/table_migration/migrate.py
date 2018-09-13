import pymysql
import sys
pymysql.install_as_MySQLdb()

db = pymysql.connect(host="localhost",  user="lines",  passwd="", db="MLBLines")
cur = db.cursor()

tables = "select table_name from information_schema.tables where table_schema = 'MLBLines' and table_name like 'mlb_%'"

cur.execute(tables)
table_names = cur.fetchall()


def InsertLines(table_names):
    for row in table_names:
        name = row[0]
        print(name)
        game_id = name.split("_")[1]
        insert_stmt = "insert into MLBLines.line_movement "
        select_from_table = "select distinct " + game_id + ",  tstamp, h1_line, h2_line from MLBLines." + name + " where tstamp <= '2018-05-08 16:39:00'"
        total_stmt = insert_stmt + select_from_table
        try:
            cur.execute(total_stmt)
        except:
            db.rollback()
            sys.exit(1)

def DeleteTables(table_names):
    for row in table_names:
        name = row[0]
        drop_stmt = "DROP TABLE MLBLines." + name
        print(drop_stmt)
        try:
            cur.execute(drop_stmt)
        except:
            db.rollback()
            sys.exit(1)



db.autocommit(False)
#InsertLines(table_names)
DeleteTables(table_names)
db.commit()

