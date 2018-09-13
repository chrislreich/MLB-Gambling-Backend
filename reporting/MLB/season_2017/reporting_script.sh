
echo "SCRIPT reporting_script.sh $(date +%T)"

echo "BEGIN load_mlb_wagers.sql $(date +%T)"
timeout 10s mysql mlb_reporting < /home/creich/Desktop/encompass/reporting/MLB/season_2017/load_mlb_wagers.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

#input="/home/creich/Desktop/encompass/reporting/MLB/teams.txt"
#while IFS= read -r var
#do
#  mysql mlb_reporting -e"set @team=${var}; `cat /home/creich/Desktop/encompass/reporting/MLB/generic_team_load.sql`" <
#done < "$input"
echo "DONE  $(date +%T)"
