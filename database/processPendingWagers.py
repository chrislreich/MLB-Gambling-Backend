import pymysql
import sys
pymysql.install_as_MySQLdb()

def addQuotes(strPassed):
    return "\'" + strPassed + "\'"



pendingWagersFile = open("/home/creich/Desktop/encompass/artifacts/pendingWagers.txt", "r")
gradedWagersFile = open("/home/creich/Desktop/encompass/artifacts/gradedWagers.txt", "r")



cma = ","
dateFormat = "%b %e %Y %h:%i %p"

db = pymysql.connect(host="localhost",
                  user="wagers",
                   passwd="",
                   db="wagers")


cur = db.cursor()

cur.execute("truncate table wagers.pending_wagers_load")
cur.execute("truncate table wagers.graded_wagers_load")

for line in pendingWagersFile:
    strArr = line.split(",")

    ticket_id = strArr[0]
    time_accepted = strArr[1] + strArr[2]
    wager_type = strArr[3]

    risk = strArr[4]
    reward = strArr[5]

    risk = risk[1:]
    reward = reward[1:]

    description = strArr[6]

    descriptionArr = description.split(" - ")


    # Handle Futures Bets
    if wager_type == "Future/Prop":
        continue

        # Handle wagers place on Mobile devices

        if descriptionArr[0] == "Mobile" or descriptionArr[0] == "Tablet":

            sport = descriptionArr[1]

            sportFirst = sport.split(" ")[0]

            if sportFirst != "NBA" and sportFirst != "MLB":
                continue

            competition = descriptionArr[2]

            team = descriptionArr[3].replace("\'", "\\\'")

            numbersArr = descriptionArr[4].split(" ")

            over_under = numbersArr[0]

            wager = numbersArr[1]

            odds = numbersArr[3]
        else:

            sport = descriptionArr[0]

            if sport == "MLB Futures":
                continue

            sportFirst = sport.split(" ")[0]


            if sportFirst != "NBA" and sportFirst != "MLB":
                continue;

            competition = descriptionArr[1]

            team = descriptionArr[2].replace("\'", "\\\'")

            numbersArr = descriptionArr[3].split(" ")

            over_under = numbersArr[0]

            wager = numbersArr[1]

            odds = numbersArr[3]

        insertStmt1 = "insert into wagers.pending_wagers_load (ticket, accepted, type, risk, reward, sport, team, wager, odds, over_under, competition) values("
        insertStmt2 = addQuotes(ticket_id) + cma + "str_to_date(" + addQuotes(time_accepted) + cma + addQuotes(dateFormat) + ")" + cma + addQuotes(wager_type) + cma + risk + cma + reward + cma + addQuotes(sport) + cma + addQuotes(team) + cma + wager + cma + odds + cma + addQuotes(over_under) + cma + addQuotes(competition) + ")"
        totalInsert = insertStmt1 + insertStmt2
        cur.execute(totalInsert)

    elif wager_type == "Spread":
        continue

    elif wager_type == "Money Line":

        if descriptionArr[0] == "Mobile" or descriptionArr[0] == "Tablet":

            sport = descriptionArr[1]

            sportFirst = sport.split(" ")[0]

            if sportFirst != "Baseball":
                if sportFirst == 'BASEBALL':
                    sport = "Baseball"
                else:
                    continue
            
            if len(descriptionArr) == 3:
                gameInfo = descriptionArr[2]

                infoArr = gameInfo.split(" ")

                arrLen = len(infoArr)

                gameID = infoArr[0]

                odds = infoArr[arrLen - 3]
            elif len(descriptionArr) == 4:
                gameInfo = descriptionArr[2]
                infoArr = gameInfo.split(" " )
                gameID = infoArr[0]
                odds = descriptionArr[3].split(" ")[1]
            else:
                print("Unexpected Money Line format")
                print("Error")
                sys.exit(1)




        else:

            sport = descriptionArr[0]

            sportFirst = sport.split(" ")[0]


            if sportFirst != "Baseball":
                continue

            gameInfo = descriptionArr[1]

            infoArr = gameInfo.split(" ")

            arrLen = len(infoArr)

            gameID = infoArr[0]

            odds = infoArr[arrLen - 3]

        
        insertStmt1 = "insert into wagers.pending_wagers_load (ticket, accepted, type, risk, reward, sport, game_number, wager, odds) values ("
        insertStmt2 = addQuotes(ticket_id) + cma + "str_to_date(" + addQuotes(time_accepted) + cma + addQuotes(dateFormat) + ")" + cma + addQuotes(wager_type) + cma + risk + cma + reward + cma + addQuotes(sport) + cma + gameID + cma + "0" + cma + odds + ")"
        totalInsert = insertStmt1 + insertStmt2
        cur.execute(totalInsert)

    else:
        continue




for line in gradedWagersFile:
    strArr = line.split(",")

    ticket_id = strArr[0]
    time_accepted = strArr[1] + strArr[2]
    wager_type = strArr[3]

    risk = strArr[4]
    reward = strArr[5]

    risk = risk[1:]
    reward = reward[1:]

    outcome = strArr[6]



    insertStmt = "insert into wagers.graded_wagers_load values (" + addQuotes(ticket_id) + cma + addQuotes(outcome) + ")"
    cur.execute(insertStmt)




db.commit()
db.close()
pendingWagersFile.close()
gradedWagersFile.close()

print("Wagers loaded from TXT file into DB")
