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
    print("PYTHON3 EXIT -- Chromedrive error")
    display.stop()
    sys.exit(2)


# Fetch BetOnline Mobile MLB URL
try:
    driver.get('https://mobile.betonline.ag/sports/offerings?s=Baseball&l=MLB&p=0')
except:
    print("PYTHON3 EXIT -- Cannot fetch URL")
    print("URL: https://mobile.betonline.ag/sports/offerings?s=Baseball&l=MLB&p=0")
    display.stop()
    driver.quit()
    exit(2)



# Open file to write to
try:
    fo = open("/home/creich/Desktop/encompass/artifacts/pairs.txt", "w")
except:
    print("PYTHON3 EXIT -- File open error")
    display.stop()
    driver.quit()
    exit(2)


# Scrape all lines from webpage
try:
    pairs = driver.find_elements_by_xpath('//a[@href="#"]')

    for pair in pairs:
        st = pair.get_attribute("line-value")

        if st != None:
            fo.write(st + "\n")

except:
    print("PYTHON3 EXIT -- Scrape error")
    display.stop()
    driver.quit()
    sys.exit(2)


driver.quit()
fo.close()
display.stop()


print("Completed MLB Lines Scrape")
