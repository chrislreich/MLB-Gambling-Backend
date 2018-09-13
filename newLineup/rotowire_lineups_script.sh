echo "SCRIPT rotowire_lineups_script.sh $(date +%T)"

curTime=$(date +%k%M)

if [ $curTime -gt 700 -a $curTime -lt 2330 ]; then
       echo "Time between 7 AM and 11:30 PM"
       echo "Continuing..."
else
 	echo "Time is after 11:30 PM and before 7 AM"
	echo "Exiting..."
	exit 1
fi	

echo "BEGIN scrape_rotowire.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/newLineup/scrape_rotowire_v2.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN rotowire_toDB.py $(date +%T)"
timeout 3s python3 /home/creich/Desktop/encompass/newLineup/rotowire_toDB.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "BEGIN process_rotowire.sql $(date +%T)"
timeout 2s mysql rotowire_lineups < /home/creich/Desktop/encompass/newLineup/process_rotowire.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




echo "BEGIN initialize_player_id_tables.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/newLineup/initialize_player_id_tables.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



echo "BEGIN find_player_ids.sql $(date +%T)"
timeout 26s mysql rotowire_lineups < /home/creich/Desktop/encompass/newLineup/find_player_ids.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




echo "BEGIN populate_batter_stats.sql $(date +%T)"
timeout 2s mysql rotowire_lineups < /home/creich/Desktop/encompass/newLineup/populate_batter_stats.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



echo "BEGIN merge_projections.sql $(date +%T)"
timeout 3s mysql rotowire_lineups < /home/creich/Desktop/encompass/newLineup/merge_projections.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



echo "DONE $(date +%T)"
