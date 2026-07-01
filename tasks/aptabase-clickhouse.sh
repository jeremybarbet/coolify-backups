#!/bin/bash

set -e

clickhouse client --host "$CLICKHOUSE_HOST" --port "$CLICKHOUSE_PORT" --user "$CLICKHOUSE_USER" --password "$CLICKHOUSE_PASSWORD" --query "BACKUP DATABASE $CLICKHOUSE_DB TO S3('https://$R2_ACCOUNT_ID.r2.cloudflarestorage.com/coolify-backups/aptabase-clickhouse/$(date +%Y%m%d-%H%M%S)/', '$R2_ACCESS_KEY', '$R2_SECRET_KEY') SETTINGS allow_s3_native_copy = 0"
rclone delete r2:coolify-backups/aptabase-clickhouse/ --min-age 14d
