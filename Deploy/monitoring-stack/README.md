# Monitoring stack: Grafana + Loki + Promtail + Prometheus + cAdvisor + Node Exporter

## Что внутри
- Grafana: http://SERVER_IP:3000
- Loki: http://SERVER_IP:3100
- Prometheus: http://SERVER_IP:9090
- cAdvisor: http://SERVER_IP:8080
- Node Exporter: http://SERVER_IP:9100
- Promtail targets: http://SERVER_IP:9080/targets

## Логин в Grafana
- user: admin
- password: admin

## Что уже настроено
- datasource Loki
- datasource Prometheus
- dashboard Docker Logs
- dashboard Container Overview
- dashboard Host Overview
- базовые alert rules в Prometheus

## Установка
1. Распакуй архив в `/srv/monitoring` или другой каталог.
2. Создай директории данных:
   ```bash
   mkdir -p grafana-data loki-data prometheus-data
   ```
3. Выдай права:
   ```bash
   chown -R 472:472 grafana-data
   chown -R 10001:10001 loki-data
   chmod -R 755 grafana-data loki-data prometheus-data
   ```
4. Запусти:
   ```bash
   docker compose up -d
   ```
5. Проверь:
   ```bash
   docker compose ps
   docker compose logs -f promtail
   docker compose logs -f loki
   docker compose logs -f prometheus
   ```

## Полезные проверки
```bash
curl http://127.0.0.1:3100/ready
curl http://127.0.0.1:3100/loki/api/v1/labels
curl http://127.0.0.1:9080/targets
curl http://127.0.0.1:9090/-/healthy
```

## Важно
- Loki на `/` может отдавать 404. Это нормально.
- Для логов используется docker discovery через `/var/run/docker.sock`.
- Чтобы твои сервисы лучше группировались в логах, полезно оставлять labels:
  - `app`
  - `container_name`
  - compose service/project labels Docker Compose добавит сам.

## Что можно добавить потом
- Alertmanager и отправку в Telegram
- blackbox-exporter для HTTP health-check
- отдельные dashboards под api_processor / pdf_processor / cleaner
