
echo "SCRIPT zips_pitchers_ros $(date +%T)"

echo "Remove previously downloaded FanGraphs files"
rm /home/creich/Downloads/FanGraphs*


# Download Zips ROS file
echo "BEGIN download_pitchers_zips.py $(date +%T)"
timeout 120s python3 /home/creich/Desktop/encompass/mlb_players/pitchers_zips_ros/download_pitchers_zips.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "Copy File to working directory"
cp /home/creich/Downloads/FanGraphs* /home/creich/Desktop/encompass/mlb_players/player_artifacts/zips_pitchers_download.csv
tail -n +2 /home/creich/Desktop/encompass/mlb_players/player_artifacts/zips_pitchers_download.csv > /home/creich/Desktop/encompass/mlb_players/player_artifacts/zips_pitchers_download_cleaned.csv
sed -i 's/"//g' /home/creich/Desktop/encompass/mlb_players/player_artifacts/zips_pitchers_download_cleaned.csv
rm /home/creich/Downloads/FanGraphs*



# Load Zips ROS file into DB
echo "BEGIN load_zips_pitchers_ros.py $(date +%T)"
timeout 15s python3 /home/creich/Desktop/encompass/mlb_players/pitchers_zips_ros/load_zips_pitchers_ros.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


# Load Zips ROS file into DB
echo "BEGIN process_zips_pitchers.sql $(date +%T)"
timeout 15s mysql -u players mlb_players < /home/creich/Desktop/encompass/mlb_players/pitchers_zips_ros/process_zips_pitchers.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"




echo "DONE $(date +%T)"
