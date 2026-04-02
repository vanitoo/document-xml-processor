mkdir -p ./provisioning/datasources
mkdir -p ./provisioning/dashboards
mkdir -p ./grafana-data
mkdir -p ./loki-data

chown -R 472:472 ./grafana-data
chown -R 10001:10001 ./loki-data
chmod -R 755 ./grafana-data
chmod -R 755 ./loki-data

docker compose down -v
docker compose up -d

