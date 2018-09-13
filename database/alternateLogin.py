# -*- coding: utf-8 -*-
import sys
import os
from selenium import webdriver
import time
from pyvirtualdisplay import Display

# Define Comma to be used in SQL insert statements
cma = ","


# Start Display for headless scraping
try:
    print("starting Display")
    display = Display(visible=0, size=(800, 600))
    display.start()
    print("Display Started")
except:
    print("PYTHON EXIT -- Unable to start display")
    display.stop()
    sys.exit(2)


# Open file to write pending wagers to
try:
    outputFile = open("/home/creich/Desktop/encompass/artifacts/pendingWagers.txt", "w")
except:
    print("PYTHON EXIT -- File open error")
    display.stop()
    sys.exit(2)


# Start Chromedriver
try:
    print("starting chrome")
    driver = webdriver.Chrome()
    print("chrome started")
except:
    print("PYTHON EXIT -- Unable to start Chromedriver")
    display.stop()
    driver.quit()
    sys.exit(2)

# Fetch BetOnline main URL
try:
    print("fetching main web page")
    driver.get('https://www.betonline.ag/')
    print("received main webpage")
except:
    print("PYTHON EXIT -- Cannot load URL")
    display.stop()
    driver.quit()
    sys.exit(2)

# Login in to account
print("starting log in")
# Login button
loginClick = driver.find_element_by_xpath('//input[@value="LOGIN"]')

# Username
user = driver.find_element_by_xpath('//input[@id="CustomerID"]')
user.send_keys("B923208")



# Password
password = driver.find_element_by_xpath('//input[@id="Password"]')

# Create an ActionChain to handle bug in inputting password
actions = webdriver.ActionChains(driver)
actions.move_to_element(password)
actions.click(password)
actions.send_keys("7897897Qq")
actions.perform()

# Click Login button
loginClick.click()

print("clicked")

# Navigate to pending wagers page
pending_url = 'https://www.betonline.ag/myaccount/pending-wagers'
driver.get(pending_url)

# Retrieve all pending wagers
print("Sleeping for 5 seconds...")
time.sleep(5)

totalPages = driver.find_element_by_xpath('//input[@id="PageCount"]').get_attribute("value")

totalPages = int(totalPages)

pageCount = 1

while pageCount <= totalPages:
    pageCount += 1

    records = None
    records = driver.find_elements_by_xpath('//table[@class="record"]')

    print("Page #" + str(pageCount))
    # Iterate through pending wagers
    for record in records:
        outputStr = u""

        # Get each item in row
        tds = record.find_elements_by_xpath('.//td')

        # Iterate through row items
        for td in tds:
            outputStr += td.text + cma


        # Substitute vulgar fraction
        outputStr = outputStr.replace(u'\u00BD',".5")
        # Remove extra newlines
        outputStr = outputStr.replace("\n", "")
        # Write wager to output file
        outputFile.write(outputStr + "\n")

    if totalPages > 1:
        nextPage = driver.find_element_by_xpath('//li[@class="pgNext"]')
        nextPage.click()
        time.sleep(4)



# Navigate to Graded Wagers page
graded_url = 'https://www.betonline.ag/myaccount/graded-wagers'
driver.get(graded_url)

gradedFile = open("/home/creich/Desktop/encompass/artifacts/gradedWagers.txt", "w")

graded = driver.find_elements_by_xpath('//table[@class="record"]')


for record in graded:
    outputStr = u""

    tds =  record.find_elements_by_xpath('.//td')

    for td in tds:
        outputStr += td.text + cma

    outputStr = outputStr.replace(u'\u00BD',".5")
    outputStr = outputStr.replace("\n", "")

    gradedFile.write(outputStr + "\n")




# Close file and driver
outputFile.close()
gradedFile.close()

driver.quit()

display.stop()

print("Wagers scraped from BetOnline account")
