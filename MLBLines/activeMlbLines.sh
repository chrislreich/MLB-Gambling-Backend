
echo "SCRIPT MLBLines $(date +%T)"

# Scrape MLB Lines from BetOnline mobile site
# Write to TXT file
echo "BEGIN mlbLinesToTxt.py $(date +%T)"
timeout 20s python3 /home/creich/Desktop/encompass/MLBLines/scrapeMLBLines_v2.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

# READ TXT File
# Write to MySQL database
echo "BEGIN mlbLinesToDB.py $(date +%T)"
timeout 5s python3 /home/creich/Desktop/encompass/MLBLines/mlbLinesToDB.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Process MLB Lines loaded into database
echo "BEGIN load_active_lines.sql $(date +%T)"
timeout 5s mysql -u lines MLBLines < /home/creich/Desktop/encompass/MLBLines/load_active_lines.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



# Initialize Starting Pitcher ID table
echo "BEGIN initialize_starter_id_table.py $(date +%T)"
timeout 3s python3 /home/creich/Desktop/encompass/MLBLines/initialize_starter_id_table.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Find Fangraphs IDs of Startin Pitchers
echo "BEGIN find_fangraphs_ids.sql $(date +%T)"
timeout 7s mysql -u lines rotowire_lineups < /home/creich/Desktop/encompass/MLBLines/find_fangraphs_ids.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



# Populate Starting Pitcher Stats
echo "BEGIN populate_starter_stats.sql $(date +%T)"
timeout 5s mysql -u lines rotowire_lineups < /home/creich/Desktop/encompass/MLBLines/populate_starter_stats.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Merge ZIPS and STEAMER projections together 
echo "BEGIN merge_starter_projections.sql $(date +%T)"
timeout 2s mysql -u lines rotowire_lineups < /home/creich/Desktop/encompass/MLBLines/merge_starter_projections.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "DONE $(date +%T)"
