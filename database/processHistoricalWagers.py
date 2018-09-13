
import pymysql
pymysql.install_as_MySQLdb()

def addQuotes(strPassed):
    return "\'" + strPassed + "\'"


cma = ","

db = pymysql.connect(host="localhost",
                  user="wagers",
                   passwd="",
                   db="wagers")


cur = db.cursor()

"""
selectStmt = "select * from wagers.historic_wagers_middle where sport = \'Baseball\' and closing_line is null"

cur.execute(selectStmt)

lines = cur.fetchall()

for line in lines:

    ticket_id = line[0]

    lineBet = line[9]


    active_line_id = str(line[15])

    home = line[16]

    if home == 1:
        mlbFetch = "select s.gameLine from (select max(tstamp), h1_line as gameLine from MLBLines.mlb_" + active_line_id + " group by 2) as s"
    else:
        mlbFetch = "select s.gameLine from (select max(tstamp), h2_line as gameLine from MLBLines.mlb_" + active_line_id + " group by 2) as s"

    cur.execute(mlbFetch)

    closing_line = cur.fetchall()[0][0]

    if lineBet > 0:
        lineBet = lineBet - 100
    else:
        lineBet = lineBet + 100

    if closing_line > 0:
        closing_line = closing_line - 100
    else:
        closing_line = closing_line + 100


    clv = lineBet - closing_line



    updateClosingLineStmt = "update wagers.historic_wagers_middle set closing_line = " + str(closing_line)  + " where ticket = " + addQuotes(ticket_id)
    cur.execute(updateClosingLineStmt)

    updateClvStmt = "update wagers.historic_wagers_middle set clv = " + str(clv) + " where ticket = " + addQuotes(ticket_id)
    cur.execute(updateClvStmt)


db.commit()
"""


selectStmt = "select * from wagers.historic_wagers_middle where sport = \'Baseball\' and outcome is null"
cur.execute(selectStmt)
results = cur.fetchall()


for result in results:
    ticket_id = result[0]

    risk = (result[3] * (-1))
    reward = result[4]

    fetchStmt = "select outcome from wagers.graded_wagers where ticket = " + addQuotes(ticket_id)

    cur.execute(fetchStmt)

    outcome = cur.fetchall()



    if len(outcome) == 0:
        continue

    outcome = outcome[0][0]


    if outcome == "Win":
        updateOutcomeStmt = "update wagers.historic_wagers_middle set outcome = " + addQuotes(outcome) + " where ticket = " + addQuotes(ticket_id)

        updateNetStmt = "update wagers.historic_wagers_middle set net = " + str(reward) + " where ticket = " + addQuotes(ticket_id)
    elif outcome == "Loss":
        updateOutcomeStmt = "update wagers.historic_wagers_middle set outcome = " + addQuotes(outcome) + " where ticket = " + addQuotes(ticket_id)

        updateNetStmt = "update wagers.historic_wagers_middle set net = " + str(risk) + " where ticket = " + addQuotes(ticket_id)
    else:
        updateOutcomeStmt = "update wagers.historic_wagers_middle set outcome = " + addQuotes(outcome) + " where ticket = " + addQuotes(ticket_id)

        updateNetStmt = "update wagers.historic_wagers_middle set net = " + str(0) + " where ticket = " + addQuotes(ticket_id)


    cur.execute(updateOutcomeStmt)
    cur.execute(updateNetStmt)

    finalInsertStmt = "insert into wagers.historic_wagers select * from wagers.historic_wagers_middle where ticket = " + addQuotes(ticket_id)
    cur.execute(finalInsertStmt)



db.commit()
db.close()
