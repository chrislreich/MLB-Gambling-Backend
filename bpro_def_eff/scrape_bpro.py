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


# Updated for 2018 URL
try:
    driver.get('http://www.baseballprospectus.com/sortable/index.php?cid=2559629')
except:
    print("PYTHON3 EXIT -- Cannot fetch URL")
    print("URL: http://www.baseballprospectus.com/sortable/index.php?cid=2559629")
    display.stop()
    driver.quit()
    exit(2)


# Open file to write to
try:
    outFile = open("/home/creich/Desktop/encompass/artifacts/def_eff.txt", "w")
except:
    print("PYTHON3 EXIT -- File open error")
    display.stop()
    driver.quit()
    exit(2)




pipe = "|"
carrot = "^"

try:
    table = driver.find_element_by_xpath('//table[@id="TTdata"]')

    trs = table.find_elements_by_xpath('.//tr')

    for tr in trs:
        if tr.get_attribute("class") == "TTdata_ltblue":
            continue

        outStr = ""

        tds = tr.find_elements_by_xpath('.//td')

        for td in tds:
            outStr += td.text + pipe

        outFile.write(outStr + "\n")
except:
    print("PYTHON3 EXIT -- Scrape error")
    display.stop()
    driver.quit()
    sys.exit(2)

outFile.close()
driver.quit()
display.stop()

print("Completed Baseball Prospectus PADE Scrape")
