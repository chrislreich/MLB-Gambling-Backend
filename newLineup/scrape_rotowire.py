import sys
from pyvirtualdisplay import Display
import os
from selenium import webdriver
import time


# Create pyvirtualdisplay to run headless Chrome scraping
try:
    display = Display(visible=0, size=(800, 600))
    display.start()
except:
    print("PYTHON3 EXIT -- Display unable to start")
    sys.exit(2)



# Start Chromedriver
try:
    driver = webdriver.Chrome()
except:
    print("PYTHON3 EXIT -- Chromedriver error")
    display.stop()
    sys.exit(2)


# Fetch Rotowwire lineups url
try:
    driver.get('http://www.rotowire.com/baseball/daily_lineups.htm')
except:
    print("PYTHON3 EXIT -- Cannot fetch URL")
    print("URL: http://www.rotowire.com/baseball/daily_lineups.htm")
    display.stop()
    driver.quit()
    exit(2)

# Open file to write to
try:
    outFile = open("/home/creich/Desktop/encompass/artifacts/rotowire_lineups.txt", "w")
except:
    print("PYTHON3 EXIT -- File open error")
    display.stop()
    driver.quit()
    exit(2)



pipe = "|"
carrot = "^"



try:
    dateStr = driver.find_element_by_xpath('//h1[@class="dlineups-heading"]').text.split(" for ")[1]

    divs = driver.find_elements_by_xpath('//div[@class="offset1 span15"]')

    for div in divs:
        subDivs = div.find_element_by_xpath('.//div')

        if subDivs.get_attribute("class") != "span15 dlineups-topbox":
            continue

        mainBox = div.find_element_by_xpath('.//div[@class="span15 dlineups-mainbox"]')

        if mainBox.find_elements_by_xpath('.//div')[1].get_attribute("class") == "span15 dlineups-postponed":
            continue

        awayTeam = mainBox.find_element_by_xpath('.//div[@class="dlineups-mainbar-away"]').find_element_by_xpath('.//a').text
        homeTeam = mainBox.find_element_by_xpath('.//div[@class="dlineups-mainbar-home"]').find_element_by_xpath('.//a').text




        lineups = mainBox.find_elements_by_xpath('.//div[@class="dlineups-half"]')

        awayLineup = lineups[0]
        homeLineup = lineups[1]

        awayPlayers = awayLineup.find_elements_by_xpath('.//div[@class="dlineups-vplayer"]')

        awayPlayerStr = ""
        i = 1

        for player in awayPlayers:
            playerArr = player.text.split(" ")


            finalPlayer = playerArr[0].replace("\n", " ") + " " + playerArr[1] + " " + playerArr[2]
            if i == 9:
                awayPlayerStr += finalPlayer
            else:
                awayPlayerStr += finalPlayer + carrot

            i += 1




        homePlayers = homeLineup.find_elements_by_xpath('.//div[@class="dlineups-hplayer"]')

        homePlayerStr = ""
        i = 1

        for player in homePlayers:


            playerArr = player.text.split(" ")



            finalPlayer = playerArr[0].replace("\n", "") + " " + playerArr[1] + " " + playerArr[2] + " " + playerArr[3]

            if i == 9:
                homePlayerStr += finalPlayer
            else:
                homePlayerStr += finalPlayer + carrot

            i += 1


        pitchers = mainBox.find_element_by_xpath('.//div[@class="span11 dlineups-pitchers"]').find_elements_by_xpath('.//div')

        awayPitcher = pitchers[0].find_element_by_xpath('.//a').text + pitchers[0].find_element_by_xpath('.//span').text
        homePitcher = pitchers[1].find_element_by_xpath('.//a').text + pitchers[1].find_element_by_xpath('.//span').text

        outStr = dateStr + pipe + awayTeam + pipe + awayPitcher + pipe + awayPlayerStr + pipe + homeTeam + pipe + homePitcher + pipe + homePlayerStr
        outFile.write(outStr + '\n')

except:
    print("PYTHON3 EXIT -- Scrape error")
    print("Unexpected error:", sys.exc_info()[0])
    display.stop()
    driver.quit()
    sys.exit(2)


outFile.close()
driver.quit()
display.stop()

print("Lineups scraped from Rotowire")
