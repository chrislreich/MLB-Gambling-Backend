from selenium import webdriver
import os
from pyvirtualdisplay import Display


display = Display(visible=0, size=(800, 600))
display.start()


driver = webdriver.Chrome()

driver.get('http://www.baseballpress.com/lineups')

cma = ","
pipe = "|"
carrot = "^"

outFile = open("/home/creich/Desktop/encompass/artifacts/lineups.txt", "w")

game_day = driver.find_elements_by_xpath('//input[@type="button"]')[2].get_attribute("value")


all_lineups = driver.find_element_by_xpath('//div[@class="main-lineup showall"]')


game_lineups = all_lineups.find_elements_by_xpath('.//div[@class="game clearfix"]')

for game in game_lineups:

    game_time = game.find_element_by_xpath('.//div[@class="game-time"]').text


    putStr = game_day + pipe + game_time + pipe

    clearfix = game.find_element_by_xpath('.//div[@class="clearfix"]')

    teams = clearfix.find_elements_by_xpath('.//div[@class="team-data"]')

    away_team = teams[0]

    a2 = away_team.find_element_by_xpath('.//div[@class="text"]')

    away_team_pitcher = a2.find_elements_by_xpath('.//div')[1].text

    a3 = a2.find_element_by_xpath('.//div')

    away_lineup_present =  a3.get_attribute("class")
    away_team_name = a3.text



    putStr += away_team_name + pipe

    putStr += away_team_pitcher + pipe

    if away_lineup_present == "team-name":
        away_lineup = game.find_element_by_xpath('.//div[@class="cssDialog clearfix"]').find_elements_by_xpath('.//div[@class="team-lineup clearfix"]')[0]
        players = away_lineup.find_element_by_xpath('.//div[@class="players"]').find_elements_by_xpath('.//div')
        playerStr = ""
        for player in players:
            player_name = player.text
            player_name = player_name.replace("\'", "\\\'")
            playerStr += player_name + carrot


        playerStr = playerStr[:-1]

        putStr += playerStr



    putStr += pipe


    home_team = teams[1]

    h2 = home_team.find_element_by_xpath('.//div[@class="text"]')

    home_team_pitcher = h2.find_elements_by_xpath('.//div')[1].text

    h3 = h2.find_element_by_xpath('.//div')

    home_lineup_present = h3.get_attribute("class")
    home_team_name = h3.text



    putStr += home_team_name + pipe

    putStr += home_team_pitcher + pipe

    if home_lineup_present == "team-name":
        home_lineup = game.find_element_by_xpath('.//div[@class="cssDialog clearfix"]').find_elements_by_xpath('.//div[@class="team-lineup clearfix"]')[1]
        players = home_lineup.find_element_by_xpath('.//div[@class="players"]').find_elements_by_xpath('.//div')
        playerStr = ""
        for player in players:
            player_name = player.text
            player_name = player_name.replace("\'", "\\\'")
            playerStr += player_name + carrot

        playerStr = playerStr[:-1]

        putStr += playerStr


    outFile.write(putStr + "\n")


outFile.close()
driver.close()

display.stop()
