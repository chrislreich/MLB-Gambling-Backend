echo "SCRIPT scrape_player_pages $(date +%T)"






 #Retrieve ZIPS batting ROS
echo "BEGIN scrape_plaer_pages.py $(date +%T)"
timeout 4500s python3 /home/creich/Desktop/encompass/mlb_players/batters_zips_ros/scrape_player_pages_v2.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""




echo "DONE $(date +%T)"
