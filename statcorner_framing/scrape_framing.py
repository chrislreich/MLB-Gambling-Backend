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


# Fetch statcorner framing url
try:
    driver.get('http://www.statcorner.com/CatcherReport.php')
except:
    print("PYTHON3 EXIT -- Cannot fetch URL")
    print("URL: http://www.statcorner.com/CatcherReport.php")
    display.stop()
    driver.quit()
    exit(2)



# Open file to write to
try:
    outFile = open("/home/creich/Desktop/encompass/artifacts/statcorner_framing.txt", "w")
except:
    print("PYTHON3 EXIT -- File open error")
    display.stop()
    driver.quit()
    exit(2)



pipe = "|"
carrot = "^"


try:
    print("Sleeping for 5 seconds")
    time.sleep(5)
    table = driver.find_element_by_xpath('//table[@id="leader"]')

    table_body = table.find_element_by_xpath('.//tbody')

    player_rows = table_body.find_elements_by_xpath('.//tr')

    for row in player_rows:

        outString = ""
        fields = row.find_elements_by_xpath('.//td')
        for field in fields:
            outString += field.text + pipe

        

        outFile.write(outString + '\n')

except:
    print("PYTHON3 EXIT -- Scrape error")
    print("Unexpected error:", sys.exc_info()[0])
    display.stop()
    driver.quit()
    sys.exit(2)



outFile.close()
driver.quit()
display.stop()

print("Catcher stats scraped from StatCorner")
