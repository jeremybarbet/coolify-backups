#!/bin/bash

set -e
mkdir -p /root/.config/rclone

printf '[r2]\ntype = s3\nprovider = Cloudflare\naccess_key_id = %s\nsecret_access_key = %s\nendpoint = https://%s.r2.cloudflarestorage.com\nregion = auto\nno_check_bucket = true\nno_head = true\n' \
  "$R2_ACCESS_KEY" "$R2_SECRET_KEY" "$R2_ACCOUNT_ID" > /root/.config/rclone/rclone.conf

chmod 600 /root/.config/rclone/rclone.conf

exec tail -f /dev/null
