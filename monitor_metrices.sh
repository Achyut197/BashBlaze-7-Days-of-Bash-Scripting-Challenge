#!/bin/bash
echo "----------------"
echo "System Metrics:" 
echo "----------------"
echo "CPU Usage: $(top -bn 1 | awk '/Cpu/ {print $2 + $4}' | awk '{print $1 "%"}')"
echo "Memory Usage: $(free -m | awk '/Mem:/ {print $3 "MB / " $2 "MB (" $3*100/$2 "%)"}')"
echo "Disk Usage: $(df -h / | awk '/\// {print $3 " used / " $2 " (" $5 " used)"}')"

if pgrep -x "jenkins" >/dev/null; then
        echo "jenkins is running."
    else
        echo "Nginx is not running."
    fi

while true; do
    show_system_metrics
    sleep_interval=10
    echo "Refreshing in $sleep_interval seconds..."
    sleep "$sleep_interval"
done
