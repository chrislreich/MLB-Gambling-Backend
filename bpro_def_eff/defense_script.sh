echo "SCRIPT defense_script $(date +%T)"

# Scrape Baseball Prospectus Park Adjusted Defensive Efficiency numbers
# Write to TXT file
echo "BEGIN scrape_bpro.py $(date +%T)"
timeout 60s python3 /home/creich/Desktop/encompass/bpro_def_eff/scrape_bpro.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



# READ TXT File
# Write to MySQL database
echo "BEGIN process_file.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/bpro_def_eff/process_file.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Prepare data export
echo "BEGIN process_file.py $(date +%T)"
timeout 10s mysql -u bpro_defense_user bpro_defense < /home/creich/Desktop/encompass/bpro_def_eff/derive_team_name.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "DONE $(date +%T)"
