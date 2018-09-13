
echo "SCRIPT reporting_script.sh $(date +%T)"

echo "BEGIN load_mlb_wagers.sql $(date +%T)"
timeout 10s mysql mlb_reporting < /home/creich/Desktop/encompass/reporting/MLB/season_2018/load_mlb_wagers.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "BEGIN aggregate_numbers.sql $(date +%T)"
timeout 10s mysql mlb_reporting < /home/creich/Desktop/encompass/reporting/MLB/season_2018/aggregate_numbers.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"
echo "DONE  $(date +%T)"
