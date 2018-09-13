echo "Checking if node server is running $(date +%T)"


truncate -s 0 /home/creich/Desktop/encompass/artifacts/server_check.txt

ps -ax | grep "nodejs" | grep -v "grep" > /home/creich/Desktop/encompass/artifacts/server_check.txt

num_lines=$(cat /home/creich/Desktop/encompass/artifacts/server_check.txt | wc -l)

if [ $num_lines == 1 ]; then
  echo "Server is Running"
fi

if [ $num_lines == 0 ]; then
  echo "Server not running"
  echo "Starting server $(date +%T)"
  nodejs /home/creich/Desktop/encompass/backend/index.js
fi

echo "Script end $(date +%T)"
