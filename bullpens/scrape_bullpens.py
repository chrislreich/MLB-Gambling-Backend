import os
from selenium import webdriver
import time
from pyvirtualdisplay import Display


display = Display(visible=0, size=(800, 600))
display.start()


writeFile = open("/home/creich/Desktop/encompass/artifacts/bullpens.txt", "w")
dateFile = open('/home/creich/Desktop/encompass/artifacts/dateFile.txt', "w")
cma = ","


driver = webdriver.Chrome()

driver.get('http://www.baseballpress.com/bullpenusage')

game_date = driver.find_elements_by_xpath('//input[@type="button"]')[2].get_attribute("value")
print("GAME DATE:" + game_date)
dateFile.write(game_date + cma)

al_bullpens = driver.find_element_by_xpath('//div[@class="league AL"]')
nl_bullpens = driver.find_element_by_xpath('//div[@class="league NL"]')

day_tds = al_bullpens.find_elements_by_xpath('.//tr[@class="head"]')[1].find_elements_by_xpath('.//td')

day_0 = day_tds[0].text
day_1 = day_tds[1].text
day_2 = day_tds[2].text

print("DAY 0: " + day_0)
dateFile.write(day_0 + cma + day_1 + cma + day_2)

al_trs = al_bullpens.find_elements_by_xpath('.//tr')

head_flag = 1

for tr in al_trs:
    if tr.get_attribute("class") == "head":
        head_flag = 1
        continue

    outStr = ""

    tds = tr.find_elements_by_xpath('.//td')
    if head_flag == 1:
        team_id = tds[0].find_element_by_xpath('.//div').get_attribute("class")
        head_flag = 0

        name = tds[1].text

        pitches_0 = tds[2].text
        pitches_1 = tds[3].text
        pitches_2 = tds[4].text
    else:
        name =  tds[0].text

        pitches_0 = tds[1].text
        pitches_1 = tds[2].text
        pitches_2 = tds[3].text

    outStr = team_id + cma + name + cma + pitches_0 + cma + pitches_1 + cma + pitches_2
    writeFile.write(outStr + "\n")


nl_trs = nl_bullpens.find_elements_by_xpath('.//tr')

head_flag = 1

for tr in nl_trs:
    if tr.get_attribute("class") == "head":
        head_flag = 1
        continue

    outStr = ""

    tds = tr.find_elements_by_xpath('.//td')
    if head_flag == 1:
        team_id = tds[0].find_element_by_xpath('.//div').get_attribute("class")
        head_flag = 0

        name = tds[1].text

        pitches_0 = tds[2].text
        pitches_1 = tds[3].text
        pitches_2 = tds[4].text
    else:
        name =  tds[0].text

        pitches_0 = tds[1].text
        pitches_1 = tds[2].text
        pitches_2 = tds[3].text

    outStr = team_id + cma + name + cma + pitches_0 + cma + pitches_1 + cma + pitches_2
    writeFile.write(outStr + "\n")

writeFile.close()
driver.close()

display.stop()
