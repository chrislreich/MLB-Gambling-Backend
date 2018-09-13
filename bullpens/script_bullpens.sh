echo "SCRIPT script_bullpens.sh $(date +%T)"

thisDir="/home/creich/Desktop/encompass/bullpens"
artifactsDir="/home/creich/Desktop/encompass/artifacts"

echo "BEGIN scrape_bullpens.py $(date +%T)"
timeout 400s python3 /home/creich/Desktop/encompass/bullpens/scrape_bullpens.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "BEGIN bullpensToDB.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/bullpens/bullpensToDB.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN initialize_bullpen_ids.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/bullpens/initialize_bullpen_ids.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



echo "BEGIN find_bullpens_ids.sql $(date +%T)"
timeout 10s mysql mlb_bullpens < /home/creich/Desktop/encompass/bullpens/find_bullpens_ids.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN populate_bullpen_stats.sql $(date +%T)"
timeout 10s mysql mlb_bullpens < /home/creich/Desktop/encompass/bullpens/populate_bullpen_stats.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN merge_projections.sql $(date +%T)"
timeout 10s mysql mlb_bullpens < /home/creich/Desktop/encompass/bullpens/merge_projections.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "DONE $(date +%T)"
