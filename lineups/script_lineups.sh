echo "SCRIPT script_lineups.sh $(date +%T)"

echo "BEGIN scrape_lineups.py $(date +%T)"
timeout 120s python3 /home/creich/Desktop/encompass/lineups/scrape_lineups.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN lineupsToDB.py $(date +%T)"
timeout 7s python3 /home/creich/Desktop/encompass/lineups/lineupsToDB.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN process_lineups.sql $(date +%T)"
timeout 2s mysql mlb_lineups < /home/creich/Desktop/encompass/lineups/process_lineups.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "DONE $(date +%T)"
