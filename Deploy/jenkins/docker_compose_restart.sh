docker compose down -v
docker compose build --no-cache
docker compose --env-file .env up -d

