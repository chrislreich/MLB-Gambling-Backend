echo "SCRIPT master_fangraphs_script.sh $(date +%T)"



# Retrieve Fangraphs batting stats
echo "BEGIN fangraphs_batters_current.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/batters_fangraphs_current/fangraphs_batters_current.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""


# Retrieve Fangraphs standard pitching stats
echo "BEGIN standard_fangraphs_pitching.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/pitchers_fangraphs/standard_fangraphs_pitching.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""

# Retrieve Fangraphs advanced pitching stats
echo "BEGIN standard_fangraphs_pitching.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/pitchers_fangraphs/advanced_fangraphs_pitching.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""



# Retrieve Zips batters ROS
echo "BEGIN zips_ros_batters.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/batters_zips_ros/zips_ros_batters.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""



# Retrieve Zips pitchers ROS
echo "BEGIN zips_pitchers_ros.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/pitchers_zips_ros/zips_pitchers_ros.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""


# Retrieve Steamer batters ROS
echo "BEGIN steamer_batters.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/steamer_ros/steamer_batters.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""



# Retrieve Steamer pitchers ROS
echo "BEGIN steamer_pitchers.sh $(date +%T)"
timeout 300s /home/creich/Desktop/encompass/mlb_players/steamer_ros/steamer_pitchers.sh
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo ""











echo "DONE $(date +%T)"
