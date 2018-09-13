import sys
from pyvirtualdisplay import Display
import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time


path_to_extension = '/home/creich/Desktop/chromedriver_adblock/AdBlock_v3.10.0.crx'

# Create pyvirtualdisplay to run headless Chrome scraping
try:
    display = Display(visible=0, size=(800, 600))
    display.start()
except:
    print("PYTHON3 EXIT -- Display unable to start")
    sys.exit(2)


try:
    chrome_options = Options()
    chrome_options.add_extension(path_to_extension)
    driver = webdriver.Chrome(chrome_options=chrome_options)
except:
    print("PYTHON3 EXIT -- Error starting Chromedriver")
    display.stop()
    sys.exit(2)


try:
    driver.get('https://www.google.com')
    print("Waiting for AdBlock to install")
    time.sleep(10)

    driver.get('https://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=1&season=2018&month=0&season1=2018&ind=0&team=0&rost=0&age=0&filter=&players=0')


    downloadClick = driver.find_element_by_xpath('//a[@id="LeaderBoard1_cmdCSV"]')

    downloadClick.click()

    print("download initiated, waiting for 10 seconds")
    time.sleep(10)
except:
    print("PYTHON3 EXIT -- Problem scraping FanGraphs")
    driver.quit()
    display.stop()
    sys.exit(2)






driver.quit()
display.stop()

print("File Supposedly downloaded")
