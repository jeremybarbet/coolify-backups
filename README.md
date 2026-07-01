# coolify-backups

Backup containers deployed via Coolify. Each server gets its own Dockerfile and R2 account. `entrypoint.sh` just sets up `rclone` for R2 and idles; backups run on a schedule via Coolify Scheduled Tasks executing `tasks/<app>.sh` inside the container.

## Structure

- `entrypoint.sh`: shared, configures rclone and keeps the container alive.
- `tasks/<app>.sh`: one script per app, containing just its backup command.
- `Dockerfile.*`: one per server, installs the CLI(s) it needs and copies its task script(s).

To add a task: add `tasks/<app>.sh` and a `RUN`/`COPY` block in the relevant Dockerfile for its CLI.

## Coolify setup

1. Point each app at its `Dockerfile.sN`.
2. Add a Scheduled Task per app running its `tasks/<app>.sh` on the desired cron schedule.
