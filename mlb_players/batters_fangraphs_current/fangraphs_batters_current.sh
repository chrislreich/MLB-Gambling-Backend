
echo "SCRIPT fangraphs_batters_current $(date +%T)"

echo "Remove previously downloaded FanGraphs files"
rm /home/creich/Downloads/FanGraphs*


# Download Zips ROS file
echo "BEGIN scrape_fangraphs_batters.py $(date +%T)"
timeout 120s python3 /home/creich/Desktop/encompass/mlb_players/batters_fangraphs_current/scrape_fangraphs_batters.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "Copy File to working directory"
cp /home/creich/Downloads/FanGraphs* /home/creich/Desktop/encompass/mlb_players/player_artifacts/fangraphs_batters_download.csv
tail -n +2 /home/creich/Desktop/encompass/mlb_players/player_artifacts/fangraphs_batters_download.csv > /home/creich/Desktop/encompass/mlb_players/player_artifacts/fangraphs_batters_download_cleaned.csv
sed -i 's/"//g' /home/creich/Desktop/encompass/mlb_players/player_artifacts/fangraphs_batters_download_cleaned.csv
rm /home/creich/Downloads/FanGraphs*



# Load Fangraphs Batters file into DB
echo "BEGIN load_zips_ros_file.py $(date +%T)"
timeout 15s python3 /home/creich/Desktop/encompass/mlb_players/batters_fangraphs_current/load_fangraphs_batters.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




# Load Zips ROS file into DB
echo "BEGIN process_fangraphs_batters.sql $(date +%T)"
timeout 15s mysql -u players mlb_players < /home/creich/Desktop/encompass/mlb_players/batters_fangraphs_current/process_fangraphs_batters.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




echo "DONE $(date +%T)"
