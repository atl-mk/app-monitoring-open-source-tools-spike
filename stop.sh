kill -9 $(lsof -i:5990 | rg -o -e "java.*?([0-9]+)" -r '$1' | uniq)
kill -9 $(lsof -i:5991 | rg -o -e "java.*?([0-9]+)" -r '$1' | uniq)
docker stop grafana prometheus
docker rm grafana prometheus