import sys
from pyvirtualdisplay import Display
import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
import pymysql

pymysql.install_as_MySQLdb()

# Create local MySQL connection using user specific to this script
try:
    db = pymysql.connect(host="localhost",  user="players",  passwd="", db="mlb_players")
except:
    print("PYTHON3 EXIT -- Database connection error")
    sys.exit(2)



cur = db.cursor()

cur.execute("select player_id from mlb_players.zips_ros_current where player_id > (select player_id from mlb_players.scrape_batter_flag)")

results = cur.fetchall()

if len(results) == 0:
    print("Nothing to scrape")
    db.close()
    sys.exit(0)




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




driver.get('https://www.google.com')
print("Waiting for AdBlock to install")
time.sleep(5)




for player_id_array in results:

    player_id = str(player_id_array[0])
    url_string = "http://www.fangraphs.com/statss.aspx?playerid=" + player_id
    driver.get(url_string)
    time.sleep(.5)


    #div = driver.find_element_by_xpath('//div[@id="SeasonStats1_dgSeason11_ctl00"]')
    #table = div.find_element_by_xpath('.//table')
    table = driver.find_element_by_xpath('//table[@id="SeasonStats1_dgSeason11_ctl00"]')

    body = table.find_element_by_xpath('.//tbody')

    row = body.find_elements_by_xpath('.//tr[@class="rgRow grid_projectionsin_show"]')[0]

    tds = row.find_elements_by_xpath('.//td')

    zips_bb = tds[8].text.split(" %")[0]
    zips_kk = tds[9].text.split(" %")[0]
    zips_iso = tds[10].text
    zips_babip = tds[11].text

    zips_wrc = tds[16].text

    s1 = "update mlb_players.zips_ros_current set `wrc+` = " + zips_wrc + ", "
    s2 = "bb_pct = " + zips_bb + ", kk_pct = " + zips_kk + ", iso = " + zips_iso + ", babip = " + zips_babip
    s3 = " where player_id = " + player_id

    updateStmt = s1 + s2 + s3
    cur.execute(updateStmt)


    row_2 = body.find_elements_by_xpath('.//tr[@class="rgRow grid_projectionsin_show"]')[1]

    tds_2 = row.find_elements_by_xpath('.//td')

    s_bb = tds_2[8].text.split(" %")[0]
    s_kk = tds_2[9].text.split(" %")[0]
    s_iso = tds_2[10].text
    s_babip = tds_2[11].text

    b1 = "update mlb_players.steamer_ros_batter_current set bb_pct = " + s_bb + ", "
    b2 = "kk_pt = " + s_kk + ", iso = " + s_iso + ", babip = " + s_babip
    b3 = " where player_id = \'" + player_id + "\'"

    updateStmt_2 = b1 + b2 + b3
    cur.execute(updateStmt_2)

    cur.execute("truncate table mlb_players.scrape_batter_flag")
    cur.execute("insert into mlb_players.scrape_batter_flag values ( " + player_id + ")")
    db.commit()

driver.quit()
display.stop()
db.commit()
db.close()
