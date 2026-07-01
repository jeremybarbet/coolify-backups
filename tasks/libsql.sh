#!/bin/bash

set -e

f=/tmp/db-$(date +%Y%m%d-%H%M%S).sql.gz
turso db shell "$SQLD_PRIVATE_URL?authToken=$SQLD_AUTH_TOKEN" ".dump" | gzip > "$f"
rclone copy "$f" r2:coolify-backups/libsql/
rm -f "$f"
rclone delete r2:coolify-backups/libsql/ --min-age 14d
