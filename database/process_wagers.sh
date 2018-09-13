echo "SCRIPT process_wagers.sh $(date +%T)"

echo "BEGIN alternateLogin.py $(date +%T)"
timeout 120s python3 /home/creich/Desktop/encompass/database/alternateLogin.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"


echo "BEGIN processPendingWagers.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/database/processPendingWagers.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "BEGIN load_pending_wagers.sql $(date +%T)"
timeout 5s mysql wagers < /home/creich/Desktop/encompass/database/load_pending_wagers.sql
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"

echo "BEGIN processHistoricalWagers.py $(date +%T)"
timeout 10s python3 /home/creich/Desktop/encompass/database/processHistoricalWagers.py
ret=$?
if [ $ret -ne 0 ]; then
  echo "RET == $ret"
  exit
fi
echo "END $(date +%T)"



echo "DONE $(date +%T)"
