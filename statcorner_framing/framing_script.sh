echo "SCRIPT framing_script $(date +%T)"

# Scrape Statcorner framing stats
# Write to TXT file
echo "BEGIN scrape_framing.py $(date +%T)"
timeout 180s python3 /home/creich/Desktop/encompass/statcorner_framing/scrape_framing.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




# READ TXT File
# Write to MySQL database
echo "BEGIN load_to_db.py $(date +%T)"
timeout 5s python3 /home/creich/Desktop/encompass/statcorner_framing/load_to_db.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Process Framing numbers loaded into database
echo "BEGIN process_tables.sql $(date +%T)"
timeout 5s mysql -u bpro_defense_user bpro_defense < /home/creich/Desktop/encompass/statcorner_framing/process_tables.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "SQL Script Error"
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "DONE $(date +%T)"
