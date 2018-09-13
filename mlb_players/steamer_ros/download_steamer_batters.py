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

    driver.get('http://www.fangraphs.com/projections.aspx?pos=all&stats=bat&type=steamerr')


    downloadClick = driver.find_element_by_xpath('//a[@id="ProjectionBoard1_cmdCSV"]')

    downloadClick.click()

    print("Download initiated, waiting for 15 seconds")
    time.sleep(15)
except:
    print("PYTHON3 EXIT -- Problem scraping FanGraphs")
    driver.quit()
    display.stop()
    sys.exit(2)


driver.quit()
display.stop()

print("File Supposedly downloaded")
