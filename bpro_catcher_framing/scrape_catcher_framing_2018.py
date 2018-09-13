import requests
from lxml import html

def text(td):
    return td.findtext('.')

output_file = open("/home/creich/Desktop/encompass/artifacts/bpro_catcher_framing.txt", "w")

pipe = "|"

url = "https://legacy.baseballprospectus.com/sortable/index.php?cid=2519121"

r = requests.get(url)

tree = html.fromstring(r.content)

catchers = []

table = tree.xpath('//table[@id="TTdata"]')[0]

rows = table.xpath('.//tr')

for row in rows:
    if row.get("class") == "TTdata_ltblue":
        print("Skipping header")
        continue

    tds = row.xpath('.//td')
    player_name = tds[1].xpath('.//a')[0].findtext('.')
    framing_chances = text(tds[3])
    csaa = text(tds[4])
    csaa_sd = text(tds[5])
    framing_runs = text(tds[6])
    runs_sd = text(tds[7])
    blocking_chances = text(tds[8])
    epaa = text(tds[9])
    blocking_runs = text(tds[10])
    steal_attempts = text(tds[11])
    sraa = text(tds[12])
    traa = text(tds[13])
    throwing_runs = text(tds[14])
    fraa_adj = text(tds[16])
    fraa = text(tds[17])

    player_row = player_name + pipe + framing_chances + pipe + csaa + pipe + csaa_sd + pipe + framing_runs + pipe + runs_sd + pipe + blocking_chances + pipe + epaa + pipe + blocking_runs + pipe + steal_attempts + pipe + sraa + pipe + traa + pipe + throwing_runs + pipe + fraa_adj + pipe + fraa

    output_file.write(player_row + "\n")


output_file.close()    
