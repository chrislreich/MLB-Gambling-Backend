import os
import time
import requests
from lxml import html


date_file = open("/home/creich/Desktop/encompass/artifacts/dateFile_2.txt", "w")
out_file = open("/home/creich/Desktop/encompass/artifacts/bullpens_2.txt", "w")

cma = ","

r = requests.get("http://www.baseballpress.com/bullpenusage")

tree = html.fromstring(r.content)

game_date = tree.xpath('//input[@type="button"]')[2].get("value")
print(game_date)

al_bullpens = tree.xpath('//div[@class="league AL"]')[0]
nl_bullpens = tree.xpath('//div[@class="league NL"]')[0]

day_tds = al_bullpens.xpath('.//tr[@class="head"]')[1].xpath('.//td')

day_0 = day_tds[0].findtext('.')
day_1 = day_tds[1].findtext('.')
day_2 = day_tds[2].findtext('.')
print(day_0)

date_file.write(game_date + cma + day_0 + cma + day_1 + cma + day_2)
date_file.close()

al_trs = al_bullpens.xpath('.//tr')
head_flag = 1

for tr in al_trs:
    if tr.get("class") == "head":
        head_flag = 1
        continue
    outStr = ""
    tds = tr.xpath('.//td')
    if head_flag == 1:
        team_id = tds[0].xpath('.//div')[0].get("class")
        head_flag = 0
        name = tds[1].findtext('.//a')
        pitches_0 = tds[2].findtext('.')
        pitches_1 = tds[3].findtext('.')
        pitches_2 = tds[4].findtext('.')
    else:
        name = tds[0].findtext('.//a')
        pitches_0 = tds[1].findtext('.')
        pitches_1 = tds[2].findtext('.')
        pitches_2 = tds[3].findtext('.')

    outStr = team_id + cma + name + cma + pitches_0 + cma + pitches_1 + cma + pitches_2
    print(outStr)
    out_file.write(outStr + "\n")

nl_trs = nl_bullpens.xpath('.//tr')

head_flag = 1

for tr in nl_trs:
    if tr.get("class") == "head":
        head_flag = 1
        continue
    outStr = ""
    tds = tr.xpath('.//td')
    if head_flag == 1:
        team_id = tds[0].xpath('.//div')[0].get("class")
        head_flag = 0
        name = tds[1].findtext('.//a')
        pitches_0 = tds[2].findtext('.')
        pitches_1 = tds[3].findtext('.')
        pitches_2 = tds[4].findtext('.')
    else:
        name = tds[0].findtext('.//a')
        pitches_0 = tds[1].findtext('.')
        pitches_1 = tds[2].findtext('.')
        pitches_2 = tds[3].findtext('.')

    outStr = team_id + cma + name + cma + pitches_0 + cma + pitches_1 + cma + pitches_2
    print(outStr)
    out_file.write(outStr + "\n")



out_file.close()
print("Bullpens scraped")
