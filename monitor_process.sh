#!/bin/bash
# Bash script that efficiently monitors a specific process on a Linux system. The script's primary goal is to ensure the process is always running, and if it unexpectedly stops, it should be restarted automatically.


process_name="jenkins"
max_restart_attempts=3
notification_threshold=2
notification_recipient="admin@example.com"
log_file="/var/log/process_monitor.log"


while true; do
    if ! pgrep -x "$process_name" >/dev/null; then
        echo "Jenkins process is not running. Restarting..."
        # Assuming Jenkins is started as a service, you can use a command like this to restart it
        sudo systemctl restart jenkins

        echo "Jenkins process restarted."
    fi
    sleep 2  # Adjust the interval between checks as needed
done

attempt=1
    while [ $attempt -le $max_restart_attempts ]; do
        echo "$(date): Attempting to restart $process_name (Attempt $attempt)..." >> "$log_file"
        sudo systemctl restart "$process_name"
        sleep 5  # Give some time before checking if the process restarted
        if check_process; then
            echo "$(date): $process_name restarted successfully." >> "$log_file"
            return 0
        fi
        attempt=$((attempt + 1))
    done
    echo "$(date): $process_name could not be restarted after $max_restart_attempts attempts." >> "$log_file"
    send_notification
    return 1

if [ $attempt -gt $notification_threshold ]; then
        echo "Sending notification..."
        # Replace this with your notification mechanism (e.g., email, Slack)
        echo "Process $process_name requires manual intervention." | mail -s "Process Restart Alert" "$notification_recipient"
    fi
if check_process; then
    exit 0
else
    restart_process
fi
