import requests
from lxml import html
import ast

output_file = open("/home/creich/Desktop/encompass/artifacts/pairs_2.txt", "w")

r = requests.get("https://mobile.betonline.ag/sports/offerings?s=Baseball&l=MLB&p=0")

tree = html.fromstring(r.content)

pairs = tree.xpath('//a[@href="#"]')

de_duped_lines = []

for pair in pairs:
    db = pair.get("data-bind")
    if db != None and "attr: " in db:
        json_string = "{" + db.split("{")[1].split("}")[0] + "}"
        json_object = ast.literal_eval(json_string)
        line = json_object['line-value']
        if line not in de_duped_lines:
            de_duped_lines.append(line)


for line in de_duped_lines:
    output_file.write(line + "\n")

print("MLB Lines scraped")
