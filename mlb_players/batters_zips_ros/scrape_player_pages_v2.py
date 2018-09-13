import requests
from lxml import html
import pymysql
import sys

pymysql.install_as_MySQLdb()


def ScrapePlayer(player_id):
    url = "http://www.fangraphs.com/statss.aspx?playerid=" + player_id
    r = requests.get(url)
    tree = html.fromstring(r.content)
    table = tree.xpath('//table[@id="SeasonStats1_dgSeason11_ctl00"]')[0]
    body = table.xpath('.//tbody')[0]
    row = body.xpath('.//tr[@class="rgRow grid_projectionsin_show"]')[0]
    tds = row.xpath('.//td')

    zips_bb = tds[8].findtext('.').split(" %")[0]
    zips_kk = tds[9].findtext('.').split(" %")[0]
    zips_iso = tds[10].findtext('.')
    zips_babip = tds[11].findtext('.')

    zips_wrc = tds[16].findtext('.')

    s1 = "update mlb_players.zips_ros_current set `wrc+` = " + zips_wrc + ", "
    s2 = "bb_pct = " + zips_bb + ", kk_pct = " + zips_kk + ", iso = " + zips_iso + ", babip = " + zips_babip
    s3 = " where player_id = " + player_id

    updateStmt = s1 + s2 + s3
    cur.execute(updateStmt)


    row_2 = body.xpath('.//tr[@class="rgRow grid_projectionsin_show"]')[1]

    tds_2 = row.xpath('.//td')

    s_bb = tds_2[8].findtext('.').split(" %")[0]
    s_kk = tds_2[9].findtext('.').split(" %")[0]
    s_iso = tds_2[10].findtext('.')
    s_babip = tds_2[11].findtext('.')

    b1 = "update mlb_players.steamer_ros_batter_current set bb_pct = " + s_bb + ", "
    b2 = "kk_pt = " + s_kk + ", iso = " + s_iso + ", babip = " + s_babip
    b3 = " where player_id = \'" + player_id + "\'"

    updateStmt_2 = b1 + b2 + b3
    cur.execute(updateStmt_2)
    cur.execute("truncate table mlb_players.scrape_batter_flag")
    cur.execute("insert into mlb_players.scrape_batter_flag values ( " + player_id + ")")
    db.commit()



db = pymysql.connect(host="localhost",  user="players",  passwd="", db="mlb_players")

cur = db.cursor()
cur.execute("select player_id from mlb_players.zips_ros_current where player_id > (select player_id from mlb_players.scrape_batter_flag) order by player_id")

player_ids = cur.fetchall()

if len(player_ids) == 0:
    print("Nothing to scrape")
    db.close()
    sys.exit(0)
else:
    print(str(len(player_ids)) + " Players to scrape")
    for pid in player_ids:
        ScrapePlayer(str(pid[0]))

    print("Process complete")

