import requests
from lxml import html

output_file = open("/home/creich/Desktop/encompass/artifacts/rotowire_lineups_2.txt", "w")

r = requests.get("http://www.rotowire.com/baseball/daily_lineups.htm")

tree = html.fromstring(r.content)

date_string = tree.xpath('//h1[@class="dlineups-heading"]')[0].findtext('.').split(" for ")[1]

divs = tree.xpath('//div[@class="offset1 span15"]')

pipe = "|"
carrot = "^"

for div in divs:
    subDivs = div.xpath('.//div')[0]
    if subDivs.get("class") != "span15 dlineups-topbox":
        continue

    mainBox = div.xpath('.//div[@class="span15 dlineups-mainbox"]')[0]
    if mainBox.xpath('.//div')[1].get("class") == "span15 dlineups-postponed":
        continue

    awayTeam = mainBox.xpath('.//div[@class="dlineups-mainbar-away"]')[0].xpath('.//a')[0].findtext('.')
    homeTeam = mainBox.xpath('.//div[@class="dlineups-mainbar-home"]')[0].xpath('.//a')[0].findtext('.')

    lineups = mainBox.xpath('.//div[@class="dlineups-half"]')
    awayLineup = lineups[0]
    homeLineup = lineups[1]

    awayPlayers = awayLineup.xpath('.//div[@class="dlineups-vplayer"]')

    awayPlayerString = ""
    i = 1

    for player in awayPlayers:
        position = player.xpath('.//div[@class="dlineups-pos"]')[0].findtext('.').replace("\n", "")
        name = player.xpath('.//a')[0].findtext('.').replace("\n", "")
        handedness = player.xpath('.//span[@class="dlineups-lr"]')[0].findtext('.').replace("\n", "")
        
        finalPlayer = position + " " + name + handedness
        if i == 9:
            awayPlayerString += finalPlayer
        else:
            awayPlayerString += finalPlayer + carrot

        i += 1

    homePlayers = homeLineup.xpath('.//div[@class="dlineups-hplayer"]')

    homePlayerString = ""
    i = 1
    for player in homePlayers:
        position = player.xpath('.//div[@class="dlineups-pos"]')[0].findtext('.').replace("\n", "")
        name = player.xpath('.//a')[0].findtext('.').replace("\n", "")
        handedness = player.xpath('.//span[@class="dlineups-lr"]')[0].findtext('.').replace("\n", "")
        
        finalPlayer = position + " " + name + handedness
        if i == 9:
            homePlayerString += finalPlayer
        else:
            homePlayerString += finalPlayer + carrot

        i += 1

    # Find starting pitchers
    pitchers = mainBox.xpath('.//div[@class="span11 dlineups-pitchers"]')[0].xpath('.//div')

    awayPitcher = pitchers[0].xpath('.//a')[0].findtext('.') + pitchers[0].xpath('.//span')[0].findtext('.')

    homePitcher = pitchers[1].xpath('.//a')[0].findtext('.') + pitchers[1].xpath('.//span')[0].findtext('.')


    outString = date_string + pipe + awayTeam + pipe + awayPitcher + pipe + awayPlayerString + pipe + homeTeam + pipe + homePitcher + pipe + homePlayerString
    output_file.write(outString + "\n")



output_file.close()



